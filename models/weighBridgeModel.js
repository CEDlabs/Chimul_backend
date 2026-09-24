const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");
const AlternativeVehicle = require("./alternativeVehicleModel");
const { ensureSearchIndexes, normalizePlate, freeText } = require("../utils/searchIndexes");

// Calendar "today" in the server's local time zone, as a YYYY-MM-DD string.
// Used for date-window lookups (alternative vehicles). The day-boundary
// duplicate checks themselves use CURDATE() on the DB server so they are
// judged purely on the saved date, not on a UTC-shifted timestamp.
const localToday = () => {
    const now = new Date();
    return new Date(now.getTime() - now.getTimezoneOffset() * 60000).toISOString().slice(0, 10);
};

const generateWBId = () =>
    `WB-${Date.now().toString().slice(-7)}-${Math.floor(100 + Math.random() * 900)}`;

// Expand a searched vehicle number to include any alternative-vehicle partner(s) in
// an active window today, so a weighbridge session recorded under either the primary
// or the alternative plate is found no matter which one the operator types.
async function expandVehicleNumbers(vehicleNumber, date) {
    const vNum = String(vehicleNumber || "").trim().toUpperCase();
    const numbers = new Set(vNum ? [vNum] : []);
    if (!vNum) return [...numbers];

    const alt = await AlternativeVehicle.findActiveForVehicle(vNum, date);
    if (alt) {
        if (alt.primaryVehicleNumber) numbers.add(String(alt.primaryVehicleNumber).toUpperCase());
        if (alt.alternativeVehicleNumber) numbers.add(String(alt.alternativeVehicleNumber).toUpperCase());
    }
    return [...numbers];
}

