const { connectDB, sql } = require("../config/db");
const { ensureSearchIndexes, normalizePlate } = require("../utils/searchIndexes");

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
            kgFat VARCHAR(50) NULL,
            kgSnf VARCHAR(50) NULL,
            totalKgFat VARCHAR(50) NULL,
            totalKgSNF VARCHAR(50) NULL,
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
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS LaboratoryCompartmentTests (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            labTestId VARCHAR(50) NOT NULL,
            vehicleNumber VARCHAR(20) NOT NULL,
            compartment VARCHAR(20) NOT NULL,
            temperature VARCHAR(20) NULL,
            cob VARCHAR(20) NULL,
            appearance VARCHAR(50) NULL,
            flavour VARCHAR(50) NULL,
            acidity VARCHAR(20) NULL,
            clr VARCHAR(20) NULL,
            fat VARCHAR(20) NULL,
            alcohol VARCHAR(20) NULL,
            snf VARCHAR(20) NULL,
            kgFat VARCHAR(20) NULL,
            kgSnf VARCHAR(20) NULL,
            skipped TINYINT(1) DEFAULT 0,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_lct_lab (labTestId)
        )
    `);
    await ensureExtraColumns(pool);
};

const ensureExtraColumns = async (pool) => {
    const addCol = async (col, ddl, table = "LaboratoryTests") => {
        try {
            const rows = await pool.execute(
                "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ? AND COLUMN_NAME = ?",
                [table, col]
            );
            if (!rows.length || rows[0].c === 0) await pool.execute(`ALTER TABLE ${table} ADD COLUMN ${ddl}`);
        } catch (_) {}
    };
    await addCol("kgFat", "kgFat VARCHAR(50) NULL");
    await addCol("kgSnf", "kgSnf VARCHAR(50) NULL");
    await addCol("totalKgFat", "totalKgFat VARCHAR(50) NULL");
    await addCol("totalKgSNF", "totalKgSNF VARCHAR(50) NULL");
    await addCol("quantity", "quantity VARCHAR(20) NULL", "LaboratoryCompartmentTests");

    // Adulteration test columns for LaboratoryCompartmentTests
    const adulterationCols = [
        "ammoniumSulphate", "detergent", "glucose", "melamine", "salt",
        "sodiumCarbonate", "sodiumCitrate", "sorbitol", "starch", "sucrose",
        "urea", "vegetableOils", "formaldehyde", "maltodextrin", "sodiumIonPPM",
    ];
    for (const col of adulterationCols) {
        await addCol(col, `${col} VARCHAR(20) NULL`, "LaboratoryCompartmentTests");
        await addCol(`${col}Value`, `${col}Value VARCHAR(100) NULL`, "LaboratoryCompartmentTests");
    }
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
    return (((clrVal + fatVal) / 4) + 0.35).toFixed(2);
};

const ADULTERATION_COLS = [
    "ammoniumSulphate", "detergent", "glucose", "melamine", "salt",
    "sodiumCarbonate", "sodiumCitrate", "sorbitol", "starch", "sucrose",
    "urea", "vegetableOils", "formaldehyde", "maltodextrin", "sodiumIonPPM",
];

const saveCompartments = async (pool, data, testedAt) => {
    const compartments = Array.isArray(data.compartments) ? data.compartments : [];
    for (const c of compartments) {
        const compartment = String(c.compartment || "").trim().toLowerCase();
        if (!compartment) continue;

        const existingComp = await pool.execute(
            "SELECT id FROM LaboratoryCompartmentTests WHERE labTestId = ? AND compartment = ? LIMIT 1",
            [data.labTestId, compartment]
        ).catch(() => []);

        const baseFields = [
            String(data.vehicleNumber || "").toUpperCase(),
            c.temperature || "",
            c.cob || "",
            c.appearance || c.foreignMatter || "",
            c.flavour || c.flavors || "",
            c.acidity || "",
            c.clr || "",
            c.fat || "",
            c.alcohol || "",
            c.snf || "",
            c.kgFat || "",
            c.kgSnf || "",
            c.quantity || "",
            c.skipped ? 1 : 0,
        ];

        const adulterationValues = ADULTERATION_COLS.map((col) => c[col] || "");
        const adulterationValueCols = ADULTERATION_COLS.map((col) => c[`${col}Value`] || "");

        const allValues = [...baseFields, ...adulterationValues, ...adulterationValueCols];

        const adulterationColNames = ADULTERATION_COLS.join(", ");
        const adulterationPlaceholders = ADULTERATION_COLS.map(() => "?").join(", ");
        const adulterationValueColNames = ADULTERATION_COLS.map((c) => `${c}Value`).join(", ");
        const adulterationValuePlaceholders = ADULTERATION_COLS.map(() => "?").join(", ");

        if (existingComp && existingComp.length > 0) {
            await pool.execute(
                `UPDATE LaboratoryCompartmentTests
                 SET vehicleNumber = ?, temperature = ?, cob = ?, appearance = ?, flavour = ?, acidity = ?,
                     clr = ?, fat = ?, alcohol = ?, snf = ?, kgFat = ?, kgSnf = ?, quantity = ?, skipped = ?,
                     ${ADULTERATION_COLS.map((c) => `${c} = ?`).join(", ")},
                     ${ADULTERATION_COLS.map((c) => `${c}Value = ?`).join(", ")}
                 WHERE labTestId = ? AND compartment = ?`,
                [...baseFields, ...adulterationValues, ...adulterationValueCols, data.labTestId, compartment]
            );
        } else {
            await pool.execute(
                `INSERT INTO LaboratoryCompartmentTests
                 (labTestId, compartment, vehicleNumber, temperature, cob, appearance, flavour, acidity,
                  clr, fat, alcohol, snf, kgFat, kgSnf, quantity, skipped,
                  ${adulterationColNames}, ${adulterationValueColNames})
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
                  ${adulterationPlaceholders}, ${adulterationValuePlaceholders})`,
                [data.labTestId, compartment, ...allValues]
            );
        }
    }
};

const getCompartments = async (pool, labTestId) => {
    const adulterationSelects = ADULTERATION_COLS.map((c) => `${c}, ${c}Value`).join(", ");
    const rows = await pool.execute(
        `SELECT compartment, temperature, cob, appearance, flavour, acidity, clr, fat, alcohol, snf,
                kgFat, kgSnf, quantity, skipped, ${adulterationSelects}
         FROM LaboratoryCompartmentTests WHERE labTestId = ? ORDER BY id ASC`,
        [labTestId]
    ).catch(() => []);
    return rows || [];
};

const normalizeRecord = async (pool, row) => {
    if (!row) return null;
    if (row.sealNumbers && typeof row.sealNumbers === "string") {
        try { row.sealNumbers = JSON.parse(row.sealNumbers); } catch { row.sealNumbers = []; }
    }
    if (pool && row.labTestId) {
        row.compartments = await getCompartments(pool, row.labTestId);
    }
    return row;
};

exports.create = async (data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSearchIndexes(pool);

    const testedAt = data.testedAt && !Number.isNaN(new Date(data.testedAt).getTime())
        ? new Date(data.testedAt)
        : new Date();
    const snf = data.snf || calculateSNF(data.clr, data.fat);
    const sealNumbers = Array.isArray(data.sealNumbers) ? JSON.stringify(data.sealNumbers) : (data.sealNumbers || "[]");

    await pool.execute(
        `INSERT INTO LaboratoryTests
         (labTestId, vehicleNumber, routeNo, taluk, gateEntryId, wbEntryId, driverName, supplierName,
          materialType, productName, sealNumbers, temperature, cob, acidity, appearance,
          clr, fat, alcohol, snf, kgFat, kgSnf, totalKgFat, totalKgSNF, flavors, remarks, testedByName, testedByEmpId, testedAt)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
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
            data.kgFat || "",
            data.kgSnf || "",
            data.totalKgFat || "",
            data.totalKgSNF || "",
            data.flavors || "",
            data.remarks || "",
            data.testedByName || "",
            data.testedByEmpId || "",
            testedAt,
        ]
    );

    await saveCompartments(pool, data, testedAt);
    const compartments = await getCompartments(pool, data.labTestId);

    return { ...data, vehicleNumber: String(data.vehicleNumber).toUpperCase(), snf, compartments, testedAt };
};

