const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

async function ensureBMCTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS BMCs (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                routeName VARCHAR(100) NULL,
                bmcCode VARCHAR(50) NULL,
                bmcName VARCHAR(150) NULL,
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
                INDEX idx_bmc_route (routeName),
                INDEX idx_bmc_code (bmcCode),
                INDEX idx_bmc_route_code (routeName, bmcCode)
            )
        `);
    } catch (e) {
        console.warn("[BMCs] Table creation warning:", e.message);
    }

    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BMCs' AND COLUMN_NAME = 'updatedByName'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE BMCs ADD COLUMN updatedByName VARCHAR(100) NULL");
        }
    } catch (e) {
        console.warn("[BMCs] updatedByName migration warning:", e.message);
    }

    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BMCs' AND COLUMN_NAME = 'updatedByEmpId'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE BMCs ADD COLUMN updatedByEmpId VARCHAR(50) NULL");
        }
    } catch (e) {
        console.warn("[BMCs] updatedByEmpId migration warning:", e.message);
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

// List of BMCs allocated to routes.
exports.getAll = async ({ routeName } = {}) => {
    const pool = await connectDB();
    await ensureBMCTable(pool);

    let query = `SELECT * FROM BMCs
                 WHERE (isDeleted IS NULL OR isDeleted = 0)`;
    const params = [];

    if (routeName && String(routeName).trim()) {
        query += ` AND UPPER(${sql.trim("routeName")}) = UPPER(?)`;
        params.push(String(routeName).trim());
    }

    query += " ORDER BY routeName ASC, bmcName ASC, id ASC";

    const rows = await pool.execute(query, params);
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
    await ensureBMCTable(pool);

    const routeName = String(data.routeName || "").trim();
    const bmcCode = clamp(data.bmcCode, 50).trim();
    const bmcName = clamp(data.bmcName, 150).trim();

    if (!routeName || !bmcCode || !bmcName) {
        const err = new Error("Route, BMC code and BMC name are required.");
        err.status = 400;
        throw err;
    }

// BMC code must be unique globally.
    const sameCode = await pool.execute(
        `SELECT id, bmcCode FROM BMCs
         WHERE UPPER(${sql.trim("bmcCode")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [bmcCode]
    );
    if (sameCode.length > 0) {
        const err = new Error(`BMC code ${bmcCode} is already used (route "${sameCode[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    // BMC name must be unique globally.
    const sameName = await pool.execute(
        `SELECT id, bmcCode, routeName FROM BMCs
         WHERE UPPER(${sql.trim("bmcName")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [bmcName]
    );
    if (sameName.length > 0) {
        const err = new Error(`BMC name "${bmcName}" is already used (route "${sameName[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    const { name, empId, email, dept } = extractUserDetails(user);

    const result = await pool.execute(
        `INSERT INTO BMCs
         (routeName, bmcCode, bmcName, createdByName, createdByEmpId, createdByEmail, createdByDept)
         VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [routeName, bmcCode, bmcName, name, empId, email, dept]
    );

    return {
        id: result.insertId,
        routeName,
        bmcCode,
        bmcName,
        createdByName: name,
        createdByEmpId: empId,
        createdByEmail: email,
        createdByDept: dept,
    };
};

exports.update = async (id, data, user = null) => {
    const pool = await connectDB();
    await ensureBMCTable(pool);

    const bmcId = parseInt(id, 10);
    if (isNaN(bmcId)) throw new Error("Invalid BMC id.");

    const existingRows = await pool.execute(
        "SELECT * FROM BMCs WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [bmcId]
    );
    if (existingRows.length === 0) {
        throw new Error("BMC not found or already deleted.");
    }

    const existing = existingRows[0];
    const routeName = String(data.routeName !== undefined ? data.routeName : existing.routeName).trim();
    const bmcCode = clamp(data.bmcCode !== undefined ? data.bmcCode : existing.bmcCode, 50).trim();
    const bmcName = clamp(data.bmcName !== undefined ? data.bmcName : existing.bmcName, 150).trim();

    if (!routeName || !bmcCode || !bmcName) {
        const err = new Error("Route, BMC code and BMC name cannot be empty.");
        err.status = 400;
        throw err;
    }

    // BMC code must be unique globally (except this BMC).
    const sameCode = await pool.execute(
        `SELECT id, bmcCode, routeName FROM BMCs
         WHERE UPPER(${sql.trim("bmcCode")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [bmcCode]
    );
    if (sameCode.length > 0 && parseInt(sameCode[0].id, 10) !== bmcId) {
        const err = new Error(`BMC code ${bmcCode} is already used (route "${sameCode[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    // BMC name must be unique globally (except this BMC).
    const sameName = await pool.execute(
        `SELECT id, bmcCode, routeName FROM BMCs
         WHERE UPPER(${sql.trim("bmcName")}) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [bmcName]
    );
    if (sameName.length > 0 && parseInt(sameName[0].id, 10) !== bmcId) {
        const err = new Error(`BMC name "${bmcName}" is already used (route "${sameName[0].routeName || "?"}").`);
        err.status = 409;
        throw err;
    }

    const { name, empId } = extractUserDetails(user);
    await pool.execute(
        `UPDATE BMCs SET
            routeName = ?,
            bmcCode = ?,
            bmcName = ?,
            updatedAt = ${sql.now()},
            updatedByName = ?,
            updatedByEmpId = ?
         WHERE id = ?`,
        [routeName, bmcCode, bmcName, name, empId, bmcId]
    );

    return { id: bmcId, routeName, bmcCode, bmcName };
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureBMCTable(pool);

    const bmcId = parseInt(id, 10);
    if (isNaN(bmcId)) throw new Error("Invalid BMC id.");

    const existingRows = await pool.execute(
        "SELECT * FROM BMCs WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [bmcId]
    );
    if (existingRows.length === 0) {
        throw new Error("BMC not found or already deleted.");
    }

    const record = existingRows[0];

    try {
        await AuditLog.create({
            module: "BMCs",
            action: "DELETE",
            recordId: String(record.id),
            recordData: { id: record.id, routeName: record.routeName, bmcCode: record.bmcCode, bmcName: record.bmcName },
            user,
            ipAddress,
        });
    } catch (_) {}

    const { name, empId } = extractUserDetails(user);
    await pool.execute(
        `UPDATE BMCs SET
            isDeleted = 1,
            deletedAt = ${sql.now()},
            deletedBy = ?,
            deletedById = ?
         WHERE id = ?`,
        [name, empId ? String(empId) : null, bmcId]
    );

    return true;
};