async function ensureWBTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS WeighBridgeEntries (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                wbEntryId VARCHAR(50) NOT NULL UNIQUE,
                vehicleNumber VARCHAR(20) NOT NULL,
                routeName VARCHAR(50) NULL,
                conductorName VARCHAR(100) NULL,
                driverName VARCHAR(100) NULL,
                supplierCode VARCHAR(50) NULL,
                contractorCode VARCHAR(50) NULL,
                purpose VARCHAR(50) DEFAULT 'Load Tanker (BMC)',
                destination VARCHAR(100) NULL,
                productGroup VARCHAR(100) NULL,
                productName VARCHAR(100) NULL,
                compartments INT DEFAULT 1,
                weighBridgeNo INT DEFAULT 1,
                grossWeight DECIMAL(10,2) NULL,
                intermediateWeight1 DECIMAL(10,2) NULL,
                dumpPosition1 VARCHAR(20) NULL,
                intermediateWeight2 DECIMAL(10,2) NULL,
                dumpPosition2 VARCHAR(20) NULL,
                intermediateWeight3 DECIMAL(10,2) NULL,
                dumpPosition3 VARCHAR(20) NULL,
                tareWeight DECIMAL(10,2) NULL,
                netWeight DECIMAL(10,2) NULL,
                status VARCHAR(30) DEFAULT 'GrossPending',
                intermediateCount INT DEFAULT 0,
                initialWeightAt DATETIME NULL,
                intermediateWeight1At DATETIME NULL,
                intermediateWeight2At DATETIME NULL,
                intermediateWeight3At DATETIME NULL,
                tareWeightAt DATETIME NULL,
                initialWeightMode VARCHAR(20) NULL,
                intermediateWeight1Mode VARCHAR(20) NULL,
                intermediateWeight2Mode VARCHAR(20) NULL,
                intermediateWeight3Mode VARCHAR(20) NULL,
                tareWeightMode VARCHAR(20) NULL,
                entryCategory VARCHAR(30) NULL,
                vehicleType VARCHAR(50) NULL,
                createdByName VARCHAR(150) NULL,
                createdByEmpId VARCHAR(50) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()}
            )
        `);
    } catch (e) {
        console.warn("WeighBridgeEntries table creation error:", e.message);
    }

    for (const alter of [
        "ALTER TABLE WeighBridgeEntries ADD COLUMN entryCategory VARCHAR(30) NULL",
        "ALTER TABLE WeighBridgeEntries ADD COLUMN vehicleType VARCHAR(50) NULL",
    ]) {
        try {
            await pool.execute(alter);
        } catch { /* column already exists */ }
    }
}

const CO_PACKING_TYPE = "Load Tanker (Co-Packing)";
const OTHER_VEHICLES_TYPE = "Other Vehicles";
const BMC_TANKER_TYPE = "Load Tanker (BMC)";

const entryCategoryForVehicleType = (vehicleType) => {
    if (vehicleType === CO_PACKING_TYPE) return "BMC Loading";
    if (vehicleType === OTHER_VEHICLES_TYPE) return "Other Vehicle";
    return null;
};

// WayBridge purpose is one of the three operational types; legacy Loading/Unloading/Tare Check map to BMC.
const normalizeWbPurpose = (purpose) => {
    const p = String(purpose || "").trim();
    if (p === CO_PACKING_TYPE || p === OTHER_VEHICLES_TYPE || p === BMC_TANKER_TYPE) return p;
    if (p === "Loading" || p === "Unloading" || p === "Tare Check") return BMC_TANKER_TYPE;
    return BMC_TANKER_TYPE;
};

const purposeSkipsRoute = (purpose) => {
    const p = String(purpose || "").trim();
    return p === CO_PACKING_TYPE || p === OTHER_VEHICLES_TYPE;
};

// Loading direction: Co-Packing purpose/vehicleType (or legacy Loading / BMC Loading category).
const isLoadingPurpose = (purpose, entryCategory, vehicleType) => {
    const p = String(purpose || "").trim();
    const vt = String(vehicleType || "").trim();
    if (p === CO_PACKING_TYPE || vt === CO_PACKING_TYPE || p === "Loading") return true;
    if (p === OTHER_VEHICLES_TYPE || vt === OTHER_VEHICLES_TYPE) return false;
    return entryCategory === "BMC Loading";
};

// Resolve vehicleType from today's gate entry when not provided by the client.
async function resolveVehicleType(pool, vehicleNumber) {
    try {
        const rows = await pool.execute(
            `SELECT vehicleType, routeName, entryCategory
             FROM GateEntries
             WHERE UPPER(vehicleNumber) = UPPER(?)
               AND (isDeleted IS NULL OR isDeleted = 0)
             ORDER BY createdAt DESC LIMIT 1`,
            [vehicleNumber]
        );
        return rows[0] || null;
    } catch {
        return null;
    }
}


exports.create = async (data) => {
    const pool = await connectDB();
    await ensureWBTable(pool);
    await ensureSearchIndexes(pool);

    const wbEntryId = generateWBId();
    const gate = await resolveVehicleType(pool, data.vehicleNumber);
    let purpose = normalizeWbPurpose(data.purpose);
    // Prefer explicit vehicleType, then purpose (the three operational types), then gate.
    let vehicleType = data.vehicleType || purpose || gate?.vehicleType || "";
    // Gate/vehicle Co-Packing always stores purpose as Co-Packing (loading direction).
    if (gate?.vehicleType === CO_PACKING_TYPE || vehicleType === CO_PACKING_TYPE || purpose === CO_PACKING_TYPE) {
        purpose = CO_PACKING_TYPE;
        vehicleType = CO_PACKING_TYPE;
    } else if (gate?.vehicleType === OTHER_VEHICLES_TYPE || vehicleType === OTHER_VEHICLES_TYPE || purpose === OTHER_VEHICLES_TYPE) {
        purpose = OTHER_VEHICLES_TYPE;
        vehicleType = OTHER_VEHICLES_TYPE;
    }
    let entryCategory = data.entryCategory || entryCategoryForVehicleType(vehicleType) || gate?.entryCategory || null;
    let routeName = data.routeName || "";
    if (purpose === CO_PACKING_TYPE || vehicleType === CO_PACKING_TYPE) {
        routeName = "";
        entryCategory = "BMC Loading";
    } else if (purpose === OTHER_VEHICLES_TYPE || vehicleType === OTHER_VEHICLES_TYPE) {
        routeName = "";
        entryCategory = "Other Vehicle";
    } else if (!entryCategory) {
        // BMC purpose: default from purpose direction when no category from client/gate.
        entryCategory = isLoadingPurpose(purpose, entryCategory) ? "BMC Loading" : "BMC Unloading";
    }

    await pool.execute(
        `INSERT INTO WeighBridgeEntries
         (wbEntryId, vehicleNumber, routeName, conductorName, driverName, supplierCode,
          contractorCode, purpose, destination, productGroup, productName, compartments,
          weighBridgeNo, grossWeight, status, createdByName, createdByEmpId, initialWeightAt,
          initialWeightMode, entryCategory, vehicleType)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Intermediate', ?, ?, ${sql.now()}, ?, ?, ?)`,
        [
            wbEntryId,
            (data.vehicleNumber || "").toUpperCase(),
            routeName,
            data.conductorName || "",
            data.driverName || "",
            data.supplierCode || "",
            data.contractorCode || "",
            purpose,
            data.destination || "",
            data.productGroup || "",
            data.productName || "",
            parseInt(data.compartments, 10) || 1,
            parseInt(data.weighBridgeNo, 10) || 1,
            parseFloat(data.grossWeight) || 0,
            data.createdByName || "",
            data.createdByEmpId || "",
            data.captureMode || "Manual",
            entryCategory,
            vehicleType || null,
        ]
    );

    return { wbEntryId, ...data, purpose, routeName, entryCategory, vehicleType };
};

