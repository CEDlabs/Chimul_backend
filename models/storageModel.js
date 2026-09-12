const { connectDB, sql, DB_TYPE } = require("../config/db");

const ensureTables = async (pool) => {
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN testResult VARCHAR(20) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN routeNo VARCHAR(100) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN dumpStartTime DATETIME NULL"); } catch {}
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN dumpEndTime DATETIME NULL"); } catch {}
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
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SiloConsumptionLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            siloId INT NOT NULL,
            quantityConsumed DECIMAL(12,3) NOT NULL,
            productName VARCHAR(150) NULL,
            notes ${sql.longText} NULL,
            consumedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            performedById VARCHAR(50) NULL,
            performedByName VARCHAR(150) NULL,
            INDEX idx_silo_consumption_silo (siloId),
            INDEX idx_silo_consumption_date (consumedAt)
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

exports.consumeSilo = async ({ siloId, quantity, productName, notes }, user) => {
    const amount = Number(quantity);
    if (!siloId || !Number.isFinite(amount) || amount <= 0) {
        throw new Error("Silo and a positive consumption quantity are required.");
    }

    const pool = await connectDB();
    await ensureTables(pool);
    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const silos = await conn.execute(
            `SELECT * FROM StorageSilos ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`,
            [siloId]
        );
        if (!silos.length) throw new Error("Silo not found.");
        const silo = silos[0];
        if (silo.status !== "active") throw new Error("Silo is not active.");
        if (Number(silo.currentQuantity) < amount) {
            throw new Error(`Silo "${silo.label || siloId}" does not contain enough milk.`);
        }

        const [userId, userName] = userFields(user);
        await conn.execute(
            `UPDATE StorageSilos SET currentQuantity = currentQuantity - ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`,
            [amount, userId, siloId]
        );
        const insertResult = await conn.execute(
            `INSERT INTO SiloConsumptionLogs (siloId, quantityConsumed, productName, notes, performedById, performedByName) VALUES (?, ?, ?, ?, ?, ?)`,
            [siloId, amount, productName || null, notes || null, userId, userName]
        );
        await conn.commit();
        return {
            consumptionId: insertResult.insertId ?? insertResult[0]?.insertId,
            siloId,
            quantityConsumed: amount,
            remainingQuantity: Number(silo.currentQuantity) - amount,
        };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.dumpToTank = async ({ vehicleNumber, sampleTestReportId, tankId, quantity, notes, routeNo, dumpStartTime, dumpEndTime }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanVehicle = String(vehicleNumber || "").trim().toUpperCase();
    const reportId = String(sampleTestReportId || "").trim();
    const amount = number(quantity, "Dump quantity");
    if (!reportId || !tankId || !amount) {
        throw new Error("Sample test report, destination tank, and positive quantity are required.");
    }

    // Flexible lookup: find test by labTestId, numeric ID, or vehicleNumber
    const tests = await pool.execute(
        `SELECT id, labTestId, vehicleNumber, routeNo, testResult 
         FROM LaboratoryTests 
         WHERE (labTestId = ? OR CAST(id AS CHAR) = ? OR (vehicleNumber = ? AND ? <> ''))
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY id DESC LIMIT 1`,
        [reportId, reportId, cleanVehicle || reportId, cleanVehicle || reportId]
    );
    if (!tests || !tests.length) {
        throw new Error(`Sample test report "${reportId || cleanVehicle}" not found.`);
    }

    const test = tests[0];
    const targetVehicle = cleanVehicle || String(test.vehicleNumber || "").trim().toUpperCase();
    if (cleanVehicle && test.vehicleNumber && cleanVehicle !== String(test.vehicleNumber).trim().toUpperCase()) {
        throw new Error(`Vehicle ${cleanVehicle} does not match sample test report vehicle (${test.vehicleNumber}).`);
    }

    // A lab test is valid unless explicitly marked failed or rejected
    const testResultStr = String(test.testResult || "").trim().toLowerCase();
    if (["fail", "failed", "rejected", "not ok"].includes(testResultStr)) {
        throw new Error("Cannot dump milk from a failed or rejected laboratory test.");
    }

    const previousDumps = await pool.execute(
        "SELECT id FROM TankDumpLogs WHERE sampleTestReportId = ? LIMIT 1",
        [test.labTestId]
    );
    if (previousDumps.length) {
        throw new Error(`Sample test report "${test.labTestId}" has already been dumped.`);
    }

    const resolvedRouteNo = String(routeNo || test.routeNo || "").trim() || null;
    const cleanStartTime = dumpStartTime ? new Date(dumpStartTime) : null;
    const cleanEndTime = dumpEndTime ? new Date(dumpEndTime) : null;

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const tanks = await conn.execute(`SELECT * FROM StorageTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [tankId]);
        if (!tanks.length) throw new Error("Destination tank not found.");
        const tank = tanks[0];
        if (tank.status !== "active") throw new Error(`Destination tank "${tank.label || tankId}" is not active.`);
        const cur = Number(tank.currentQuantity);
        const cap = Number(tank.capacity);
        if (cur + amount > cap) {
            throw new Error(`Dump would exceed tank capacity (Available: ${(cap - cur).toFixed(2)} kg, Requested: ${amount.toFixed(2)} kg).`);
        }
        const [userId, userName] = userFields(user);
        await conn.execute(`UPDATE StorageTanks SET currentQuantity = currentQuantity + ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`, [amount, userId, tankId]);
        await conn.execute(
            `INSERT INTO TankDumpLogs (vehicleNumber, sampleTestReportId, tankId, quantityDumped, performedById, performedByName, notes, routeNo, dumpStartTime, dumpEndTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [targetVehicle, test.labTestId, tankId, amount, userId, userName, notes || null, resolvedRouteNo, cleanStartTime, cleanEndTime]
        );

        // Update GateEntries status to 'Unloaded' if inside plant
        try {
            await conn.execute(
                `UPDATE GateEntries SET vehicleStatus = 'Unloaded', updatedAt = ${sql.now()} 
                 WHERE vehicleNumber = ? AND vehicleStatus IN ('Accepted', 'In Plant', 'Testing Completed', 'Sample Collected') 
                   AND (isDeleted IS NULL OR isDeleted = 0)`,
                [targetVehicle]
            );
        } catch (statusErr) {
            console.warn("Gate entry status update warning:", statusErr.message);
        }

        await conn.commit();
        return {
            tankId,
            vehicleNumber: targetVehicle,
            sampleTestReportId: test.labTestId,
            quantityDumped: amount,
            routeNo: resolvedRouteNo,
            dumpStartTime: cleanStartTime,
            dumpEndTime: cleanEndTime
        };
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
    const cleanVehicle = String(vehicleNumber || "").trim().toUpperCase();
    const reportId = String(sampleTestReportId || "").trim();

    let matchedReportId = reportId;
    if (reportId || cleanVehicle) {
        const tests = await pool.execute(
            `SELECT id, labTestId, vehicleNumber FROM LaboratoryTests 
             WHERE (labTestId = ? OR CAST(id AS CHAR) = ? OR vehicleNumber = ?) 
               AND (isDeleted IS NULL OR isDeleted = 0) 
             ORDER BY id DESC LIMIT 1`,
            [reportId, reportId, cleanVehicle || reportId]
        );
        if (tests && tests.length) {
            matchedReportId = tests[0].labTestId;
            try {
                await pool.execute("UPDATE LaboratoryTests SET testResult = 'Failed' WHERE id = ?", [tests[0].id]);
            } catch {}
        }
    }

    const [userId, userName] = userFields(user);
    await pool.execute(
        `INSERT INTO VehicleRejectionLogs (vehicleNumber, sampleTestReportId, reason, performedById, performedByName) VALUES (?, ?, ?, ?, ?)`,
        [cleanVehicle || "UNKNOWN", matchedReportId || "N/A", reason || "Failed laboratory test", userId, userName]
    );
    if (cleanVehicle) {
        await pool.execute(
            `UPDATE GateEntries SET vehicleStatus = 'Sent Back', updatedAt = ${sql.now()} WHERE vehicleNumber = ? AND (isDeleted IS NULL OR isDeleted = 0)`,
            [cleanVehicle]
        );
    }
    return { vehicleNumber: cleanVehicle, sampleTestReportId: matchedReportId, reason: reason || "Failed laboratory test" };
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

exports.listTestedVehicles = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    const query = `
        SELECT 
            lt.id,
            lt.labTestId,
            lt.vehicleNumber,
            lt.routeNo,
            lt.taluk,
            lt.materialType,
            lt.productName,
            lt.fat,
            lt.snf,
            lt.clr,
            lt.temperature,
            lt.testResult,
            lt.testedAt,
            lt.createdAt,
            COALESCE(
                (SELECT CAST(wb.netWeight AS DECIMAL(12,2)) 
                 FROM WeighBridgeEntries wb 
                 WHERE (wb.wbEntryId = lt.wbEntryId OR wb.vehicleNumber = lt.vehicleNumber) 
                   AND (wb.isDeleted IS NULL OR wb.isDeleted = 0) 
                 ORDER BY wb.id DESC LIMIT 1),
                0
            ) AS netWeight,
            (SELECT COUNT(*) FROM TankDumpLogs tdl WHERE tdl.sampleTestReportId = lt.labTestId) AS dumpCount
        FROM LaboratoryTests lt
        WHERE (lt.isDeleted IS NULL OR lt.isDeleted = 0)
          AND (lt.testResult IS NULL OR LOWER(lt.testResult) NOT IN ('fail', 'failed', 'rejected', 'not ok'))
                    AND NOT EXISTS (
                            SELECT 1 FROM TankDumpLogs tdl
                            WHERE tdl.sampleTestReportId = lt.labTestId
                    )
        ORDER BY lt.id DESC
        LIMIT 50
    `;
    return pool.execute(query);
};