exports.getAll = async ({ vehicleNumber, routeNo, startDate, endDate } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

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
    if (rows && rows.length > 0) {
        for (const row of rows) {
            await normalizeRecord(pool, row);
        }
    }
    return rows;
};

exports.getVehicleData = async (vehicleNumber, date = null) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);
    const input = String(vehicleNumber || "").trim().toUpperCase();
    if (!input) return { gate: null, weighbridge: null, sampleCollection: null, sealNumbers: [] };

    const cleanInput = input.replace(/[\s-]/g, "");
    const targetDate = date ? String(date).slice(0, 10) : null;
    const today = new Date().toISOString().slice(0, 10);
    const effectiveDate = targetDate || today;
    const searchPlates = new Set([input, cleanInput]);

    try {
        const AlternativeVehicle = require("./alternativeVehicleModel");
        const alt = await AlternativeVehicle.findActiveForVehicle(input, effectiveDate);
        if (alt) {
            if (alt.primaryVehicleNumber) {
                searchPlates.add(String(alt.primaryVehicleNumber).trim().toUpperCase());
                searchPlates.add(String(alt.primaryVehicleNumber).trim().toUpperCase().replace(/[\s-]/g, ""));
            }
            if (alt.alternativeVehicleNumber) {
                searchPlates.add(String(alt.alternativeVehicleNumber).trim().toUpperCase());
                searchPlates.add(String(alt.alternativeVehicleNumber).trim().toUpperCase().replace(/[\s-]/g, ""));
            }
        }
    } catch (_) {}

    const plateArray = Array.from(searchPlates).filter(Boolean);
    const plateKeys = Array.from(new Set(plateArray.map(normalizePlate).filter(Boolean)));
    const keyPlaceholders = plateKeys.map(() => "?").join(",");

    const dateCond = targetDate ? `AND ${sql.date("COALESCE(%s, createdAt)")} <= ?` : "";
    const orderBy = "ORDER BY COALESCE(%s, createdAt) DESC, id DESC LIMIT 1";
    const dateParams = (() => {
        const arr = [];
        if (targetDate) arr.push(targetDate);
        return arr;
    })();

    let gateResult = [];
    if (plateKeys.length > 0) {
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND vehKey IN (${keyPlaceholders})
               ${dateCond.replace("%s", "entryDateTime")}
             ${orderBy.replace("%s", "entryDateTime")}`,
            [...plateKeys, ...dateParams]
        ).catch(() => []);
    }
    if (!gateResult || gateResult.length === 0) {
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND UPPER(routeName) = UPPER(?)
               ${dateCond.replace("%s", "entryDateTime")}
             ${orderBy.replace("%s", "entryDateTime")}`,
            [input, ...dateParams]
        ).catch(() => []);
    }

    let weighbridgeResult = [];
    if (plateKeys.length > 0) {
        weighbridgeResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND vehKey IN (${keyPlaceholders})
               ${dateCond.replace("%s", "initialWeightAt")}
             ${orderBy.replace("%s", "initialWeightAt")}`,
            [...plateKeys, ...dateParams]
        ).catch(() => []);
    }
    if (!weighbridgeResult || weighbridgeResult.length === 0) {
        weighbridgeResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND UPPER(routeName) = UPPER(?)
               ${dateCond.replace("%s", "initialWeightAt")}
             ${orderBy.replace("%s", "initialWeightAt")}`,
            [input, ...dateParams]
        ).catch(() => []);
    }

    let sampleResult = [];
    if (plateKeys.length > 0) {
        sampleResult = await pool.execute(
            `SELECT * FROM SampleCollections
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND vehKey IN (${keyPlaceholders})
               ${dateCond.replace("%s", "collectedAt")}
             ${orderBy.replace("%s", "collectedAt")}`,
            [...plateKeys, ...dateParams]
        ).catch(() => []);
    }
    if (!sampleResult || sampleResult.length === 0) {
        sampleResult = await pool.execute(
            `SELECT * FROM SampleCollections
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND UPPER(routeNo) = UPPER(?)
               ${dateCond.replace("%s", "collectedAt")}
             ${orderBy.replace("%s", "collectedAt")}`,
            [input, ...dateParams]
        ).catch(() => []);
    }

    const gate = gateResult[0] || null;
    let sealNumbers = [];

    if (gate) {
        let seals = [];
        if (gate.sealNumbers) {
            if (typeof gate.sealNumbers === "string") {
                try { seals = JSON.parse(gate.sealNumbers); } catch { seals = []; }
            } else if (Array.isArray(gate.sealNumbers)) {
                seals = gate.sealNumbers;
            }
        }
        if (!Array.isArray(seals) || seals.length === 0) {
            const legacy = [gate.sealNumber1, gate.sealNumber2, gate.sealNumber3, gate.sealNumber4].filter((s) => s && String(s).trim() !== "");
            if (legacy.length > 0) seals = legacy;
        }
        gate.sealNumbers = Array.isArray(seals) ? seals : [];
        if (gate.sealNumbers.length > 0) sealNumbers = gate.sealNumbers;
    }

    const sampleCollection = sampleResult[0] || null;
    if (sealNumbers.length === 0 && sampleCollection && sampleCollection.sealNumbers) {
        let seals = sampleCollection.sealNumbers;
        if (typeof seals === "string") {
            try { seals = JSON.parse(seals); } catch { seals = []; }
        }
        if (Array.isArray(seals) && seals.length) sealNumbers = seals;
    }

    return { gate, weighbridge: weighbridgeResult[0] || null, sampleCollection, sealNumbers };
};

