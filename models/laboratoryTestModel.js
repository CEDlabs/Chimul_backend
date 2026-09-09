const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS LaboratoryTests (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            labTestId VARCHAR(50) NOT NULL UNIQUE,
            vehicleNumber VARCHAR(20) NOT NULL,
            routeNo VARCHAR(50) NULL,
            taluk VARCHAR(100) NULL,
            gateEntryId VARCHAR(50) NULL,
            wbEntryId VARCHAR(50) NULL,
            driverName VARCHAR(100) NULL,
            supplierName VARCHAR(100) NULL,
            materialType VARCHAR(100) NULL,
            productName VARCHAR(100) NULL,
            sealNumbers ${sql.longText} NULL,
            temperature VARCHAR(50) NULL,
            cob VARCHAR(20) NULL,
            acidity VARCHAR(50) NULL,
            appearance VARCHAR(100) NULL,
            clr VARCHAR(50) NULL,
            fat VARCHAR(50) NULL,
            alcohol VARCHAR(50) NULL,
            snf VARCHAR(50) NULL,
            testResult VARCHAR(20) NULL,
            flavors ${sql.longText} NULL,
            remarks ${sql.longText} NULL,
            testedByName VARCHAR(150) NULL,
            testedByEmpId VARCHAR(50) NULL,
            testedAt DATETIME NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_lt_vehicle (vehicleNumber),
            INDEX idx_lt_tested (testedAt)
        )
    `);
};

const ensureSoftDeleteColumns = async (pool) => {
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN testResult VARCHAR(20) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN isDeleted TINYINT(1) DEFAULT 0"); } catch {}
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN deletedAt DATETIME NULL"); } catch {}
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN deletedBy VARCHAR(150) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE LaboratoryTests ADD COLUMN deletedById VARCHAR(50) NULL"); } catch {}
};

const calculateSNF = (clr, fat) => {
    const clrVal = parseFloat(clr);
    const fatVal = parseFloat(fat);
    if (Number.isNaN(clrVal) || Number.isNaN(fatVal)) return "";
    return (clrVal / 4 + 0.25 * fatVal + 0.44).toFixed(2);
};

const normalizeRecord = (row) => {
    if (row.sealNumbers && typeof row.sealNumbers === "string") {
        try { row.sealNumbers = JSON.parse(row.sealNumbers); } catch { row.sealNumbers = []; }
    }
    return row;
};

exports.create = async (data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const testedAt = data.testedAt && !Number.isNaN(new Date(data.testedAt).getTime())
        ? new Date(data.testedAt)
        : new Date();
    const snf = data.snf || calculateSNF(data.clr, data.fat);
    const sealNumbers = Array.isArray(data.sealNumbers) ? JSON.stringify(data.sealNumbers) : (data.sealNumbers || "[]");

    await pool.execute(
        `INSERT INTO LaboratoryTests
         (labTestId, vehicleNumber, routeNo, taluk, gateEntryId, wbEntryId, driverName, supplierName,
          materialType, productName, sealNumbers, temperature, cob, acidity, appearance,
          clr, fat, alcohol, snf, testResult, flavors, remarks, testedByName, testedByEmpId, testedAt)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)` ,
        [
            data.labTestId,
            String(data.vehicleNumber).toUpperCase(),
            data.routeNo || "",
            data.taluk || "",
            data.gateEntryId || "",
            data.wbEntryId || "",
            data.driverName || "",
            data.supplierName || "",
            data.materialType || "",
            data.productName || "",
            sealNumbers,
            data.temperature || "",
            data.cob || "",
            data.acidity || "",
            data.appearance || "",
            data.clr || "",
            data.fat || "",
            data.alcohol || "",
            snf,
            data.testResult || null,
            data.flavors || "",
            data.remarks || "",
            data.testedByName || "",
            data.testedByEmpId || "",
            testedAt,
        ]
    );

    return { ...data, vehicleNumber: String(data.vehicleNumber).toUpperCase(), snf, testedAt };
};

exports.getAll = async ({ vehicleNumber, routeNo, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    let query = "SELECT * FROM LaboratoryTests WHERE (isDeleted IS NULL OR isDeleted = 0)";
    const params = [];

    if (vehicleNumber) {
        query += " AND vehicleNumber = ?";
        params.push(String(vehicleNumber).toUpperCase());
    }
    if (routeNo) {
        query += " AND routeNo = ?";
        params.push(String(routeNo).trim());
    }
    if (startDate && endDate) {
        query += " AND testedAt >= ? AND testedAt <= ?";
        params.push(`${startDate}T00:00:00`, `${endDate}T23:59:59.999`);
    }
    query += " ORDER BY testedAt DESC, id DESC";

    const rows = await pool.execute(query, params);
    return rows.map(normalizeRecord);
};

exports.getVehicleData = async (vehicleNumber) => {
    const pool = await connectDB();
    const normalizedVehicle = String(vehicleNumber || "").trim().toUpperCase();
    if (!normalizedVehicle) return { gate: null, weighbridge: null };

    const [gateResult, weighbridgeResult] = await Promise.all([
        pool.execute("SELECT * FROM GateEntries WHERE vehicleNumber = ? ORDER BY createdAt DESC, id DESC LIMIT 1", [normalizedVehicle]),
        pool.execute("SELECT * FROM WeighBridgeEntries WHERE vehicleNumber = ? ORDER BY createdAt DESC, id DESC LIMIT 1", [normalizedVehicle]),
    ]);

    const gate = gateResult[0] || null;
    if (gate?.sealNumbers && typeof gate.sealNumbers === "string") {
        try { gate.sealNumbers = JSON.parse(gate.sealNumbers); } catch { gate.sealNumbers = []; }
    }
    return { gate, weighbridge: weighbridgeResult[0] || null };
};

exports.getDataByRoute = async (routeNo) => {
    const pool = await connectDB();
    const normalizedRoute = String(routeNo || "").trim().toUpperCase();
    if (!normalizedRoute) return { vehicles: [], weighbridge: null, gate: null };

    const wbResult = await pool.execute(
        "SELECT * FROM WeighBridgeEntries WHERE UPPER(routeName) = ? ORDER BY createdAt DESC, id DESC LIMIT 1",
        [normalizedRoute]
    );

    const weighbridge = wbResult[0] || null;
    if (!weighbridge) return { vehicles: [], weighbridge: null, gate: null };

    const gate = weighbridge.vehicleNumber
        ? (await exports.getVehicleData(weighbridge.vehicleNumber)).gate
        : null;

    const vehiclesResult = await pool.execute(
        "SELECT DISTINCT vehicleNumber, routeName FROM WeighBridgeEntries WHERE UPPER(routeName) = ? ORDER BY vehicleNumber",
        [normalizedRoute]
    );

    return { vehicles: vehiclesResult, weighbridge, gate };
};

exports.findByDateVehicleRoute = async ({ date, vehicleNumber, routeNo } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const normalizedVehicle = String(vehicleNumber || "").toUpperCase().trim();
    const normalizedRoute = String(routeNo || "").trim();
    if (!normalizedVehicle) return null;

    let dateCondition;
    if (date) {
        const dateStr = String(date).slice(0, 10);
        dateCondition = `AND ${sql.date("testedAt")} = '${dateStr}'`;
    } else {
        dateCondition = `AND ${sql.date("testedAt")} = ${sql.curdate()}`;
    }

    let query = `SELECT * FROM LaboratoryTests WHERE (isDeleted IS NULL OR isDeleted = 0) AND vehicleNumber = ? ${dateCondition}`;
    const params = [normalizedVehicle];
    if (normalizedRoute) {
        query += " AND routeNo = ?";
        params.push(normalizedRoute);
    }
    query += " ORDER BY testedAt DESC, id DESC LIMIT 1";

    const rows = await pool.execute(query, params);
    return rows.length > 0 ? normalizeRecord(rows[0]) : null;
};

exports.findByVehicleAnyDate = async ({ vehicleNumber, excludeToday } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const normalizedVehicle = String(vehicleNumber || "").toUpperCase().trim();
    if (!normalizedVehicle) return null;

    let query = `SELECT *, ${sql.date("testedAt")} AS testDate FROM LaboratoryTests WHERE (isDeleted IS NULL OR isDeleted = 0) AND vehicleNumber = ?`;
    const params = [normalizedVehicle];

    if (excludeToday) {
        query += ` AND ${sql.date("testedAt")} != ${sql.curdate()}`;
    }

    query += " ORDER BY testedAt DESC LIMIT 1";

    const rows = await pool.execute(query, params);
    return rows.length > 0 ? normalizeRecord(rows[0]) : null;
};

exports.update = async (id, data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM LaboratoryTests WHERE (labTestId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Lab test record not found or already deleted.");
    }

    const existing = lookupResult[0];
    const snf = data.snf || calculateSNF(data.clr, data.fat);
    const sealNumbers = Array.isArray(data.sealNumbers) ? JSON.stringify(data.sealNumbers) : (data.sealNumbers || existing.sealNumbers || "[]");
    const now = new Date();

    await pool.execute(
        `UPDATE LaboratoryTests SET
            temperature = ?, cob = ?, acidity = ?, appearance = ?,
            clr = ?, fat = ?, alcohol = ?, snf = ?,
            testResult = ?, flavors = ?, remarks = ?, updatedAt = ?
         WHERE labTestId = ?`,
        [
            data.temperature ?? existing.temperature,
            data.cob ?? existing.cob,
            data.acidity ?? existing.acidity,
            data.appearance ?? existing.appearance,
            data.clr ?? existing.clr,
            data.fat ?? existing.fat,
            data.alcohol ?? existing.alcohol,
            snf,
            data.testResult ?? existing.testResult,
            data.flavors ?? existing.flavors,
            data.remarks ?? existing.remarks,
            now,
            existing.labTestId,
        ]
    );

    return { ...existing, ...data, snf, updatedAt: now };
};

exports.delete = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM LaboratoryTests WHERE (labTestId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Lab test record not found or already deleted.");
    }

    const record = lookupResult[0];

    await AuditLog.create({
        module: "LaboratoryTest",
        action: "DELETE",
        recordId: record.labTestId,
        recordData: {
            id: record.id,
            labTestId: record.labTestId,
            vehicleNumber: record.vehicleNumber,
            routeNo: record.routeNo,
            temperature: record.temperature,
            cob: record.cob,
            clr: record.clr,
            fat: record.fat,
            snf: record.snf,
            testedByName: record.testedByName,
            testedAt: record.testedAt,
            createdAt: record.createdAt,
        },
        user: user,
        ipAddress: ipAddress,
    });

    const now = new Date();
    await pool.execute(
        "UPDATE LaboratoryTests SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ?, updatedAt = ? WHERE labTestId = ?",
        [
            now,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            now,
            record.labTestId,
        ]
    );

    return true;
};
