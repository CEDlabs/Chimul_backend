const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SampleCollections (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            sampleId VARCHAR(50) NOT NULL UNIQUE,
            vehicleNumber VARCHAR(20) NOT NULL,
            gateEntryId VARCHAR(50) NULL,
            wbEntryId VARCHAR(50) NULL,
            routeNo VARCHAR(50) NULL,
            taluk VARCHAR(100) NULL,
            materialType VARCHAR(100) NULL,
            sealNumbers ${sql.longText} NULL,
            quantity VARCHAR(50) NOT NULL,
            temperature VARCHAR(50) NOT NULL,
            remarks ${sql.longText} NULL,
            sampleCollectedBy VARCHAR(150) NULL,
            sampleCollectedByEmpId VARCHAR(50) NULL,
            collectedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_sc_vehicle (vehicleNumber)
        )
    `);
};

const migrateRemarksColumn = async (pool) => {
    try {
        const cols = await pool.execute(
            "SELECT IS_NULLABLE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'SampleCollections' AND COLUMN_NAME = 'remarks'"
        );
        if (cols.length && cols[0].IS_NULLABLE === "NO") {
            await pool.execute("ALTER TABLE SampleCollections MODIFY remarks LONGTEXT NULL");
        }
    } catch (_) { /* ignore if table does not exist yet */ }
};

exports.create = async (data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await migrateRemarksColumn(pool);
    await ensureSoftDeleteColumns(pool);
    const collectedAt = data.collectedAt && !Number.isNaN(new Date(data.collectedAt).getTime())
        ? new Date(data.collectedAt)
        : new Date();
    const sealNumbers = Array.isArray(data.sealNumbers) ? JSON.stringify(data.sealNumbers) : (data.sealNumbers || "[]");

    const existingRows = await pool.execute(
        "SELECT sampleId, vehicleNumber, collectedAt FROM SampleCollections WHERE vehicleNumber = ? AND DATE(collectedAt) = DATE(?) AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
        [String(data.vehicleNumber).toUpperCase(), collectedAt]
    ).catch(() => []);
    if (existingRows && existingRows.length > 0) {
        const dup = existingRows[0];
        const dupDate = new Date(dup.collectedAt).toLocaleDateString("en-IN", { day: "2-digit", month: "2-digit", year: "numeric" });
        throw new Error(`Sample collection already exists for vehicle ${dup.vehicleNumber} on ${dupDate} (Sample ID: ${dup.sampleId}). Duplicate entries are not allowed.`);
    }

    await pool.execute(
        `INSERT INTO SampleCollections
         (sampleId, vehicleNumber, gateEntryId, wbEntryId, routeNo, taluk, materialType, sealNumbers,
          quantity, temperature, remarks, sampleCollectedBy, sampleCollectedByEmpId, collectedAt)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            data.sampleId,
            String(data.vehicleNumber).toUpperCase(),
            data.gateEntryId || "",
            data.wbEntryId || "",
            data.routeNo || "",
            data.taluk || "",
            data.materialType || "",
            sealNumbers,
            data.quantity,
            data.temperature,
            data.remarks || "",
            data.sampleCollectedBy || "",
            data.sampleCollectedByEmpId || "",
            collectedAt,
        ]
    );

    return { ...data, vehicleNumber: String(data.vehicleNumber).toUpperCase(), collectedAt };
};

exports.getAll = async ({ vehicleNumber, startDate, endDate, search } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    let query = "SELECT * FROM SampleCollections WHERE (isDeleted IS NULL OR isDeleted = 0)";
    const params = [];

    if (vehicleNumber) {
        query += " AND vehicleNumber = ?";
        params.push(String(vehicleNumber).toUpperCase());
    }

    if (startDate && endDate) {
        query += " AND DATE(collectedAt) >= ? AND DATE(collectedAt) <= ?";
        params.push(startDate, endDate);
    }

    if (search && search.trim()) {
        query += " AND (vehicleNumber LIKE ? OR sampleId LIKE ? OR sampleCollectedBy LIKE ? OR routeNo LIKE ? OR materialType LIKE ?)";
        const s = `%${search.trim()}%`;
        params.push(s, s, s, s, s);
    }

    query += " ORDER BY collectedAt DESC, id DESC";

    const rows = await pool.execute(query, params);
    return rows;
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

const ensureSoftDeleteColumns = async (pool) => {
    try { await pool.execute("ALTER TABLE SampleCollections ADD COLUMN isDeleted TINYINT(1) DEFAULT 0"); } catch {}
    try { await pool.execute("ALTER TABLE SampleCollections ADD COLUMN deletedAt DATETIME NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SampleCollections ADD COLUMN deletedBy VARCHAR(150) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SampleCollections ADD COLUMN deletedById VARCHAR(50) NULL"); } catch {}
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM SampleCollections WHERE (sampleId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Sample collection entry not found or already deleted.");
    }

    const record = lookupResult[0];

    await AuditLog.create({
        module: "SampleCollection",
        action: "DELETE",
        recordId: record.sampleId,
        recordData: {
            id: record.id,
            sampleId: record.sampleId,
            vehicleNumber: record.vehicleNumber,
            temperature: record.temperature,
            quantity: record.quantity,
            routeNo: record.routeNo,
            materialType: record.materialType,
            sampleCollectedBy: record.sampleCollectedBy,
            createdAt: record.createdAt
        },
        user: user,
        ipAddress: ipAddress
    });

    const now = new Date();
    await pool.execute(
        "UPDATE SampleCollections SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ? WHERE sampleId = ?",
        [
            now,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            record.sampleId
        ]
    );

    return true;
};

exports.update = async (id, data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM SampleCollections WHERE (sampleId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Sample collection entry not found or already deleted.");
    }

    const existing = lookupResult[0];
    const now = new Date();

    await pool.execute(
        `UPDATE SampleCollections SET
            vehicleNumber = ?, temperature = ?, remarks = ?, quantity = ?,
            routeNo = ?, taluk = ?, materialType = ?,
            sampleCollectedBy = ?, sampleCollectedByEmpId = ?
         WHERE sampleId = ?`,
        [
            (data.vehicleNumber || existing.vehicleNumber || "").toUpperCase().trim(),
            data.temperature !== undefined ? data.temperature : existing.temperature,
            data.remarks !== undefined ? data.remarks : existing.remarks,
            data.quantity !== undefined ? data.quantity : existing.quantity,
            data.routeNo !== undefined ? data.routeNo : existing.routeNo,
            data.taluk !== undefined ? data.taluk : existing.taluk,
            data.materialType !== undefined ? data.materialType : existing.materialType,
            data.sampleCollectedBy !== undefined ? data.sampleCollectedBy : existing.sampleCollectedBy,
            data.sampleCollectedByEmpId !== undefined ? data.sampleCollectedByEmpId : existing.sampleCollectedByEmpId,
            existing.sampleId
        ]
    );

    return { ...existing, ...data, sampleId: existing.sampleId, updatedAt: now };
};
