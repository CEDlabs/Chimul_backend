const { connectDB, sql, DB_TYPE } = require("../config/db");

const ensureTable = async (pool) => {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS Sessions (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                userId INT NOT NULL,
                employeeId VARCHAR(50) NULL,
                employeeName VARCHAR(150) NULL,
                email VARCHAR(150) NULL,
                department VARCHAR(100) NULL,
                role VARCHAR(100) NULL,
                token TEXT NOT NULL,
                tabId VARCHAR(100) NULL,
                ipAddress VARCHAR(100) NULL,
                userAgent TEXT NULL,
                expiresAt DATETIME NOT NULL,
                createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
                INDEX idx_session_user (userId),
                INDEX idx_session_expires (expiresAt)
            )
        `);
    } catch (err) {
        console.error("Sessions table ensure error:", err.message);
    }
};

// Idempotent migration: adds Sessions.tabId used to bind a session to a specific
// browser tab (single active session per tab, not per browser cookie).
const ensureSessionsTabColumn = async (pool) => {
    let probe;
    if (DB_TYPE === "mysql") {
        probe = await pool.execute(
            "SELECT COUNT(*) AS c FROM information_schema.COLUMNS " +
            "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'Sessions' AND COLUMN_NAME = 'tabId'"
        );
    } else {
        probe = await pool.execute(
            "SELECT COUNT(*) AS c FROM sys.columns " +
            "WHERE object_id = OBJECT_ID(N'Sessions') AND name = 'tabId'"
        );
    }

    const exists = probe && probe.length > 0 && Number(probe[0].c) > 0;
    if (!exists) {
        const ddl =
            DB_TYPE === "mysql"
                ? "ALTER TABLE Sessions ADD COLUMN tabId VARCHAR(100) NULL"
                : "ALTER TABLE Sessions ADD tabId NVARCHAR(100) NULL";
        await pool.execute(ddl);
    }
};

// Idempotent migration: adds employees.session_version (used to enforce a single
// active login per user). Works for both MySQL and MSSQL without dropping data.
const ensureSessionVersionColumn = async (pool) => {
    let probe;
    if (DB_TYPE === "mysql") {
        probe = await pool.execute(
            "SELECT COUNT(*) AS c FROM information_schema.COLUMNS " +
            "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'employees' AND COLUMN_NAME = 'session_version'"
        );
    } else {
        probe = await pool.execute(
            "SELECT COUNT(*) AS c FROM sys.columns " +
            "WHERE object_id = OBJECT_ID(N'employees') AND name = 'session_version'"
        );
    }

    const exists = probe && probe.length > 0 && Number(probe[0].c) > 0;
    if (!exists) {
        const ddl =
            DB_TYPE === "mysql"
                ? "ALTER TABLE employees ADD COLUMN session_version INT NOT NULL DEFAULT 0"
                : "ALTER TABLE employees ADD session_version INT NOT NULL DEFAULT 0";
        await pool.execute(ddl);
    }
};

// Run once at server startup so the schema always exists before the app serves
// any authenticated request.
exports.initSecuritySchema = async () => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSessionsTabColumn(pool);
    await ensureSessionVersionColumn(pool);
};

// Increments the user's session version and returns the new value. Every login
// bumps it, which instantly invalidates all previously-issued tokens for that
// user (single active session semantics).
exports.bumpSessionVersion = async (userId) => {
    const pool = await connectDB();
    await ensureSessionVersionColumn(pool);

    await pool.execute(
        "UPDATE employees SET session_version = session_version + 1 WHERE id = ?",
        [userId]
    );
    const rows = await pool.execute(
        "SELECT session_version AS v FROM employees WHERE id = ?",
        [userId]
    );
    return rows.length ? Number(rows[0].v) : 1;
};

// Reads the user's current session version (used by auth middleware to reject
// tokens superseded by a newer login).
exports.getSessionVersion = async (userId) => {
    const pool = await connectDB();
    await ensureSessionVersionColumn(pool);

    const rows = await pool.execute(
        "SELECT session_version AS v FROM employees WHERE id = ?",
        [userId]
    );
    return rows.length ? Number(rows[0].v) : null;
};

exports.create = async ({ userId, employeeId, employeeName, email, department, role, token, tabId, ipAddress, userAgent, expiresAt }) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSessionsTabColumn(pool);

    await pool.execute(
        `INSERT INTO Sessions (userId, employeeId, employeeName, email, department, role, token, tabId, ipAddress, userAgent, expiresAt)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [userId, employeeId, employeeName, email, department, role, token, tabId || null, ipAddress || null, userAgent || null, expiresAt]
    );

    return { userId, token, tabId, expiresAt };
};

exports.findByToken = async (token) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSessionsTabColumn(pool);

    const rows = await pool.execute(
        "SELECT * FROM Sessions WHERE token = ? AND expiresAt > NOW()",
        [token]
    );
    return rows.length > 0 ? rows[0] : null;
};

// Finds a session only if its bound tabId matches, so a tab that was superseded
// by a login on a DIFFERENT tab (same browser) is rejected even though both tabs
// share the same cookie.
exports.findByTokenAndTab = async (token, tabId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSessionsTabColumn(pool);

    const rows = await pool.execute(
        "SELECT * FROM Sessions WHERE token = ? AND tabId = ? AND expiresAt > NOW()",
        [token, tabId]
    );
    return rows.length > 0 ? rows[0] : null;
};

exports.deleteByToken = async (token) => {
    const pool = await connectDB();
    await ensureTable(pool);

    await pool.execute("DELETE FROM Sessions WHERE token = ?", [token]);
};

// Deletes only the session belonging to this exact tab, so logging out from one
// tab never logs out another tab.
exports.deleteByTokenAndTab = async (token, tabId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSessionsTabColumn(pool);

    if (tabId) {
        await pool.execute("DELETE FROM Sessions WHERE token = ? AND tabId = ?", [token, tabId]);
    } else {
        await pool.execute("DELETE FROM Sessions WHERE token = ?", [token]);
    }
};

exports.deleteByUserId = async (userId) => {
    const pool = await connectDB();
    await ensureTable(pool);

    await pool.execute("DELETE FROM Sessions WHERE userId = ?", [userId]);
};

exports.deleteExpired = async () => {
    const pool = await connectDB();
    await ensureTable(pool);

    await pool.execute("DELETE FROM Sessions WHERE expiresAt <= NOW()");
};