exports.saveIntermediate = async (wbEntryId, { weight, dumpPosition, mode }) => {
    const pool = await connectDB();

    const cur = await pool.execute(
        "SELECT intermediateCount, status FROM WeighBridgeEntries WHERE wbEntryId = ?",
        [wbEntryId]
    );

    if (!cur.length) throw new Error("WeighBridge session not found: " + wbEntryId);
    const { intermediateCount, status } = cur[0];

    if (status === "Completed") throw new Error("Session already completed.");
    if (intermediateCount >= 3) throw new Error("Maximum 3 intermediate weights already captured.");

    const newCount = (intermediateCount || 0) + 1;
    const wCol = `intermediateWeight${newCount}`;
    const pCol = `dumpPosition${newCount}`;
    const tCol = `intermediateWeight${newCount}At`;
    const mCol = `intermediateWeight${newCount}Mode`;

    await pool.execute(
        `UPDATE WeighBridgeEntries
         SET ${wCol} = ?,
             ${pCol} = ?,
             ${tCol} = ${sql.now()},
             ${mCol} = ?,
             intermediateCount = ?,
             status = 'TarePending',
             updatedAt = ${sql.now()}
         WHERE wbEntryId = ?`,
        [
            parseFloat(weight) || 0,
            dumpPosition || "",
            mode || "Manual",
            newCount,
            wbEntryId,
        ]
    );

    return { wbEntryId, intermediateCount: newCount };
};

exports.saveTare = async (wbEntryId, tareWeight, mode) => {
    const pool = await connectDB();

    const cur = await pool.execute(
        "SELECT grossWeight, intermediateCount, status, purpose, entryCategory, vehicleType FROM WeighBridgeEntries WHERE wbEntryId = ?",
        [wbEntryId]
    );

    if (!cur.length) throw new Error("WeighBridge session not found: " + wbEntryId);
    const row = cur[0];

    if (row.status === "Completed") throw new Error("Session already completed.");

    const tare = parseFloat(tareWeight) || 0;
    const gross = parseFloat(row.grossWeight) || 0;
    // Loading (Co-Packing / BMC Loading): final weight is heavier → net = final − initial.
    // Unloading: vehicle gets lighter → net = initial − final.
    const isLoading = isLoadingPurpose(row.purpose, row.entryCategory, row.vehicleType)
        || String(row.purpose || "").trim() === CO_PACKING_TYPE
        || String(row.vehicleType || "").trim() === CO_PACKING_TYPE;
    const netWeight = isLoading
        ? Math.max(0, tare - gross)
        : Math.max(0, gross - tare);

    await pool.execute(
        `UPDATE WeighBridgeEntries
         SET tareWeight = ?,
             netWeight = ?,
             tareWeightAt = ${sql.now()},
             tareWeightMode = ?,
             status = 'Completed',
             updatedAt = ${sql.now()}
         WHERE wbEntryId = ?`,
        [tare, netWeight, mode || "Manual", wbEntryId]
    );

    const updated = await pool.execute(
        "SELECT * FROM WeighBridgeEntries WHERE wbEntryId = ?",
        [wbEntryId]
    );

    return updated[0] || { wbEntryId, tareWeight: tare, grossWeight: gross, netWeight };
};

