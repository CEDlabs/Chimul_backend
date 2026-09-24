const { connectDB, sql } = require("../config/db");

const ensureTables = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS CIPLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            wbEntryId VARCHAR(50) NOT NULL UNIQUE,
            vehicleNumber VARCHAR(20) NOT NULL,
            supervisorId VARCHAR(50) NOT NULL,
            supervisorName VARCHAR(150) NOT NULL,
            startedAt DATETIME NULL,
            completedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            notes ${sql.longText} NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_cip_vehicle (vehicleNumber),
            INDEX idx_cip_completed (completedAt)
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS CIPHelpers (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            cipLogId INT NOT NULL,
            helperId VARCHAR(50) NOT NULL,
            helperName VARCHAR(150) NOT NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            UNIQUE KEY uq_cip_helper (cipLogId, helperId),
            INDEX idx_cip_helpers_log (cipLogId)
        )
    `);
};

const requiredText = (value, field) => {
    const text = String(value || "").trim();
    if (!text) throw new Error(`${field} is required.`);
    return text;
};

exports.ensureTables = ensureTables;

exports.create = async ({ wbEntryId, vehicleNumber, supervisorId, supervisorName, helpers, startedAt, notes }) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const entryId = requiredText(wbEntryId, "Weighbridge entry");
    const vehicle = requiredText(vehicleNumber, "Vehicle number").toUpperCase();
    const sessions = await pool.execute("SELECT vehicleNumber, status FROM WeighBridgeEntries WHERE wbEntryId = ?", [entryId]);
    if (!sessions.length) throw new Error("Weighbridge entry not found.");
    if (String(sessions[0].vehicleNumber).toUpperCase() !== vehicle) throw new Error("Vehicle does not match the weighbridge entry.");
    if (sessions[0].status !== "TarePending") throw new Error("CIP can be recorded only after the tanker dump and before tare weight.");
    const supervisor = {
        id: requiredText(supervisorId, "Supervisor"),
        name: requiredText(supervisorName, "Supervisor name"),
    };
    if (!Array.isArray(helpers) || helpers.length === 0) throw new Error("At least one helper is required.");
    const cleanHelpers = helpers.map((helper) => ({
        id: requiredText(helper.helperId || helper.id, "Helper"),
        name: requiredText(helper.helperName || helper.name, "Helper name"),
    }));
    const uniqueHelpers = [...new Map(cleanHelpers.map((helper) => [helper.id, helper])).values()];
    const existing = await pool.execute("SELECT id FROM CIPLogs WHERE wbEntryId = ?", [entryId]);
    if (existing.length) throw new Error("CIP has already been recorded for this weighbridge entry.");

    const connection = await pool.getConnection();
    try {
        await connection.execute(
            `INSERT INTO CIPLogs (wbEntryId, vehicleNumber, supervisorId, supervisorName, startedAt, notes) VALUES (?, ?, ?, ?, ?, ?)`,
            [entryId, vehicle, supervisor.id, supervisor.name, startedAt ? new Date(startedAt) : null, notes || null]
        );
        const rows = await connection.execute("SELECT id FROM CIPLogs WHERE wbEntryId = ?", [entryId]);
        const cipLogId = rows[0].id;
        for (const helper of uniqueHelpers) {
            await connection.execute("INSERT INTO CIPHelpers (cipLogId, helperId, helperName) VALUES (?, ?, ?)", [cipLogId, helper.id, helper.name]);
        }
        await connection.commit();
        return { id: cipLogId, wbEntryId: entryId, vehicleNumber: vehicle, supervisor, helpers: uniqueHelpers };
    } catch (error) {
        await connection.rollback();
        throw error;
    } finally {
        connection.release();
    }
};

exports.findByWBEntryId = async (wbEntryId) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const rows = await pool.execute("SELECT * FROM CIPLogs WHERE wbEntryId = ?", [wbEntryId]);
    if (!rows.length) return null;
    const helpers = await pool.execute("SELECT helperId, helperName FROM CIPHelpers WHERE cipLogId = ? ORDER BY id", [rows[0].id]);
    return { ...rows[0], helpers };
};

exports.listPending = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    return pool.execute(`
                SELECT wb.wbEntryId, wb.vehicleNumber, wb.grossWeight, wb.intermediateCount,
                             wb.routeName, wb.driverName, wb.updatedAt
                FROM WeighBridgeEntries wb
                WHERE wb.status = 'TarePending'
                    AND NOT EXISTS (SELECT 1 FROM CIPLogs c WHERE c.wbEntryId = wb.wbEntryId)
                ORDER BY wb.updatedAt ASC, wb.id ASC
        `);
};

exports.list = async ({ startDate, endDate, vehicleNumber } = {}) => {
    const pool = await connectDB();
    await ensureTables(pool);
    let query = `
        SELECT c.*, wb.routeName
        FROM CIPLogs c
        LEFT JOIN WeighBridgeEntries wb ON c.wbEntryId = wb.wbEntryId
        WHERE 1 = 1
    `;
    const params = [];
    if (vehicleNumber) { query += " AND c.vehicleNumber = ?"; params.push(String(vehicleNumber).trim().toUpperCase()); }
    if (startDate) { query += " AND c.completedAt >= ?"; params.push(`${startDate}T00:00:00`); }
    if (endDate) { query += " AND c.completedAt <= ?"; params.push(`${endDate}T23:59:59.999`); }
    query += " ORDER BY c.completedAt DESC, c.id DESC";
    const rows = await pool.execute(query, params);
    for (const row of rows) {
        row.helpers = await pool.execute("SELECT helperId, helperName FROM CIPHelpers WHERE cipLogId = ? ORDER BY id", [row.id]);
    }
    return rows;
};
