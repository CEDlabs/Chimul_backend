const { connectDB, sql } = require("../config/db");

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS Notifications (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            recipientId VARCHAR(50) NOT NULL,
            recipientDepartment VARCHAR(100) NULL,
            type VARCHAR(50) NOT NULL,
            title VARCHAR(180) NOT NULL,
            message ${sql.longText} NOT NULL,
            relatedRequestId INT NULL,
            isRead TINYINT(1) NOT NULL DEFAULT 0,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_notifications_recipient (recipientId, isRead, createdAt),
            INDEX idx_notifications_department (recipientDepartment, isRead, createdAt)
        )
    `);
};

exports.create = async ({ recipientId, recipientDepartment, type, title, message, relatedRequestId }) => {
    if (!recipientId) return null;
    const pool = await connectDB();
    await ensureTable(pool);
    await pool.execute("INSERT INTO Notifications (recipientId, recipientDepartment, type, title, message, relatedRequestId) VALUES (?, ?, ?, ?, ?, ?)", [String(recipientId), recipientDepartment || null, type, title, message, relatedRequestId || null]);
    return true;
};

exports.list = async (recipientId, { department, unreadOnly, limit } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    
    let query = "SELECT * FROM Notifications WHERE recipientId = ?";
    const params = [String(recipientId)];
    
    if (department) {
        query += " AND LOWER(TRIM(recipientDepartment)) = ?";
        params.push(String(department).trim().toLowerCase());
    }
    if (unreadOnly) {
        query += " AND isRead = 0";
    }
    query += " ORDER BY createdAt DESC, id DESC";
    if (limit) {
        query += " LIMIT ?";
        params.push(parseInt(limit));
    }
    
    return pool.execute(query, params);
};

exports.listByDepartment = async (recipientId, department) => {
    return exports.list(recipientId, { department });
};

exports.markRead = async (id, recipientId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await pool.execute("UPDATE Notifications SET isRead = 1 WHERE id = ? AND recipientId = ?", [id, String(recipientId)]);
};
