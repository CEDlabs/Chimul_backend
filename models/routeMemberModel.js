const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

async function ensureRouteMembersTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS RouteMembers (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                routeName VARCHAR(100) NULL,
                memberCode VARCHAR(50) NULL,
                memberName VARCHAR(150) NULL,
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
                INDEX idx_rm_route (routeName),
                INDEX idx_rm_member_code (memberCode),
                INDEX idx_rm_route_code (routeName, memberCode)
            )
        `);
    } catch (e) {
        console.warn("[RouteMembers] Table creation warning:", e.message);
    }

    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'RouteMembers' AND COLUMN_NAME = 'updatedByName'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE RouteMembers ADD COLUMN updatedByName VARCHAR(100) NULL");
        }
    } catch (e) {
        console.warn("[RouteMembers] updatedByName migration warning:", e.message);
    }

    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'RouteMembers' AND COLUMN_NAME = 'updatedByEmpId'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE RouteMembers ADD COLUMN updatedByEmpId VARCHAR(50) NULL");
        }
    } catch (e) {
        console.warn("[RouteMembers] updatedByEmpId migration warning:", e.message);
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

// Master list of members per route. When a vehicle is looked up in Milk
// Collection, the members of that vehicle's route are the default member rows.
exports.getAll = async ({ routeName } = {}) => {
    const pool = await connectDB();
    await ensureRouteMembersTable(pool);

    let query = `SELECT * FROM RouteMembers
                 WHERE (isDeleted IS NULL OR isDeleted = 0)`;
    const params = [];

    if (routeName && String(routeName).trim()) {
        query += ` AND UPPER(${sql.trim("routeName")}) = UPPER(?)`;
        params.push(String(routeName).trim());
    }

    query += " ORDER BY routeName ASC, memberName ASC, id ASC";

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
    await ensureRouteMembersTable(pool);

    const routeName = String(data.routeName || "").trim();
    const memberCode = clamp(data.memberCode, 50).trim();
    const memberName = clamp(data.memberName, 150).trim();

    if (!routeName || !memberCode || !memberName) {
        const err = new Error("Route, member code and member name are required.");
        err.status = 400;
        throw err;
    }

    const existing = await pool.execute(
        `SELECT id, memberCode, memberName FROM RouteMembers
         WHERE UPPER(routeName) = UPPER(?) AND UPPER(memberCode) = UPPER(?)
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [routeName, memberCode]
    );
    if (existing.length > 0) {
        const err = new Error(`Member code ${existing[0].memberCode} is already in route "${routeName}".`);
        err.status = 409;
        throw err;
    }

    const { name, empId, email, dept } = extractUserDetails(user);

    const result = await pool.execute(
        `INSERT INTO RouteMembers
         (routeName, memberCode, memberName, createdByName, createdByEmpId, createdByEmail, createdByDept)
         VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [routeName, memberCode, memberName, name, empId, email, dept]
    );

    return {
        id: result.insertId,
        routeName,
        memberCode,
        memberName,
        createdByName: name,
        createdByEmpId: empId,
        createdByEmail: email,
        createdByDept: dept,
    };
};

exports.update = async (id, data, user = null) => {
    const pool = await connectDB();
    await ensureRouteMembersTable(pool);

    const memberId = parseInt(id, 10);
    if (isNaN(memberId)) throw new Error("Invalid member id.");

    const existingRows = await pool.execute(
        "SELECT * FROM RouteMembers WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [memberId]
    );
    if (existingRows.length === 0) {
        throw new Error("Member not found or already deleted.");
    }

    const existing = existingRows[0];
    const routeName = String(data.routeName !== undefined ? data.routeName : existing.routeName).trim();
    const memberCode = clamp(data.memberCode !== undefined ? data.memberCode : existing.memberCode, 50).trim();
    const memberName = clamp(data.memberName !== undefined ? data.memberName : existing.memberName, 150).trim();

    if (!routeName || !memberCode || !memberName) {
        const err = new Error("Route, member code and member name cannot be empty.");
        err.status = 400;
        throw err;
    }

    const dupName = String(existing.routeName || "").toUpperCase();
    const dupCode = String(existing.memberCode || "").toUpperCase();
    if (routeName.toUpperCase() !== dupName || memberCode.toUpperCase() !== dupCode) {
        const duplicate = await pool.execute(
            `SELECT id, memberCode, memberName FROM RouteMembers
             WHERE UPPER(routeName) = UPPER(?) AND UPPER(memberCode) = UPPER(?)
               AND (isDeleted IS NULL OR isDeleted = 0)
             LIMIT 1`,
            [routeName, memberCode]
        );
        if (duplicate.length > 0 && parseInt(duplicate[0].id, 10) !== memberId) {
            const err = new Error(`Member code ${memberCode} is already in route "${routeName}".`);
            err.status = 409;
            throw err;
        }
    }

    const { name, empId } = extractUserDetails(user);
    await pool.execute(
        `UPDATE RouteMembers SET
            routeName = ?,
            memberCode = ?,
            memberName = ?,
            updatedAt = ${sql.now()},
            updatedByName = ?,
            updatedByEmpId = ?
         WHERE id = ?`,
        [routeName, memberCode, memberName, name, empId, memberId]
    );

    return { id: memberId, routeName, memberCode, memberName };
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureRouteMembersTable(pool);

    const memberId = parseInt(id, 10);
    if (isNaN(memberId)) throw new Error("Invalid member id.");

    const existingRows = await pool.execute(
        "SELECT * FROM RouteMembers WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [memberId]
    );
    if (existingRows.length === 0) {
        throw new Error("Member not found or already deleted.");
    }

    const record = existingRows[0];

    try {
        await AuditLog.create({
            module: "RouteMembers",
            action: "DELETE",
            recordId: String(record.id),
            recordData: { id: record.id, routeName: record.routeName, memberCode: record.memberCode, memberName: record.memberName },
            user,
            ipAddress,
        });
    } catch (_) {}

    const { name, empId } = extractUserDetails(user);
    await pool.execute(
        `UPDATE RouteMembers SET
            isDeleted = 1,
            deletedAt = ${sql.now()},
            deletedBy = ?,
            deletedById = ?
         WHERE id = ?`,
        [name, empId ? String(empId) : null, memberId]
    );

    return true;
};