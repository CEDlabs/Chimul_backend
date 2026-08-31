const { connectDB } = require("../config/db");

const ensureAuditLogTable = async (pool) => {
    try {
        const cols = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AuditLog'"
        );
        if (cols.length === 0) {
            await pool.execute(`
                CREATE TABLE AuditLog (
                    id              INT AUTO_INCREMENT PRIMARY KEY,
                    module          VARCHAR(50)  NOT NULL,
                    action          VARCHAR(50)  NOT NULL,
                    recordId        VARCHAR(50)  NULL,
                    recordData      JSON         NULL,
                    performedBy     VARCHAR(150) NULL,
                    performedById   VARCHAR(50)  NULL,
                    performedByEmail VARCHAR(150) NULL,
                    performedByDept VARCHAR(100) NULL,
                    performedAt     DATETIME DEFAULT CURRENT_TIMESTAMP,
                    ipAddress       VARCHAR(50)  NULL,
                    INDEX idx_al_module   (module),
                    INDEX idx_al_action   (action),
                    INDEX idx_al_record   (recordId),
                    INDEX idx_al_performed (performedAt)
                )
            `);
        }
    } catch (e) {
        console.warn("[AuditLog] Table creation migration warning:", e.message);
    }
};

exports.create = async ({ module, action, recordId, recordData, user, ipAddress }) => {
    const pool = await connectDB();
    await ensureAuditLogTable(pool);

    let recordDataJson = null;
    if (recordData) {
        try {
            recordDataJson = typeof recordData === "string" ? recordData : JSON.stringify(recordData);
        } catch (e) {
            recordDataJson = null;
        }
    }

    await pool.execute(
        `INSERT INTO AuditLog (module, action, recordId, recordData, performedBy, performedById, performedByEmail, performedByDept, ipAddress)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            module || "",
            action || "",
            recordId || null,
            recordDataJson,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            user?.email || null,
            user?.department || null,
            ipAddress || null
        ]
    );
};

exports.getAll = async ({ module, action, startDate, endDate, search, page = 1, limit = 50 } = {}) => {
    const pool = await connectDB();
    await ensureAuditLogTable(pool);

    let query = `SELECT * FROM AuditLog WHERE 1 = 1`;
    const params = [];

    if (module && module.trim()) {
        query += ` AND module = ?`;
        params.push(module.trim());
    }

    if (action && action.trim()) {
        query += ` AND action = ?`;
        params.push(action.trim());
    }

    if (startDate && endDate) {
        query += ` AND (performedAt >= ? AND performedAt <= ?)`;
        params.push(`${startDate}T00:00:00`, `${endDate}T23:59:59.999`);
    }

    if (search && search.trim()) {
        query += ` AND (recordId LIKE ? OR performedBy LIKE ? OR performedById LIKE ? OR module LIKE ?)`;
        const s = `%${search.trim()}%`;
        params.push(s, s, s, s);
    }

    query += ` ORDER BY performedAt DESC, id DESC`;

    const limitVal = parseInt(limit, 10) || 50;
    const offsetVal = (parseInt(page, 10) || 1 - 1) * limitVal;
    query += ` LIMIT ${limitVal} OFFSET ${offsetVal}`;

    const rows = await pool.execute(query, params);
    return rows;
};
