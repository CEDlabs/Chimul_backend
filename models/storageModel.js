const { connectDB, sql, DB_TYPE } = require("../config/db");

const ensureTables = async (pool) => {
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN testResult VARCHAR(20) NULL"); } catch {}
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS StorageTanks (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            label VARCHAR(100) NOT NULL UNIQUE,
            capacity DECIMAL(12,3) NOT NULL,
            currentQuantity DECIMAL(12,3) NOT NULL DEFAULT 0,
            status VARCHAR(30) NOT NULL DEFAULT 'active',
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            createdById VARCHAR(50) NULL,
            updatedById VARCHAR(50) NULL
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS StorageSilos (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            label VARCHAR(100) NOT NULL UNIQUE,
            capacity DECIMAL(12,3) NOT NULL,
            currentQuantity DECIMAL(12,3) NOT NULL DEFAULT 0,
            linkedProductRequestId VARCHAR(50) NULL,
            currentFat DECIMAL(8,3) NULL,
            currentSnf DECIMAL(8,3) NULL,
            status VARCHAR(30) NOT NULL DEFAULT 'active',
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            createdById VARCHAR(50) NULL,
            updatedById VARCHAR(50) NULL
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS TankDumpLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            vehicleNumber VARCHAR(50) NOT NULL,
            sampleTestReportId VARCHAR(50) NOT NULL,
            tankId INT NOT NULL,
            quantityDumped DECIMAL(12,3) NOT NULL,
            dumpedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            performedById VARCHAR(50) NULL,
            performedByName VARCHAR(150) NULL,
            notes ${sql.longText} NULL,
            INDEX idx_tank_dump_tank (tankId),
            INDEX idx_tank_dump_vehicle (vehicleNumber),
            INDEX idx_tank_dump_report (sampleTestReportId),
            INDEX idx_tank_dump_date (dumpedAt)
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS VehicleRejectionLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            vehicleNumber VARCHAR(50) NOT NULL,
            sampleTestReportId VARCHAR(50) NOT NULL,
            rejectedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            reason VARCHAR(255) NOT NULL DEFAULT 'Failed laboratory test',
            performedById VARCHAR(50) NULL,
            performedByName VARCHAR(150) NULL,
            INDEX idx_rejection_vehicle (vehicleNumber),
            INDEX idx_rejection_report (sampleTestReportId)
        )
    `);
};

const number = (value, field) => {
    const parsed = Number(value);
    if (!Number.isFinite(parsed) || parsed < 0) throw new Error(`${field} must be a non-negative number.`);
    return parsed;
};

const userFields = (user) => [user?.id || user?.employeeId || null, user?.employeeName || null];

exports.listTanks = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    return pool.execute("SELECT * FROM StorageTanks ORDER BY label, id");
};

exports.createTank = async ({ label, capacity, status = "active" }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanLabel = String(label || "").trim();
    if (!cleanLabel) throw new Error("Tank label is required.");
    const cleanCapacity = number(capacity, "Tank capacity");
    if (!cleanCapacity) throw new Error("Tank capacity must be greater than zero.");
    const [userId] = userFields(user);
    await pool.execute(
        `INSERT INTO StorageTanks (label, capacity, status, createdById, updatedById) VALUES (?, ?, ?, ?, ?)`,
        [cleanLabel, cleanCapacity, status, userId, userId]
    );
    return (await pool.execute("SELECT * FROM StorageTanks WHERE label = ?", [cleanLabel]))[0];
};

exports.updateTank = async (id, { label, capacity, status }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const rows = await pool.execute("SELECT * FROM StorageTanks WHERE id = ?", [id]);
    if (!rows.length) throw new Error("Tank not found.");
    const existing = rows[0];
    const nextCapacity = capacity === undefined ? Number(existing.capacity) : number(capacity, "Tank capacity");
    if (nextCapacity < Number(existing.currentQuantity)) throw new Error("Capacity cannot be below current quantity.");
    const nextLabel = label === undefined ? existing.label : String(label).trim();
    if (!nextLabel) throw new Error("Tank label is required.");
    const [userId] = userFields(user);
    await pool.execute(
        `UPDATE StorageTanks SET label = ?, capacity = ?, status = ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`,
        [nextLabel, nextCapacity, status || existing.status, userId, id]
    );
    return (await pool.execute("SELECT * FROM StorageTanks WHERE id = ?", [id]))[0];
};

exports.deactivateTank = async (id, user) => exports.updateTank(id, { status: "inactive" }, user);

exports.listSilos = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    return pool.execute("SELECT * FROM StorageSilos ORDER BY label, id");
};

exports.createSilo = async ({ label, capacity, status = "active" }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanLabel = String(label || "").trim();
    if (!cleanLabel) throw new Error("Silo label is required.");
    const cleanCapacity = number(capacity, "Silo capacity");
    if (!cleanCapacity) throw new Error("Silo capacity must be greater than zero.");
    const [userId] = userFields(user);
    await pool.execute(
        `INSERT INTO StorageSilos (label, capacity, status, createdById, updatedById) VALUES (?, ?, ?, ?, ?)`,
        [cleanLabel, cleanCapacity, status, userId, userId]
    );
    return (await pool.execute("SELECT * FROM StorageSilos WHERE label = ?", [cleanLabel]))[0];
};

exports.updateSilo = async (id, { label, capacity, status }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const rows = await pool.execute("SELECT * FROM StorageSilos WHERE id = ?", [id]);
    if (!rows.length) throw new Error("Silo not found.");
    const existing = rows[0];
    const nextCapacity = capacity === undefined ? Number(existing.capacity) : number(capacity, "Silo capacity");
    if (nextCapacity < Number(existing.currentQuantity)) throw new Error("Capacity cannot be below current quantity.");
    const nextLabel = label === undefined ? existing.label : String(label).trim();
    if (!nextLabel) throw new Error("Silo label is required.");
    const [userId] = userFields(user);
    await pool.execute(
        `UPDATE StorageSilos SET label = ?, capacity = ?, status = ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`,
        [nextLabel, nextCapacity, status || existing.status, userId, id]
    );
    return (await pool.execute("SELECT * FROM StorageSilos WHERE id = ?", [id]))[0];
};

exports.deactivateSilo = async (id, user) => exports.updateSilo(id, { status: "inactive" }, user);

exports.dumpToTank = async ({ vehicleNumber, sampleTestReportId, tankId, quantity, notes }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanVehicle = String(vehicleNumber || "").trim().toUpperCase();
    const reportId = String(sampleTestReportId || "").trim();
    const amount = number(quantity, "Dump quantity");
    if (!cleanVehicle || !reportId || !tankId || !amount) throw new Error("Vehicle, test report, tank and positive quantity are required.");

    const test = await pool.execute(
        "SELECT vehicleNumber, testResult FROM LaboratoryTests WHERE labTestId = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [reportId]
    );
    if (!test.length) throw new Error("Sample test report not found.");
    if (String(test[0].vehicleNumber).toUpperCase() !== cleanVehicle) throw new Error("Vehicle does not match the sample test report.");
    if (!['ok', 'pass', 'passed'].includes(String(test[0].testResult || "").trim().toLowerCase())) throw new Error("Only a passed sample test can be dumped to a tank.");

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const tanks = await conn.execute(`SELECT * FROM StorageTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [tankId]);
        if (!tanks.length) throw new Error("Tank not found.");
        const tank = tanks[0];
        if (tank.status !== "active") throw new Error("Tank is not active.");
        if (Number(tank.currentQuantity) + amount > Number(tank.capacity)) throw new Error("Dump would exceed tank capacity.");
        const [userId, userName] = userFields(user);
        await conn.execute(`UPDATE StorageTanks SET currentQuantity = currentQuantity + ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`, [amount, userId, tankId]);
        await conn.execute(`INSERT INTO TankDumpLogs (vehicleNumber, sampleTestReportId, tankId, quantityDumped, performedById, performedByName, notes) VALUES (?, ?, ?, ?, ?, ?, ?)`, [cleanVehicle, reportId, tankId, amount, userId, userName, notes || null]);
        await conn.commit();
        return { tankId, vehicleNumber: cleanVehicle, sampleTestReportId: reportId, quantityDumped: amount };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.rejectVehicle = async ({ vehicleNumber, sampleTestReportId, reason }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const [userId, userName] = userFields(user);
    await pool.execute(
        `INSERT INTO VehicleRejectionLogs (vehicleNumber, sampleTestReportId, reason, performedById, performedByName) VALUES (?, ?, ?, ?, ?)`,
        [String(vehicleNumber || "").trim().toUpperCase(), String(sampleTestReportId || "").trim(), reason || "Failed laboratory test", userId, userName]
    );
    await pool.execute(
        `UPDATE GateEntries SET vehicleStatus = 'Sent Back', updatedAt = ${sql.now()} WHERE vehicleNumber = ? AND (isDeleted IS NULL OR isDeleted = 0)`,
        [String(vehicleNumber || "").trim().toUpperCase()]
    );
    return { vehicleNumber, sampleTestReportId, reason: reason || "Failed laboratory test" };
};

exports.dumpHistory = async ({ tankId, vehicleNumber, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTables(pool);
    let query = `SELECT d.*, t.label AS tankLabel FROM TankDumpLogs d LEFT JOIN StorageTanks t ON t.id = d.tankId WHERE 1 = 1`;
    const params = [];
    if (tankId) { query += " AND d.tankId = ?"; params.push(tankId); }
    if (vehicleNumber) { query += " AND d.vehicleNumber = ?"; params.push(String(vehicleNumber).trim().toUpperCase()); }
    if (startDate) { query += " AND d.dumpedAt >= ?"; params.push(`${startDate}T00:00:00`); }
    if (endDate) { query += " AND d.dumpedAt <= ?"; params.push(`${endDate}T23:59:59.999`); }
    query += " ORDER BY d.dumpedAt DESC, d.id DESC";
    return pool.execute(query, params);
};