exports.findActive = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureWBTable(pool);
    await ensureSearchIndexes(pool);

    const numbers = await expandVehicleNumbers(vehicleNumber, localToday());
    if (numbers.length === 0) return null;
    const keys = numbers.map(normalizePlate).filter(Boolean);
    const placeholders = numbers.map(() => "?").join(",");
    const keyPlaceholders = keys.map(() => "?").join(",");

    const result = await pool.execute(
        `SELECT * FROM WeighBridgeEntries
         WHERE (UPPER(vehicleNumber) IN (${placeholders}) OR vehKey IN (${keyPlaceholders}))
           AND status IN ('Intermediate', 'TarePending')
           AND (isDeleted IS NULL OR isDeleted = 0)
           AND DATE(createdAt) = CURDATE()
         ORDER BY createdAt DESC
         LIMIT 1`,
        [...numbers, ...keys]
    );

    return result[0] || null;
};

exports.findTodayCompleted = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureWBTable(pool);
    await ensureSearchIndexes(pool);

    const numbers = await expandVehicleNumbers(vehicleNumber, localToday());
    if (numbers.length === 0) return null;
    const keys = numbers.map(normalizePlate).filter(Boolean);
    const placeholders = numbers.map(() => "?").join(",");
    const keyPlaceholders = keys.map(() => "?").join(",");

    const result = await pool.execute(
        `SELECT wbEntryId, vehicleNumber, grossWeight, tareWeight, netWeight, status, createdAt
         FROM WeighBridgeEntries
         WHERE (UPPER(vehicleNumber) IN (${placeholders}) OR vehKey IN (${keyPlaceholders}))
           AND status = 'Completed'
           AND (isDeleted IS NULL OR isDeleted = 0)
           AND DATE(createdAt) = CURDATE()
         ORDER BY createdAt DESC
         LIMIT 1`,
        [...numbers, ...keys]
    );

    return result[0] || null;
};


exports.getAll = async ({ startDate, endDate, search } = {}) => {
    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    let query = `
        SELECT wb.*,
               (SELECT v.serialNumbers
                FROM Vehicles v
                WHERE v.vehicleNumber = wb.vehicleNumber
                ORDER BY v.allocationDate DESC, v.id DESC
                LIMIT 1) AS labSerialNumbers
        FROM WeighBridgeEntries wb
        WHERE (wb.isDeleted IS NULL OR wb.isDeleted = 0)
    `;
    const params = [];
    let ft = null;

    if (startDate && endDate) {
        query += ` AND (wb.createdAt >= ? AND wb.createdAt <= ?)`;
        params.push(`${startDate}T00:00:00`, `${endDate}T23:59:59.999`);
    }

    if (search && search.trim()) {
        ft = freeText("WeighBridgeEntries", search);
        query += ` AND ${ft.fragment}`;
        params.push(...ft.params);
    }

    query += ` ORDER BY wb.createdAt DESC, wb.id DESC`;

    const rows = await pool.execute(query, params).catch(async (e) => {
        if (ft && ft.kind === "match" && e && /MATCH|FULLTEXT/i.test(e && e.message ? e.message : "")) {
            const like = freeText("WeighBridgeEntries", search || "", true);
            query = query.replace(ft.fragment, like.fragment);
            params = params.slice(0, params.length - ft.params.length).concat(like.params);
            return pool.execute(query, params);
        }
        throw e;
    });

    return rows.map((row) => {
        if (row.labSerialNumbers && typeof row.labSerialNumbers === "string") {
            try { row.labSerialNumbers = JSON.parse(row.labSerialNumbers); } catch { row.labSerialNumbers = []; }
        } else if (!Array.isArray(row.labSerialNumbers)) {
            row.labSerialNumbers = [];
        }
        return row;
    });
};

