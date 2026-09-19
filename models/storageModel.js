const { connectDB, sql, DB_TYPE } = require("../config/db");

const ensureTables = async (pool) => {
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN testResult VARCHAR(20) NULL"); } catch { }
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN routeNo VARCHAR(100) NULL"); } catch { }
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN dumpStartTime DATETIME NULL"); } catch { }
    try { await pool.execute("ALTER TABLE TankDumpLogs ADD COLUMN dumpEndTime DATETIME NULL"); } catch { }
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
        CREATE TABLE IF NOT EXISTS RinseTanks (
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
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS DepartmentMilkAllotments (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            department VARCHAR(100) NOT NULL,
            productId INT NULL,
            productName VARCHAR(150) NOT NULL,
            sourceSiloId INT NOT NULL,
            sourceSiloLabel VARCHAR(100) NULL,
            allottedQuantity DECIMAL(12,3) NOT NULL,
            usedQuantity DECIMAL(12,3) NOT NULL DEFAULT 0,
            returnedQuantity DECIMAL(12,3) NOT NULL DEFAULT 0,
            rinseTankId INT NULL,
            rinseTankLabel VARCHAR(100) NULL,
            status VARCHAR(30) NOT NULL DEFAULT 'allotted',
            allottedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            allottedStartTime DATETIME NULL,
            allottedEndTime DATETIME NULL,
            allottedById VARCHAR(50) NULL,
            allottedByName VARCHAR(150) NULL,
            returnedAt DATETIME NULL,
            returnStartTime DATETIME NULL,
            returnEndTime DATETIME NULL,
            returnedById VARCHAR(50) NULL,
            returnedByName VARCHAR(150) NULL,
            batchNumber VARCHAR(100) NULL,
            notes ${sql.longText} NULL,
            INDEX idx_allot_dept (department),
            INDEX idx_allot_status (status),
            INDEX idx_allot_date (allottedAt)
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS RinseTankTransferLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            rinseTankId INT NOT NULL,
            rinseTankLabel VARCHAR(100) NOT NULL,
            destinationType VARCHAR(20) NOT NULL,
            destinationId INT NOT NULL,
            destinationLabel VARCHAR(100) NOT NULL,
            quantity DECIMAL(12,3) NOT NULL,
            transferredAt DATETIME NOT NULL DEFAULT ${sql.now()},
            startTime DATETIME NULL,
            endTime DATETIME NULL,
            performedById VARCHAR(50) NULL,
            performedByName VARCHAR(150) NULL,
            notes ${sql.longText} NULL,
            INDEX idx_rinse_transfer_date (transferredAt)
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS TankerLoadingLogs (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            vehicleNumber VARCHAR(50) NOT NULL,
            cipLogId INT NULL,
            cipCompletedAt DATETIME NULL,
            sourceType VARCHAR(20) NOT NULL DEFAULT 'tank',
            sourceId INT NOT NULL,
            sourceLabel VARCHAR(100) NOT NULL,
            quantity DECIMAL(12,3) NOT NULL,
            fat DECIMAL(8,3) NULL,
            snf DECIMAL(8,3) NULL,
            temperature DECIMAL(6,2) NULL,
            startTime DATETIME NULL,
            endTime DATETIME NULL,
            loadedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            destination VARCHAR(150) NULL,
            performedById VARCHAR(50) NULL,
            performedByName VARCHAR(150) NULL,
            notes ${sql.longText} NULL,
            INDEX idx_tloading_vehicle (vehicleNumber),
            INDEX idx_tloading_date (loadedAt)
        )
    `);

    // Seed default tanks if empty
    try {
        const tanks = await pool.execute("SELECT COUNT(*) AS c FROM StorageTanks");
        if (Number(tanks[0]?.c || 0) === 0) {
            await pool.execute(`
                INSERT INTO StorageTanks (label, capacity, currentQuantity, status) VALUES
                ('Tank A (Raw Milk)', 100000.000, 52000.000, 'active'),
                ('Tank B (Raw Milk)', 100000.000, 68000.000, 'active'),
                ('Tank C (Chilled Milk)', 60000.000, 36000.000, 'active'),
                ('Tank D (Chilled Milk)', 60000.000, 24000.000, 'active')
            `);
        }
    } catch { }

    // Seed default silos if empty
    try {
        const silos = await pool.execute("SELECT COUNT(*) AS c FROM StorageSilos");
        if (Number(silos[0]?.c || 0) === 0) {
            await pool.execute(`
                INSERT INTO StorageSilos (label, capacity, currentQuantity, currentFat, currentSnf, status) VALUES
                ('Silo 1 (Standardized Milk)', 30000.000, 18500.000, 4.500, 8.500, 'active'),
                ('Silo 2 (Toned Milk)', 30000.000, 24000.000, 3.000, 8.500, 'active'),
                ('Silo 3 (Full Cream Milk)', 25000.000, 16000.000, 6.000, 9.000, 'active')
            `);
        }
    } catch { }

    // Seed default rinse tanks if empty
    try {
        const rinseTanks = await pool.execute("SELECT COUNT(*) AS c FROM RinseTanks");
        if (Number(rinseTanks[0]?.c || 0) === 0) {
            await pool.execute(`
                INSERT INTO RinseTanks (label, capacity, currentQuantity, status) VALUES
                ('Rinse Tank 1 (Primary Recovery)', 15000.000, 1800.000, 'active'),
                ('Rinse Tank 2 (Secondary Recovery)', 15000.000, 950.000, 'active')
            `);
        }
    } catch { }
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
            } catch { }
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

/* ── Rinse Tanks Master CRUD ── */
exports.listRinseTanks = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    return pool.execute("SELECT * FROM RinseTanks ORDER BY label, id");
};

exports.createRinseTank = async ({ label, capacity, status = "active" }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanLabel = String(label || "").trim();
    if (!cleanLabel) throw new Error("Rinse tank label is required.");
    const cleanCapacity = number(capacity, "Rinse tank capacity");
    if (!cleanCapacity) throw new Error("Rinse tank capacity must be greater than zero.");
    const [userId] = userFields(user);
    await pool.execute(
        `INSERT INTO RinseTanks (label, capacity, status, createdById, updatedById) VALUES (?, ?, ?, ?, ?)`,
        [cleanLabel, cleanCapacity, status, userId, userId]
    );
    return (await pool.execute("SELECT * FROM RinseTanks WHERE label = ?", [cleanLabel]))[0];
};

exports.updateRinseTank = async (id, { label, capacity, status }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const rows = await pool.execute("SELECT * FROM RinseTanks WHERE id = ?", [id]);
    if (!rows.length) throw new Error("Rinse tank not found.");
    const existing = rows[0];
    const nextCapacity = capacity === undefined ? Number(existing.capacity) : number(capacity, "Rinse tank capacity");
    if (nextCapacity < Number(existing.currentQuantity)) throw new Error("Capacity cannot be below current quantity.");
    const nextLabel = label === undefined ? existing.label : String(label).trim();
    if (!nextLabel) throw new Error("Rinse tank label is required.");
    const [userId] = userFields(user);
    await pool.execute(
        `UPDATE RinseTanks SET label = ?, capacity = ?, status = ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`,
        [nextLabel, nextCapacity, status || existing.status, userId, id]
    );
    return (await pool.execute("SELECT * FROM RinseTanks WHERE id = ?", [id]))[0];
};

exports.deactivateRinseTank = async (id, user) => exports.updateRinseTank(id, { status: "inactive" }, user);

/* ── Department Milk Allotment & Return ── */
exports.allotMilkToDepartment = async ({ department, productId, productName, sourceSiloId, quantity, startTime, endTime, batchNumber, notes }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanDept = String(department || "").trim();
    if (!cleanDept) throw new Error("Department is required.");
    const cleanProductName = String(productName || "").trim();
    if (!cleanProductName) throw new Error("Product name is required.");
    const amount = number(quantity, "Allotted quantity");
    if (!sourceSiloId) throw new Error("Source silo is required.");

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const silos = await conn.execute(`SELECT * FROM StorageSilos ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [sourceSiloId]);
        if (!silos.length) throw new Error("Source silo not found.");
        const silo = silos[0];
        if (silo.status !== "active") throw new Error(`Source silo "${silo.label}" is not active.`);
        if (Number(silo.currentQuantity) < amount) {
            throw new Error(`Silo "${silo.label}" only contains ${Number(silo.currentQuantity).toFixed(2)} kg (requested ${amount} kg).`);
        }

        const [userId, userName] = userFields(user);
        const cleanStart = startTime ? new Date(startTime) : new Date();
        const cleanEnd = endTime ? new Date(endTime) : null;

        await conn.execute(`UPDATE StorageSilos SET currentQuantity = currentQuantity - ?, updatedAt = ${sql.now()}, updatedById = ? WHERE id = ?`, [amount, userId, sourceSiloId]);
        const insertRes = await conn.execute(
            `INSERT INTO DepartmentMilkAllotments (
                department, productId, productName, sourceSiloId, sourceSiloLabel,
                allottedQuantity, status, allottedAt, allottedStartTime, allottedEndTime,
                allottedById, allottedByName, batchNumber, notes
            ) VALUES (?, ?, ?, ?, ?, ?, 'allotted', ${sql.now()}, ?, ?, ?, ?, ?, ?)`,
            [cleanDept, productId || null, cleanProductName, sourceSiloId, silo.label, amount, cleanStart, cleanEnd, userId, userName, batchNumber || null, notes || null]
        );

        await conn.commit();
        const insertId = insertRes.insertId ?? insertRes[0]?.insertId;
        return {
            id: insertId,
            department: cleanDept,
            productName: cleanProductName,
            sourceSiloLabel: silo.label,
            allottedQuantity: amount,
            status: "allotted"
        };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.returnDepartmentMilk = async ({ allotmentId, usedQuantity, returnedQuantity, rinseTankId, startTime, endTime, notes }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    if (!allotmentId) throw new Error("Allotment record ID is required.");
    const used = Number(usedQuantity);
    const returned = Number(returnedQuantity);
    if (!Number.isFinite(used) || used < 0) throw new Error("Used quantity must be a non-negative number.");
    if (!Number.isFinite(returned) || returned < 0) throw new Error("Returned quantity must be a non-negative number.");
    if (used + returned <= 0) throw new Error("Total of used and returned milk must be greater than zero.");
    if (returned > 0 && !rinseTankId) throw new Error("Destination rinse tank is required when milk is returned.");

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const rows = await conn.execute(`SELECT * FROM DepartmentMilkAllotments ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [allotmentId]);
        if (!rows.length) throw new Error("Allotment record not found.");
        const allotment = rows[0];
        if (allotment.status === "completed") throw new Error("This milk allotment has already been completed and returned.");

        let rinseTank = null;
        if (returned > 0) {
            const rtRows = await conn.execute(`SELECT * FROM RinseTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [rinseTankId]);
            if (!rtRows.length) throw new Error("Rinse tank not found.");
            rinseTank = rtRows[0];
            if (rinseTank.status !== "active") throw new Error(`Rinse tank "${rinseTank.label}" is not active.`);
            const free = Number(rinseTank.capacity) - Number(rinseTank.currentQuantity);
            if (returned > free + 0.01) {
                throw new Error(`Rinse tank "${rinseTank.label}" does not have enough capacity (available: ${free.toFixed(2)} kg, returning: ${returned} kg).`);
            }
            await conn.execute(`UPDATE RinseTanks SET currentQuantity = currentQuantity + ?, updatedAt = ${sql.now()} WHERE id = ?`, [returned, rinseTankId]);
        }

        const [userId, userName] = userFields(user);
        const cleanStart = startTime ? new Date(startTime) : null;
        const cleanEnd = endTime ? new Date(endTime) : new Date();

        await conn.execute(
            `UPDATE DepartmentMilkAllotments SET
                usedQuantity = ?,
                returnedQuantity = ?,
                rinseTankId = ?,
                rinseTankLabel = ?,
                status = 'completed',
                returnedAt = ${sql.now()},
                returnStartTime = ?,
                returnEndTime = ?,
                returnedById = ?,
                returnedByName = ?,
                notes = CASE WHEN notes IS NULL OR notes = '' THEN ? ELSE CONCAT(notes, ' | ', ?) END
             WHERE id = ?`,
            [used, returned, rinseTankId || null, rinseTank?.label || null, cleanStart, cleanEnd, userId, userName, notes || '', notes || '', allotmentId]
        );

        await conn.commit();
        return {
            allotmentId,
            usedQuantity: used,
            returnedQuantity: returned,
            rinseTankLabel: rinseTank?.label || null,
            status: "completed"
        };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.listDepartmentAllotments = async ({ department, status, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTables(pool);
    let query = "SELECT * FROM DepartmentMilkAllotments WHERE 1 = 1";
    const params = [];
    if (department) { query += " AND department = ?"; params.push(department); }
    if (status) { query += " AND status = ?"; params.push(status); }
    if (startDate) { query += " AND allottedAt >= ?"; params.push(`${startDate}T00:00:00`); }
    if (endDate) { query += " AND allottedAt <= ?"; params.push(`${endDate}T23:59:59.999`); }
    query += " ORDER BY allottedAt DESC, id DESC";
    return pool.execute(query, params);
};

/* ── Rinse Tank Push to Tanks or Silos ── */
exports.pushRinseTankMilk = async ({ rinseTankId, destinationType, destinationId, quantity, startTime, endTime, notes }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const amount = number(quantity, "Transfer quantity");
    if (!rinseTankId) throw new Error("Source rinse tank is required.");
    const destType = String(destinationType || "").toLowerCase();
    if (!["tank", "silo"].includes(destType)) throw new Error("Destination type must be either 'tank' or 'silo'.");
    if (!destinationId) throw new Error("Destination is required.");

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        const rtRows = await conn.execute(`SELECT * FROM RinseTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [rinseTankId]);
        if (!rtRows.length) throw new Error("Rinse tank not found.");
        const rinseTank = rtRows[0];
        if (Number(rinseTank.currentQuantity) < amount) {
            throw new Error(`Rinse tank "${rinseTank.label}" only contains ${Number(rinseTank.currentQuantity).toFixed(2)} kg (attempted transfer: ${amount} kg).`);
        }

        let destLabel = "";
        if (destType === "tank") {
            const tanks = await conn.execute(`SELECT * FROM StorageTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [destinationId]);
            if (!tanks.length) throw new Error("Destination tank not found.");
            const tank = tanks[0];
            if (tank.status !== "active") throw new Error(`Destination tank "${tank.label}" is not active.`);
            const free = Number(tank.capacity) - Number(tank.currentQuantity);
            if (amount > free + 0.01) {
                throw new Error(`Destination tank "${tank.label}" does not have enough capacity (available: ${free.toFixed(2)} kg, transferring: ${amount} kg).`);
            }
            destLabel = tank.label;
            await conn.execute(`UPDATE StorageTanks SET currentQuantity = currentQuantity + ?, updatedAt = ${sql.now()} WHERE id = ?`, [amount, destinationId]);
        } else {
            const silos = await conn.execute(`SELECT * FROM StorageSilos ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [destinationId]);
            if (!silos.length) throw new Error("Destination silo not found.");
            const silo = silos[0];
            if (silo.status !== "active") throw new Error(`Destination silo "${silo.label}" is not active.`);
            const free = Number(silo.capacity) - Number(silo.currentQuantity);
            if (amount > free + 0.01) {
                throw new Error(`Destination silo "${silo.label}" does not have enough capacity (available: ${free.toFixed(2)} kg, transferring: ${amount} kg).`);
            }
            destLabel = silo.label;
            await conn.execute(`UPDATE StorageSilos SET currentQuantity = currentQuantity + ?, updatedAt = ${sql.now()} WHERE id = ?`, [amount, destinationId]);
        }

        await conn.execute(`UPDATE RinseTanks SET currentQuantity = currentQuantity - ?, updatedAt = ${sql.now()} WHERE id = ?`, [amount, rinseTankId]);

        const [userId, userName] = userFields(user);
        const cleanStart = startTime ? new Date(startTime) : null;
        const cleanEnd = endTime ? new Date(endTime) : null;

        await conn.execute(
            `INSERT INTO RinseTankTransferLogs (
                rinseTankId, rinseTankLabel, destinationType, destinationId, destinationLabel,
                quantity, transferredAt, startTime, endTime, performedById, performedByName, notes
            ) VALUES (?, ?, ?, ?, ?, ?, ${sql.now()}, ?, ?, ?, ?, ?)`,
            [rinseTankId, rinseTank.label, destType, destinationId, destLabel, amount, cleanStart, cleanEnd, userId, userName, notes || null]
        );

        await conn.commit();
        return {
            rinseTankLabel: rinseTank.label,
            destinationType: destType,
            destinationLabel: destLabel,
            quantity: amount
        };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.listRinseTransfers = async ({ rinseTankId, destinationType, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTables(pool);
    let query = "SELECT * FROM RinseTankTransferLogs WHERE 1 = 1";
    const params = [];
    if (rinseTankId) { query += " AND rinseTankId = ?"; params.push(rinseTankId); }
    if (destinationType) { query += " AND destinationType = ?"; params.push(destinationType); }
    if (startDate) { query += " AND transferredAt >= ?"; params.push(`${startDate}T00:00:00`); }
    if (endDate) { query += " AND transferredAt <= ?"; params.push(`${endDate}T23:59:59.999`); }
    query += " ORDER BY transferredAt DESC, id DESC";
    return pool.execute(query, params);
};

/* ── Tanker Loading (After CIP Cleaned Verification) ── */
exports.loadMilkToTanker = async ({ vehicleNumber, sourceType = "tank", sourceId, quantity, fat, snf, temperature, startTime, endTime, destination, notes }, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const cleanVehicle = String(vehicleNumber || "").trim().toUpperCase();
    if (!cleanVehicle) throw new Error("Tanker vehicle number is required.");
    const amount = number(quantity, "Loading quantity");
    const cleanSourceType = String(sourceType || "tank").toLowerCase();
    if (!["tank", "silo"].includes(cleanSourceType)) throw new Error("Source must be either 'tank' or 'silo'.");
    if (!sourceId) throw new Error("Source tank or silo is required.");

    // Strict validation: Vehicle must have completed CIP cleaning!
    const cipLogs = await pool.execute(
        `SELECT id, vehicleNumber, completedAt, supervisorName
         FROM CIPLogs
         WHERE UPPER(vehicleNumber) = ?
         ORDER BY completedAt DESC, id DESC LIMIT 1`,
        [cleanVehicle]
    );
    if (!cipLogs.length) {
        throw new Error(`Vehicle "${cleanVehicle}" has NOT completed CIP cleaning! Outbound milk loading requires verified tanker CIP cleaning.`);
    }
    const latestCIP = cipLogs[0];

    const conn = await pool.getConnection();
    try {
        const lock = DB_TYPE === "mssql" ? "WITH (UPDLOCK, ROWLOCK)" : "FOR UPDATE";
        let sourceLabel = "";
        if (cleanSourceType === "tank") {
            const tanks = await conn.execute(`SELECT * FROM StorageTanks ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [sourceId]);
            if (!tanks.length) throw new Error("Source tank not found.");
            const tank = tanks[0];
            if (tank.status !== "active") throw new Error(`Source tank "${tank.label}" is not active.`);
            if (Number(tank.currentQuantity) < amount) {
                throw new Error(`Source tank "${tank.label}" only contains ${Number(tank.currentQuantity).toFixed(2)} kg (requested ${amount} kg).`);
            }
            sourceLabel = tank.label;
            await conn.execute(`UPDATE StorageTanks SET currentQuantity = currentQuantity - ?, updatedAt = ${sql.now()} WHERE id = ?`, [amount, sourceId]);
        } else {
            const silos = await conn.execute(`SELECT * FROM StorageSilos ${DB_TYPE === "mssql" ? lock : ""} WHERE id = ? ${DB_TYPE === "mysql" ? lock : ""}`, [sourceId]);
            if (!silos.length) throw new Error("Source silo not found.");
            const silo = silos[0];
            if (silo.status !== "active") throw new Error(`Source silo "${silo.label}" is not active.`);
            if (Number(silo.currentQuantity) < amount) {
                throw new Error(`Source silo "${silo.label}" only contains ${Number(silo.currentQuantity).toFixed(2)} kg (requested ${amount} kg).`);
            }
            sourceLabel = silo.label;
            await conn.execute(`UPDATE StorageSilos SET currentQuantity = currentQuantity - ?, updatedAt = ${sql.now()} WHERE id = ?`, [amount, sourceId]);
        }

        const [userId, userName] = userFields(user);
        const cleanStart = startTime ? new Date(startTime) : null;
        const cleanEnd = endTime ? new Date(endTime) : null;

        await conn.execute(
            `INSERT INTO TankerLoadingLogs (
                vehicleNumber, cipLogId, cipCompletedAt, sourceType, sourceId, sourceLabel,
                quantity, fat, snf, temperature, startTime, endTime, loadedAt, destination,
                performedById, performedByName, notes
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ${sql.now()}, ?, ?, ?, ?)`,
            [
                cleanVehicle,
                latestCIP.id,
                latestCIP.completedAt,
                cleanSourceType,
                sourceId,
                sourceLabel,
                amount,
                fat !== undefined && fat !== "" ? Number(fat) : null,
                snf !== undefined && snf !== "" ? Number(snf) : null,
                temperature !== undefined && temperature !== "" ? Number(temperature) : null,
                cleanStart,
                cleanEnd,
                destination || null,
                userId,
                userName,
                notes || null
            ]
        );

        await conn.commit();
        return {
            vehicleNumber: cleanVehicle,
            cipLogId: latestCIP.id,
            cipCompletedAt: latestCIP.completedAt,
            sourceType: cleanSourceType,
            sourceLabel,
            quantity: amount,
            destination: destination || null
        };
    } catch (error) {
        await conn.rollback();
        throw error;
    } finally {
        conn.release();
    }
};

exports.listTankerLoadings = async ({ vehicleNumber, sourceType, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTables(pool);
    let query = "SELECT * FROM TankerLoadingLogs WHERE 1 = 1";
    const params = [];
    if (vehicleNumber) { query += " AND vehicleNumber = ?"; params.push(String(vehicleNumber).trim().toUpperCase()); }
    if (sourceType) { query += " AND sourceType = ?"; params.push(sourceType); }
    if (startDate) { query += " AND loadedAt >= ?"; params.push(`${startDate}T00:00:00`); }
    if (endDate) { query += " AND loadedAt <= ?"; params.push(`${endDate}T23:59:59.999`); }
    query += " ORDER BY loadedAt DESC, id DESC";
    return pool.execute(query, params);
};

exports.listCleanedTankers = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    const query = `
        SELECT 
            c.id AS cipLogId,
            c.vehicleNumber,
            c.supervisorName,
            c.completedAt,
            c.wbEntryId
        FROM CIPLogs c
        INNER JOIN (
            SELECT vehicleNumber, MAX(id) AS maxId
            FROM CIPLogs
            GROUP BY vehicleNumber
        ) latest ON c.id = latest.maxId
        ORDER BY c.completedAt DESC
    `;
    return pool.execute(query);
};

/* ── Tank to Silo Transfer Logs (Fulfillments history with timing) ── */
exports.listTankToSiloLoads = async () => {
    const pool = await connectDB();
    await ensureTables(pool);
    const query = `
        SELECT 
            f.id,
            f.productRequestId,
            f.siloId,
            s.label AS siloLabel,
            f.quantityDumped,
            f.resultingFat,
            f.resultingSnf,
            f.notes,
            f.fulfilledById,
            f.fulfilledByName,
            f.fulfilledAt,
            -- f.startTime,
            -- f.endTime,
            pr.productName,
            pr.requestedQuantity
        FROM SiloFulfillments f
        LEFT JOIN StorageSilos s ON s.id = f.siloId
        LEFT JOIN ProductRequests pr ON pr.id = f.productRequestId
        ORDER BY f.fulfilledAt DESC, f.id DESC
    `;
    const rows = await pool.execute(query);
    for (const row of rows) {
        row.sources = await pool.execute(
            `SELECT fs.*, t.label AS tankLabel
             FROM SiloFulfillmentSources fs
             LEFT JOIN StorageTanks t ON t.id = fs.tankId
             WHERE fs.fulfillmentId = ?`,
            [row.id]
        );
    }
    return rows;
};

