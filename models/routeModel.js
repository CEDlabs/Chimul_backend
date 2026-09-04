const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

async function ensureRoutesTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS Routes (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                routeName VARCHAR(50) NOT NULL UNIQUE,
                taluk VARCHAR(100) NULL,
                description VARCHAR(255) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                isDeleted TINYINT(1) DEFAULT 0,
                deletedAt DATETIME NULL,
                deletedBy VARCHAR(100) NULL,
                deletedById VARCHAR(50) NULL,
                INDEX idx_routes_name (routeName),
                INDEX idx_routes_taluk (taluk)
            )
        `);
    } catch (e) {
        console.warn("[Routes] Table creation warning:", e.message);
    }
}

const normalizeRow = (row) => {
    if (!row) return null;
    return {
        ...row,
        createdAt: row.createdAt ? String(row.createdAt).slice(0, 19).replace("T", " ") : null,
        updatedAt: row.updatedAt ? String(row.updatedAt).slice(0, 19).replace("T", " ") : null,
    };
};

exports.getAll = async () => {
    const pool = await connectDB();
    await ensureRoutesTable(pool);

    const rows = await pool.execute(
        `SELECT * FROM Routes
         WHERE (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY
           LENGTH(routeName) ASC,
           CAST(IF(SUBSTRING(routeName, 1, 1) REGEXP '^[0-9]', SUBSTRING_INDEX(routeName, 'B', 1), 999) AS UNSIGNED) ASC,
           routeName ASC`
    );
    return rows.map(normalizeRow);
};

exports.findByRouteName = async (routeName) => {
    const pool = await connectDB();
    await ensureRoutesTable(pool);

    const rName = String(routeName || "").trim();
    if (!rName) return null;

    const rows = await pool.execute(
        `SELECT * FROM Routes
         WHERE UPPER(routeName) = UPPER(?) AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [rName]
    );
    return normalizeRow(rows[0]);
};

exports.create = async (data, user = null) => {
    const pool = await connectDB();
    await ensureRoutesTable(pool);

    const routeName = String(data.routeName || "").trim().toUpperCase();
    const taluk = String(data.taluk || "").trim();
    const description = String(data.description || "").trim();

    if (!routeName) throw new Error("Route name is required.");

    const existing = await exports.findByRouteName(routeName);
    if (existing) {
        throw new Error(`Route "${routeName}" already exists.`);
    }

    await pool.execute(
        `INSERT INTO Routes (routeName, taluk, description, createdAt, updatedAt)
         VALUES (?, ?, ?, ${sql.now()}, ${sql.now()})`,
        [routeName, taluk || null, description || null]
    );

    return await exports.findByRouteName(routeName);
};

exports.update = async (id, data, user = null) => {
    const pool = await connectDB();
    await ensureRoutesTable(pool);

    const routeId = parseInt(id, 10);
    if (isNaN(routeId)) throw new Error("Invalid route ID.");

    const existingRows = await pool.execute(
        "SELECT * FROM Routes WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [routeId]
    );

    if (!existingRows || existingRows.length === 0) {
        throw new Error("Route not found or already deleted.");
    }

    const existing = existingRows[0];
    const routeName = data.routeName !== undefined ? String(data.routeName).trim().toUpperCase() : existing.routeName;
    const taluk = data.taluk !== undefined ? String(data.taluk).trim() : existing.taluk;
    const description = data.description !== undefined ? String(data.description).trim() : existing.description;

    if (!routeName) throw new Error("Route name cannot be empty.");

    if (routeName !== existing.routeName) {
        const duplicate = await exports.findByRouteName(routeName);
        if (duplicate && duplicate.id !== routeId) {
            throw new Error(`Route "${routeName}" already exists.`);
        }
    }

    await pool.execute(
        `UPDATE Routes SET
            routeName = ?,
            taluk = ?,
            description = ?,
            updatedAt = ${sql.now()}
         WHERE id = ?`,
        [routeName, taluk || null, description || null, routeId]
    );

    return await exports.findByRouteName(routeName);
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureRoutesTable(pool);

    const routeId = parseInt(id, 10);
    if (isNaN(routeId)) throw new Error("Invalid route ID.");

    const existingRows = await pool.execute(
        "SELECT * FROM Routes WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [routeId]
    );

    if (!existingRows || existingRows.length === 0) {
        throw new Error("Route not found or already deleted.");
    }

    const record = existingRows[0];

    try {
        await AuditLog.create({
            module: "RouteMaster",
            action: "DELETE",
            recordId: String(record.id),
            recordData: { id: record.id, routeName: record.routeName, taluk: record.taluk },
            user,
            ipAddress,
        });
    } catch (_) {}

    const userName = user?.employeeName || user?.name || null;
    const userId = user?.employeeId || user?.id || null;

    await pool.execute(
        `UPDATE Routes SET
            isDeleted = 1,
            deletedAt = ${sql.now()},
            deletedBy = ?,
            deletedById = ?
         WHERE id = ?`,
        [userName, userId ? String(userId) : null, routeId]
    );

    return true;
};