async function ensureSoftDeleteColumns(pool) {
    try {
        await pool.execute("ALTER TABLE WeighBridgeEntries ADD COLUMN isDeleted TINYINT(1) DEFAULT 0");
    } catch {}
    try {
        await pool.execute("ALTER TABLE WeighBridgeEntries ADD COLUMN deletedAt DATETIME NULL");
    } catch {}
    try {
        await pool.execute("ALTER TABLE WeighBridgeEntries ADD COLUMN deletedBy VARCHAR(150) NULL");
    } catch {}
    try {
        await pool.execute("ALTER TABLE WeighBridgeEntries ADD COLUMN deletedById VARCHAR(50) NULL");
    } catch {}
}

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM WeighBridgeEntries WHERE (wbEntryId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("WeighBridge entry not found or already deleted.");
    }

    const record = lookupResult[0];

    await AuditLog.create({
        module: "WeighBridge",
        action: "DELETE",
        recordId: record.wbEntryId,
        recordData: {
            id: record.id,
            wbEntryId: record.wbEntryId,
            vehicleNumber: record.vehicleNumber,
            routeName: record.routeName,
            driverName: record.driverName,
            grossWeight: record.grossWeight,
            tareWeight: record.tareWeight,
            netWeight: record.netWeight,
            status: record.status,
            createdAt: record.createdAt
        },
        user: user,
        ipAddress: ipAddress
    });

    const now = new Date();
    await pool.execute(
        "UPDATE WeighBridgeEntries SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ?, updatedAt = ? WHERE wbEntryId = ?",
        [
            now,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            now,
            record.wbEntryId
        ]
    );

    return true;
};

exports.update = async (id, data) => {
    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM WeighBridgeEntries WHERE (wbEntryId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("WeighBridge entry not found or already deleted.");
    }

    const existing = lookupResult[0];
    const now = new Date();

    // Co-Packing / Other Vehicles purpose: route always null on update too.
    let nextPurpose = data.purpose !== undefined ? normalizeWbPurpose(data.purpose) : existing.purpose;
    let nextRoute = data.routeName !== undefined ? data.routeName : existing.routeName;
    if (String(existing.vehicleType || "").trim() === CO_PACKING_TYPE || nextPurpose === CO_PACKING_TYPE) {
        nextPurpose = CO_PACKING_TYPE;
        nextRoute = "";
    } else if (purposeSkipsRoute(nextPurpose)) {
        nextRoute = "";
    }

    await pool.execute(
        `UPDATE WeighBridgeEntries SET
            vehicleNumber = ?, routeName = ?, conductorName = ?, driverName = ?,
            supplierCode = ?, contractorCode = ?, purpose = ?, destination = ?,
            productGroup = ?, productName = ?, compartments = ?, weighBridgeNo = ?,
            grossWeight = ?, tareWeight = ?, netWeight = ?, status = ?,
            updatedAt = ?
         WHERE wbEntryId = ?`,
        [
            (data.vehicleNumber || existing.vehicleNumber || "").toUpperCase().trim(),
            nextRoute,
            data.conductorName !== undefined ? data.conductorName : existing.conductorName,
            data.driverName !== undefined ? data.driverName : existing.driverName,
            data.supplierCode !== undefined ? data.supplierCode : existing.supplierCode,
            data.contractorCode !== undefined ? data.contractorCode : existing.contractorCode,
            nextPurpose,
            data.destination !== undefined ? data.destination : existing.destination,
            data.productGroup !== undefined ? data.productGroup : existing.productGroup,
            data.productName !== undefined ? data.productName : existing.productName,
            data.compartments !== undefined ? data.compartments : existing.compartments,
            data.weighBridgeNo !== undefined ? data.weighBridgeNo : existing.weighBridgeNo,
            data.grossWeight !== undefined ? data.grossWeight : existing.grossWeight,
            data.tareWeight !== undefined ? data.tareWeight : existing.tareWeight,
            data.netWeight !== undefined ? data.netWeight : existing.netWeight,
            data.status || existing.status,
            now,
            existing.wbEntryId
        ]
    );

    return { ...existing, ...data, wbEntryId: existing.wbEntryId, updatedAt: now };
};
