const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

async function ensureClusterTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS Clusters (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                bmcId INT NULL,
                bmcCode VARCHAR(50) NULL,
                routeName VARCHAR(100) NULL,
                taluk VARCHAR(100) NULL,
                rtCd VARCHAR(100) NULL,
                bmcType VARCHAR(10) NULL,
                capacity VARCHAR(50) NULL,
                clusterCode VARCHAR(50) NULL,
                clusterName VARCHAR(150) NULL,
                memberCode VARCHAR(50) NULL,
                memberName VARCHAR(150) NULL,
                morningBmcId INT NULL,
                morningBmcCode VARCHAR(50) NULL,
                eveningBmcId INT NULL,
                eveningBmcCode VARCHAR(50) NULL,
                createdByName VARCHAR(100) NULL,
                createdByEmpId VARCHAR(50) NULL,
                createdByEmail VARCHAR(150) NULL,
                createdByDept VARCHAR(100) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                isDeleted TINYINT(1) DEFAULT 0,
                deletedAt DATETIME NULL,
                deletedBy VARCHAR(100) NULL,
                deletedById VARCHAR(50) NULL,
                INDEX idx_cl_bmc (bmcId),
                INDEX idx_cl_route (routeName),
                INDEX idx_cl_cluster_code (clusterCode),
                INDEX idx_cl_member_code (memberCode)
            )
        `);
    } catch (e) {
        console.warn("[Clusters] Table creation warning:", e.message);
    }

    // Best-effort migrations for existing databases.
    const migrations = [
        "ALTER TABLE Clusters ADD COLUMN updatedByName VARCHAR(100) NULL",
        "ALTER TABLE Clusters ADD COLUMN updatedByEmpId VARCHAR(50) NULL",
        "ALTER TABLE Clusters ADD COLUMN taluk VARCHAR(100) NULL",
        "ALTER TABLE Clusters ADD COLUMN rtCd VARCHAR(100) NULL",
        "ALTER TABLE Clusters ADD COLUMN bmcType VARCHAR(10) NULL",
        "ALTER TABLE Clusters ADD COLUMN capacity VARCHAR(50) NULL",
    ];
    for (const stmt of migrations) {
        try { await pool.execute(stmt); } catch (_) {}
    }
}

const extractUserDetails = (user) => {
    let name = null;
    let empId = null;
    let email = null;
    let dept = null;

    if (user && typeof user === "object") {
        name = user.employeeName || user.name || null;
        empId = user.employeeId || user.id || null;
        email = user.email || null;
        dept = user.department || null;
    } else if (typeof user === "string" && user.trim()) {
        name = user.trim();
    }

    return { name, empId, email, dept };
};

const clamp = (value, max) => {
    const s = String(value ?? "");
    return s.length > max ? s.slice(0, max) : s;
};

// List of clusters, optionally filtered by BMC.
exports.getAll = async ({ bmcId, routeName } = {}) => {
    const pool = await connectDB();
    await ensureClusterTable(pool);

    let query = `SELECT * FROM Clusters
                 WHERE (isDeleted IS NULL OR isDeleted = 0)`;
    const params = [];

    if (bmcId && String(bmcId).trim()) {
        query += ` AND bmcId = ?`;
        params.push(parseInt(bmcId, 10));
    }

    if (routeName && String(routeName).trim()) {
        query += ` AND UPPER(${sql.trim("routeName")}) = UPPER(?)`;
        params.push(String(routeName).trim());
    }

    query += " ORDER BY routeName ASC, bmcCode ASC, clusterName ASC, id ASC";

    const rows = await pool.execute(query, params);
    return rows;
};

exports.getByBMC = async (bmcId) => {
    const id = parseInt(bmcId, 10);
    if (isNaN(id)) return [];

    const rows = await exports.getAll({ bmcId: id });
    return rows;
};

exports.getByRoute = async (routeName) => {
    const name = String(routeName || "").trim();
    if (!name) return [];

    const rows = await exports.getAll({ routeName: name });
    if (rows.length) return rows;

    // Fallback: match "011B" -> "11B" and vice versa (leading-zero padding).
    const normalized = name.toUpperCase().replace(/^0+/, "");
    const variants = new Set();
    if (normalized !== name.toUpperCase()) variants.add(normalized);
    variants.add("0" + normalized);
    variants.add("00" + normalized);

    for (const variant of variants) {
        const matched = await exports.getAll({ routeName: variant });
        if (matched.length) return matched;
    }
    return [];
};

exports.create = async (data, user = null) => {
    const pool = await connectDB();
    await ensureClusterTable(pool);

    const routeName = String(data.routeName || "").trim();
    if (!routeName) {
        const err = new Error("Route is required. Select a route first.");
        err.status = 400;
        throw err;
    }

    const memberCode = clamp(data.memberCode, 50).trim();
    const memberName = clamp(data.memberName, 150).trim();
    if (!memberCode || !memberName) {
        const err = new Error("Member code and member name are required.");
        err.status = 400;
        throw err;
    }

    const resolveBmc = async (rawId, label, optional = false) => {
        const id = parseInt(rawId, 10);
        if (isNaN(id)) {
            if (optional) return null;
            const err = new Error(`${label} is required.`);
            err.status = 400;
            throw err;
        }
        const rows = await pool.execute(
            "SELECT id, bmcCode, bmcName, routeName FROM BMCs WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
            [id]
        );
        if (rows.length === 0) {
            const err = new Error(`Selected ${label} not found.`);
            err.status = 400;
            throw err;
        }
        const bmc = rows[0];
        if (String(bmc.routeName || "").trim().toUpperCase() !== routeName.toUpperCase()) {
            const err = new Error(`${label} ${bmc.bmcCode} does not belong to route "${routeName}".`);
            err.status = 400;
            throw err;
        }
        return bmc;
    };

    // Parent BMC of the cluster – the user explicitly picks one from the route's BMCs.
    const parentBmc = await resolveBmc(data.bmcId, "BMC");
    const morningBmc = await resolveBmc(data.morningBmcId, "Morning batch BMC");
    const eveningBmc = await resolveBmc(data.eveningBmcId, "Evening batch BMC");

    // Cluster code/name are optional now – default from the member/batches.
    const clusterCode = clamp(data.clusterCode, 50).trim() || memberCode;
    const clusterName = clamp(data.clusterName, 150).trim() || memberName;

    const bmcId = parentBmc.id;
    const bmcCode = parentBmc.bmcCode;

    // Member code must be unique globally.
    const sameCode = await pool.execute(
        `SELECT id, memberCode, routeName FROM Clusters
         WHERE UPPER(${sql.trim("memberCode")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [memberCode]
    );
    if (sameCode.length > 0) {
        const err = new Error(`Member code ${sameCode[0].memberCode} is already used (route "${sameCode[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    // Member name must be unique globally.
    const sameName = await pool.execute(
        `SELECT id, memberName, routeName FROM Clusters
         WHERE UPPER(${sql.trim("memberName")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [memberName]
    );
    if (sameName.length > 0) {
        const err = new Error(`Member name "${sameName[0].memberName}" is already used (route "${sameName[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    const { name, empId, email, dept } = extractUserDetails(user);

    const result = await pool.execute(
        `INSERT INTO Clusters
         (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity,
          clusterCode, clusterName, memberCode, memberName,
          morningBmcId, morningBmcCode, eveningBmcId, eveningBmcCode,
          createdByName, createdByEmpId, createdByEmail, createdByDept)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            bmcId, bmcCode, routeName,
            clamp(data.taluk, 100).trim() || null,
            clamp(data.rtCd, 100).trim() || null,
            clamp(data.bmcType, 10).trim() || null,
            clamp(data.capacity, 50).trim() || null,
            clusterCode, clusterName, memberCode, memberName,
            morningBmc.id, morningBmc.bmcCode, eveningBmc.id, eveningBmc.bmcCode,
            name, empId, email, dept,
        ]
    );

    return {
        id: result.insertId,
        bmcId, bmcCode, routeName,
        taluk: clamp(data.taluk, 100).trim() || null,
        rtCd: clamp(data.rtCd, 100).trim() || null,
        bmcType: clamp(data.bmcType, 10).trim() || null,
        capacity: clamp(data.capacity, 50).trim() || null,
        clusterCode, clusterName, memberCode, memberName,
        morningBmcId: morningBmc.id, morningBmcCode: morningBmc.bmcCode,
        eveningBmcId: eveningBmc.id, eveningBmcCode: eveningBmc.bmcCode,
        createdByName: name, createdByEmpId: empId,
    };
};

exports.update = async (id, data, user = null) => {
    const pool = await connectDB();
    await ensureClusterTable(pool);

    const clusterId = parseInt(id, 10);
    if (isNaN(clusterId)) throw new Error("Invalid cluster id.");

    const existingRows = await pool.execute(
        "SELECT * FROM Clusters WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [clusterId]
    );
    if (existingRows.length === 0) {
        throw new Error("Cluster not found or already deleted.");
    }

    const existing = existingRows[0];

    const routeName = String(data.routeName !== undefined ? data.routeName : existing.routeName).trim();
    const memberCode = clamp(data.memberCode !== undefined ? data.memberCode : existing.memberCode, 50).trim();
    const memberName = clamp(data.memberName !== undefined ? data.memberName : existing.memberName, 150).trim();
    const clusterCode = clamp(data.clusterCode !== undefined ? data.clusterCode : existing.clusterCode, 50).trim();
    const clusterName = clamp(data.clusterName !== undefined ? data.clusterName : existing.clusterName, 150).trim();

    if (!routeName || ((!memberCode && !clusterCode) || (!memberName && !clusterName))) {
        const err = new Error("Route and at least one of (memberCode/clusterCode) and (memberName/clusterName) are required.");
        err.status = 400;
        throw err;
    }

    const resolveBmc = async (rawId, label) => {
        const id = parseInt(rawId, 10);
        if (isNaN(id)) {
            const err = new Error(`${label} is required.`);
            err.status = 400;
            throw err;
        }
        const rows = await pool.execute(
            "SELECT id, bmcCode, bmcName, routeName FROM BMCs WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
            [id]
        );
        if (rows.length === 0) {
            const err = new Error(`Selected ${label} not found.`);
            err.status = 400;
            throw err;
        }
        const bmc = rows[0];
        if (String(bmc.routeName || "").trim().toUpperCase() !== routeName.toUpperCase()) {
            const err = new Error(`${label} ${bmc.bmcCode} does not belong to route "${routeName}".`);
            err.status = 400;
            throw err;
        }
        return bmc;
    };

    const parentRawId = data.bmcId !== undefined ? data.bmcId : existing.bmcId;
    const morningRawId = data.morningBmcId !== undefined ? data.morningBmcId : existing.morningBmcId;
    const eveningRawId = data.eveningBmcId !== undefined ? data.eveningBmcId : existing.eveningBmcId;
    const parentBmc = await resolveBmc(parentRawId, "BMC");
    const morningBmc = await resolveBmc(morningRawId, "Morning batch BMC");
    const eveningBmc = await resolveBmc(eveningRawId, "Evening batch BMC");

    // Cluster code/name stay as-is (or keep defaults) when not provided.
    const finalClusterCode = clusterCode || memberCode;
    const finalClusterName = clusterName || memberName;

    // Parent BMC is what the user picked for this cluster.
    const bmcId = parentBmc.id;
    const bmcCode = parentBmc.bmcCode;

    // Member code must be unique globally (except this cluster).
    const sameCode = await pool.execute(
        `SELECT id, memberCode, routeName FROM Clusters
         WHERE UPPER(${sql.trim("memberCode")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [memberCode]
    );
    if (sameCode.length > 0 && parseInt(sameCode[0].id, 10) !== clusterId) {
        const err = new Error(`Member code ${sameCode[0].memberCode} is already used (route "${sameCode[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    // Member name must be unique globally (except this cluster).
    const sameName = await pool.execute(
        `SELECT id, memberName, routeName FROM Clusters
         WHERE UPPER(${sql.trim("memberName")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [memberName]
    );
    if (sameName.length > 0 && parseInt(sameName[0].id, 10) !== clusterId) {
        const err = new Error(`Member name "${sameName[0].memberName}" is already used (route "${sameName[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    const { name, empId } = extractUserDetails(user);
    const taluk = data.taluk !== undefined ? clamp(data.taluk, 100).trim() : (existing.taluk || null);
    const rtCd = data.rtCd !== undefined ? clamp(data.rtCd, 100).trim() : (existing.rtCd || null);
    const bmcType = data.bmcType !== undefined ? clamp(data.bmcType, 10).trim() : (existing.bmcType || null);
    const capacity = data.capacity !== undefined ? clamp(data.capacity, 50).trim() : (existing.capacity || null);

    await pool.execute(
        `UPDATE Clusters SET
            bmcId = ?,
            bmcCode = ?,
            routeName = ?,
            taluk = ?,
            rtCd = ?,
            bmcType = ?,
            capacity = ?,
            clusterCode = ?,
            clusterName = ?,
            memberCode = ?,
            memberName = ?,
            morningBmcId = ?,
            morningBmcCode = ?,
            eveningBmcId = ?,
            eveningBmcCode = ?,
            updatedAt = ${sql.now()},
            updatedByName = ?,
            updatedByEmpId = ?
         WHERE id = ?`,
        [
            bmcId, bmcCode, routeName,
            taluk || null, rtCd || null, bmcType || null, capacity || null,
            finalClusterCode, finalClusterName, memberCode, memberName,
            morningBmc.id, morningBmc.bmcCode, eveningBmc.id, eveningBmc.bmcCode,
            name, empId, clusterId,
        ]
    );

    return {
        id: clusterId,
        bmcId, bmcCode, routeName,
        taluk, rtCd, bmcType, capacity,
        clusterCode, clusterName, memberCode, memberName,
        morningBmcId: morningBmc.id, morningBmcCode: morningBmc.bmcCode,
        eveningBmcId: eveningBmc.id, eveningBmcCode: eveningBmc.bmcCode,
    };
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureClusterTable(pool);

    const clusterId = parseInt(id, 10);
    if (isNaN(clusterId)) throw new Error("Invalid cluster id.");

    const existingRows = await pool.execute(
        "SELECT * FROM Clusters WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [clusterId]
    );
    if (existingRows.length === 0) {
        throw new Error("Cluster not found or already deleted.");
    }

    const record = existingRows[0];

    try {
        await AuditLog.create({
            module: "Clusters",
            action: "DELETE",
            recordId: String(record.id),
            recordData: { id: record.id, clusterCode: record.clusterCode, memberCode: record.memberCode, memberName: record.memberName },
            user,
            ipAddress,
        });
    } catch (_) {}

    const { name, empId } = extractUserDetails(user);
    await pool.execute(
        `UPDATE Clusters SET
            isDeleted = 1,
            deletedAt = ${sql.now()},
            deletedBy = ?,
            deletedById = ?
         WHERE id = ?`,
        [name, empId ? String(empId) : null, clusterId]
    );

    return true;
};