exports.getDataByRoute = async (routeNo, date = null) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);
    const input = String(routeNo || "").trim().toUpperCase();
    if (!input) return { vehicles: [], weighbridge: null, gate: null, sampleCollection: null, sealNumbers: [] };

    const routeCode = input.split(/[\s-]/)[0];
    const routeLike = `%${routeCode}%`;
    const targetDate = date ? String(date).slice(0, 10) : null;

    let wbResult, gateResult, sampleResult;
    if (targetDate) {
        wbResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries 
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeName) = ? OR UPPER(routeName) LIKE ? OR REPLACE(UPPER(routeName), ' ', '') LIKE ?)
               AND ${sql.date("COALESCE(initialWeightAt, createdAt)")} <= ?
             ORDER BY createdAt DESC, id DESC`,
            [input, routeLike, routeLike, targetDate]
        ).catch(() => []);
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeName) = ? OR UPPER(routeName) LIKE ? OR REPLACE(UPPER(routeName), ' ', '') LIKE ?)
               AND ${sql.date("COALESCE(entryDateTime, createdAt)")} <= ?
             ORDER BY COALESCE(entryDateTime, createdAt) DESC, id DESC`,
            [input, routeLike, routeLike, targetDate]
        ).catch(() => []);
        sampleResult = await pool.execute(
            `SELECT * FROM SampleCollections
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeNo) = ? OR UPPER(routeNo) LIKE ? OR REPLACE(UPPER(routeNo), ' ', '') LIKE ?)
               AND ${sql.date("COALESCE(collectedAt, createdAt)")} <= ?
             ORDER BY COALESCE(collectedAt, createdAt) DESC, id DESC`,
            [input, routeLike, routeLike, targetDate]
        ).catch(() => []);
    } else {
        wbResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries 
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeName) = ? OR UPPER(routeName) LIKE ? OR REPLACE(UPPER(routeName), ' ', '') LIKE ?)
             ORDER BY createdAt DESC, id DESC`,
            [input, routeLike, routeLike]
        ).catch(() => []);
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeName) = ? OR UPPER(routeName) LIKE ? OR REPLACE(UPPER(routeName), ' ', '') LIKE ?)
             ORDER BY COALESCE(entryDateTime, createdAt) DESC, id DESC`,
            [input, routeLike, routeLike]
        ).catch(() => []);
        sampleResult = await pool.execute(
            `SELECT * FROM SampleCollections
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND (UPPER(routeNo) = ? OR UPPER(routeNo) LIKE ? OR REPLACE(UPPER(routeNo), ' ', '') LIKE ?)
             ORDER BY COALESCE(collectedAt, createdAt) DESC, id DESC`,
            [input, routeLike, routeLike]
        ).catch(() => []);
    }

    const vehicleSet = new Set();
    wbResult.forEach((w) => w.vehicleNumber && vehicleSet.add(w.vehicleNumber.toUpperCase()));
    gateResult.forEach((g) => g.vehicleNumber && vehicleSet.add(g.vehicleNumber.toUpperCase()));
    sampleResult.forEach((s) => s.vehicleNumber && vehicleSet.add(s.vehicleNumber.toUpperCase()));

    const vehicles = Array.from(vehicleSet).map((v) => ({ vehicleNumber: v, routeName: input }));

    const weighbridge = wbResult[0] || null;
    const gate = gateResult[0] || null;
    const sampleCollection = sampleResult[0] || null;

    let sealNumbers = [];
    if (gate) {
        let seals = gate.sealNumbers;
        if (typeof seals === "string") {
            try { seals = JSON.parse(seals); } catch { seals = []; }
        }
        if (Array.isArray(seals) && seals.length) sealNumbers = seals;
    }
    if (sealNumbers.length === 0 && sampleCollection && sampleCollection.sealNumbers) {
        let seals = sampleCollection.sealNumbers;
        if (typeof seals === "string") {
            try { seals = JSON.parse(seals); } catch { seals = []; }
        }
        if (Array.isArray(seals) && seals.length) sealNumbers = seals;
    }

    let finalGate = gate;
    let finalWb = weighbridge;
    let finalSample = sampleCollection;

    const primaryVehicle = (vehicles[0] && vehicles[0].vehicleNumber) || null;
    if (primaryVehicle) {
        const vehicleData = await exports.getVehicleData(primaryVehicle, targetDate);
        if (!finalGate) finalGate = vehicleData.gate;
        if (!finalWb) finalWb = vehicleData.weighbridge;
        if (!finalSample) finalSample = vehicleData.sampleCollection;
        if (sealNumbers.length === 0) sealNumbers = vehicleData.sealNumbers || [];
    }

    return {
        vehicles,
        weighbridge: finalWb,
        gate: finalGate,
        sampleCollection: finalSample,
        sealNumbers,
    };
};

exports.findByDateVehicleRoute = async ({ date, vehicleNumber, routeNo } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

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
    return rows.length > 0 ? await normalizeRecord(pool, rows[0]) : null;
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
    return rows.length > 0 ? await normalizeRecord(pool, rows[0]) : null;
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
    const now = new Date();

    await pool.execute(
        `UPDATE LaboratoryTests SET
            temperature = ?, cob = ?, acidity = ?, appearance = ?,
            clr = ?, fat = ?, alcohol = ?, snf = ?, kgFat = ?, kgSnf = ?, totalKgFat = ?, totalKgSNF = ?,
            flavors = ?, remarks = ?, updatedAt = ?
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
            data.kgFat ?? existing.kgFat,
            data.kgSnf ?? existing.kgSnf,
            data.totalKgFat ?? existing.totalKgFat,
            data.totalKgSNF ?? existing.totalKgSNF,
            data.flavors ?? existing.flavors,
            data.remarks ?? existing.remarks,
            now,
            existing.labTestId,
        ]
    );

    await saveCompartments(pool, { ...existing, ...data, labTestId: existing.labTestId }, now);
    const compartments = await getCompartments(pool, existing.labTestId);

    return { ...existing, ...data, snf, compartments, updatedAt: now };
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
