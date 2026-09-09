const { connectDB, sql } = require("../config/db");

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS Notifications (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            recipientId VARCHAR(50) NOT NULL,
            type VARCHAR(50) NOT NULL,
            title VARCHAR(180) NOT NULL,
            message ${sql.longText} NOT NULL,
            relatedRequestId INT NULL,
            isRead TINYINT(1) NOT NULL DEFAULT 0,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_notifications_recipient (recipientId, isRead, createdAt)
        )
    `);
};

exports.create = async ({ recipientId, type, title, message, relatedRequestId }) => {
    if (!recipientId) return null;
    const pool = await connectDB();
    await ensureTable(pool);
    await pool.execute("INSERT INTO Notifications (recipientId, type, title, message, relatedRequestId) VALUES (?, ?, ?, ?, ?)", [String(recipientId), type, title, message, relatedRequestId || null]);
    return true;
};

exports.list = async (recipientId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    return pool.execute("SELECT * FROM Notifications WHERE recipientId = ? ORDER BY createdAt DESC, id DESC LIMIT 50", [String(recipientId)]);
};

exports.markRead = async (id, recipientId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await pool.execute("UPDATE Notifications SET isRead = 1 WHERE id = ? AND recipientId = ?", [id, String(recipientId)]);
};
