const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");
const AlternativeVehicle = require("./alternativeVehicleModel");
const { ensureSearchIndexes, normalizePlate, freeText } = require("../utils/searchIndexes");

// Adulteration tests captured per compartment. All are stored as
// "Positive" / "Negative" except Sodium Ion which is an optional PPM value.
const ADULTERATION_FIELDS = [
    "ammoniumSulphate",
    "detergent",
    "glucose",
    "melamine",
    "salt",
    "sodiumCarbonate",
    "sodiumCitrate",
    "sorbitol",
    "starch",
    "sucrose",
    "urea",
    "vegetableOils",
    "formaldehyde",
    "maltodextrin",
    "sodiumIonPPM",
];

// Optional "value" placeholders paired with each Positive/Negative adulteration
// test (Sodium Ion already stores its own PPM value, so no extra placeholder).
const ADULTERATION_VALUE_FIELDS = ADULTERATION_FIELDS
    .filter((f) => f !== "sodiumIonPPM")
    .map((f) => `${f}Value`);

// Optional "value" placeholders paired with the quality tests.
const QUALITY_VALUE_FIELDS = ["foreignMatterValue", "flavourValue", "cobValue"];

// Columns used when reading compartment rows back from SampleCompartmentTests.
const COMPARTMENT_SELECT = [
    "foreignMatter", "flavour", "temperature", "cob",
    ...QUALITY_VALUE_FIELDS,
    ...ADULTERATION_FIELDS,
    ...ADULTERATION_VALUE_FIELDS,
    "skipped",
].join(", ");

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
            sealStatus VARCHAR(50) NULL,
            sealDiscrepancyReason ${sql.longText} NULL,
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
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SampleCompartmentTests (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            sampleId VARCHAR(50) NOT NULL,
            vehicleNumber VARCHAR(20) NOT NULL,
            compartment VARCHAR(20) NOT NULL,
            foreignMatter VARCHAR(20) NULL,
            flavour VARCHAR(20) NULL,
            temperature VARCHAR(20) NULL,
            cob VARCHAR(20) NULL,
            foreignMatterValue VARCHAR(100) NULL,
            flavourValue VARCHAR(100) NULL,
            cobValue VARCHAR(100) NULL,
            ammoniumSulphate VARCHAR(20) NULL,
            detergent VARCHAR(20) NULL,
            glucose VARCHAR(20) NULL,
            melamine VARCHAR(20) NULL,
            salt VARCHAR(20) NULL,
            sodiumCarbonate VARCHAR(20) NULL,
            sodiumCitrate VARCHAR(20) NULL,
            sorbitol VARCHAR(20) NULL,
            starch VARCHAR(20) NULL,
            sucrose VARCHAR(20) NULL,
            urea VARCHAR(20) NULL,
            vegetableOils VARCHAR(20) NULL,
            formaldehyde VARCHAR(20) NULL,
            maltodextrin VARCHAR(20) NULL,
            sodiumIonPPM VARCHAR(20) NULL,
            ammoniumSulphateValue VARCHAR(100) NULL,
            detergentValue VARCHAR(100) NULL,
            glucoseValue VARCHAR(100) NULL,
            melamineValue VARCHAR(100) NULL,
            saltValue VARCHAR(100) NULL,
            sodiumCarbonateValue VARCHAR(100) NULL,
            sodiumCitrateValue VARCHAR(100) NULL,
            sorbitolValue VARCHAR(100) NULL,
            starchValue VARCHAR(100) NULL,
            sucroseValue VARCHAR(100) NULL,
            ureaValue VARCHAR(100) NULL,
            vegetableOilsValue VARCHAR(100) NULL,
            formaldehydeValue VARCHAR(100) NULL,
            maltodextrinValue VARCHAR(100) NULL,
            skipped TINYINT(1) NOT NULL DEFAULT 0,
            testedBy VARCHAR(150) NULL,
            testedById VARCHAR(50) NULL,
            testedAt DATETIME NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            UNIQUE KEY uq_sample_comp (sampleId, compartment),
            INDEX idx_sct_sample (sampleId)
        )
    `);
    await migrateSealAndCompartmentColumns(pool);
    await migrateAdulterationColumns(pool);
    await migrateQualityValueColumns(pool);
    await migrateAdulterationValueColumns(pool);
};

// Idempotent migration: optional "value" placeholders paired with each of the
// quality tests that use a dropdown (Foreign Matter, Flavour, COB).
const migrateQualityValueColumns = async (pool) => {
    const defs = {
        foreignMatterValue: "VARCHAR(100) NULL",
        flavourValue: "VARCHAR(100) NULL",
        cobValue: "VARCHAR(100) NULL",
    };
    for (const [col, ddl] of Object.entries(defs)) {
        try {
            const rows = await pool.execute(
                "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'SampleCompartmentTests' AND COLUMN_NAME = ?",
                [col]
            );
            if (!rows.length || rows[0].c === 0) {
                await pool.execute(`ALTER TABLE SampleCompartmentTests ADD COLUMN ${col} ${ddl}`);
            }
        } catch (_) { /* ignore if table does not exist yet */ }
    }
};

// Idempotent migration: optional "value" placeholders paired with each
// Positive/Negative adulteration test.
const migrateAdulterationValueColumns = async (pool) => {
    for (const col of ADULTERATION_VALUE_FIELDS) {
        try {
            const rows = await pool.execute(
                "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'SampleCompartmentTests' AND COLUMN_NAME = ?",
                [col]
            );
            if (!rows.length || rows[0].c === 0) {
                await pool.execute(`ALTER TABLE SampleCompartmentTests ADD COLUMN ${col} VARCHAR(100) NULL`);
            }
        } catch (_) { /* ignore if table does not exist yet */ }
    }
};

// Idempotent migration: adds the per-compartment adulteration test columns to
// existing SampleCompartmentTests tables (fresh installs get them via the DDL).
const migrateAdulterationColumns = async (pool) => {
    const defs = {
        ammoniumSulphate: "VARCHAR(20) NULL",
        detergent: "VARCHAR(20) NULL",
        glucose: "VARCHAR(20) NULL",
        melamine: "VARCHAR(20) NULL",
        salt: "VARCHAR(20) NULL",
        sodiumCarbonate: "VARCHAR(20) NULL",
        sodiumCitrate: "VARCHAR(20) NULL",
        sorbitol: "VARCHAR(20) NULL",
        starch: "VARCHAR(20) NULL",
        sucrose: "VARCHAR(20) NULL",
        urea: "VARCHAR(20) NULL",
        vegetableOils: "VARCHAR(20) NULL",
        formaldehyde: "VARCHAR(20) NULL",
        maltodextrin: "VARCHAR(20) NULL",
        sodiumIonPPM: "VARCHAR(20) NULL",
    };
    for (const [col, ddl] of Object.entries(defs)) {
        try {
            const rows = await pool.execute(
                "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'SampleCompartmentTests' AND COLUMN_NAME = ?",
                [col]
            );
            if (!rows.length || rows[0].c === 0) {
                await pool.execute(`ALTER TABLE SampleCompartmentTests ADD COLUMN ${col} ${ddl}`);
            }
        } catch (_) { /* ignore if table does not exist yet */ }
    }
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

const migrateSealAndCompartmentColumns = async (pool) => {
    const addCol = async (col, ddl) => {
        try {
            const rows = await pool.execute(
                "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'SampleCollections' AND COLUMN_NAME = ?",
                [col]
            );
            if (!rows.length || rows[0].c === 0) await pool.execute(`ALTER TABLE SampleCollections ADD COLUMN ${ddl}`);
        } catch (_) { /* ignore */ }
    };
    await addCol("sealStatus", "sealStatus VARCHAR(50) NULL");
    await addCol("sealDiscrepancyReason", "sealDiscrepancyReason LONGTEXT NULL");
};

const saveCompartments = async (pool, data, collectedAt) => {
    const compartments = Array.isArray(data.compartments) ? data.compartments : [];
    const compFields = ADULTERATION_FIELDS;
    const valueFields = [...QUALITY_VALUE_FIELDS, ...ADULTERATION_VALUE_FIELDS];
    const allFields = [...compFields, ...valueFields];
    const cols = allFields.join(", ");
    const setCols = allFields.map((f) => `${f} = ?`).join(", ");
    const placeholders = allFields.map(() => "?").join(", ");
    const valuesOf = (c) =>
        allFields.map((f) => {
            const v = c[f];
            if (v === undefined || v === null || String(v).trim() === "") return null;
            return String(v);
        })

    for (const c of compartments) {
        const compartment = String(c.compartment || "").trim().toLowerCase();
        if (!compartment) continue;

        const tempVal = c.temperature === undefined || c.temperature === null || c.temperature === "" ? null : String(c.temperature);
        const existingComp = await pool.execute(
            "SELECT id FROM SampleCompartmentTests WHERE sampleId = ? AND compartment = ? LIMIT 1",
            [data.sampleId, compartment]
        ).catch(() => []);

        if (existingComp && existingComp.length > 0) {
            await pool.execute(
                `UPDATE SampleCompartmentTests
                 SET vehicleNumber = ?, foreignMatter = ?, flavour = ?, temperature = ?, cob = ?, ${setCols}, skipped = ?, testedBy = ?, testedById = ?, testedAt = ?
                 WHERE sampleId = ? AND compartment = ?`,
                [
                    String(data.vehicleNumber || "").toUpperCase(),
                    c.foreignMatter || "",
                    c.flavour || "",
                    tempVal,
                    c.cob || "",
                    ...valuesOf(c),
                    c.skipped ? 1 : 0,
                    data.sampleCollectedBy || "",
                    data.sampleCollectedByEmpId || "",
                    data.collectedAt ? new Date(data.collectedAt) : collectedAt,
                    data.sampleId,
                    compartment,
                ]
            );
        } else {
            await pool.execute(
                `INSERT INTO SampleCompartmentTests
                 (sampleId, vehicleNumber, compartment, foreignMatter, flavour, temperature, cob, ${cols}, skipped, testedBy, testedById, testedAt)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ${placeholders}, ?, ?, ?, ?)`,
                [
                    data.sampleId,
                    String(data.vehicleNumber || "").toUpperCase(),
                    compartment,
                    c.foreignMatter || "",
                    c.flavour || "",
                    tempVal,
                    c.cob || "",
                    ...valuesOf(c),
                    c.skipped ? 1 : 0,
                    data.sampleCollectedBy || "",
                    data.sampleCollectedByEmpId || "",
                    data.collectedAt ? new Date(data.collectedAt) : collectedAt,
                ]
            );
        }
    }
};

exports.create = async (data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await migrateRemarksColumn(pool);
    await migrateAdulterationColumns(pool);
    await migrateAdulterationValueColumns(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);
    const collectedAt = data.collectedAt && !Number.isNaN(new Date(data.collectedAt).getTime())
        ? new Date(data.collectedAt)
        : new Date();
    const sealNumbers = Array.isArray(data.sealNumbers) ? JSON.stringify(data.sealNumbers) : (data.sealNumbers || "[]");
    const sealStatus = data.sealStatus || "Intact";
    const sealDiscrepancyReason = data.sealDiscrepancyReason || null;

    let targetSampleId = data.sampleId;
    const existingBySample = await pool.execute(
        "SELECT sampleId FROM SampleCollections WHERE sampleId = ? AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
        [data.sampleId]
    ).catch(() => []);

    if (!existingBySample || existingBySample.length === 0) {
        const base = new Date(collectedAt);
        base.setHours(0, 0, 0, 0);
        const end = new Date(base.getTime() + 86400000);
        const existingRows = await pool.execute(
            "SELECT sampleId, vehicleNumber, collectedAt FROM SampleCollections WHERE (UPPER(vehicleNumber) = ? OR vehKey = ?) AND collectedAt >= ? AND collectedAt < ? AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
            [String(data.vehicleNumber).toUpperCase(), normalizePlate(data.vehicleNumber), base, end]
        ).catch(() => []);
        if (existingRows && existingRows.length > 0) {
            // Update existing record for vehicle today instead of throwing duplicate error
            targetSampleId = existingRows[0].sampleId;
            data.sampleId = targetSampleId;
            await pool.execute(
                `UPDATE SampleCollections SET
                    vehicleNumber = ?, gateEntryId = ?, wbEntryId = ?, routeNo = ?, taluk = ?, materialType = ?,
                    sealNumbers = ?, sealStatus = ?, sealDiscrepancyReason = ?, quantity = ?, temperature = ?,
                    remarks = ?, sampleCollectedBy = ?, sampleCollectedByEmpId = ?, collectedAt = ?
                 WHERE sampleId = ?`,
                [
                    String(data.vehicleNumber).toUpperCase(),
                    data.gateEntryId || "",
                    data.wbEntryId || "",
                    data.routeNo || "",
                    data.taluk || "",
                    data.materialType || "",
                    sealNumbers,
                    sealStatus,
                    sealDiscrepancyReason,
                    data.quantity,
                    data.temperature,
                    data.remarks || "",
                    data.sampleCollectedBy || "",
                    data.sampleCollectedByEmpId || "",
                    collectedAt,
                    targetSampleId,
                ]
            );
        } else {
            await pool.execute(
                `INSERT INTO SampleCollections
                 (sampleId, vehicleNumber, gateEntryId, wbEntryId, routeNo, taluk, materialType, sealNumbers,
                  sealStatus, sealDiscrepancyReason, quantity, temperature, remarks, sampleCollectedBy, sampleCollectedByEmpId, collectedAt)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    data.sampleId,
                    String(data.vehicleNumber).toUpperCase(),
                    data.gateEntryId || "",
                    data.wbEntryId || "",
                    data.routeNo || "",
                    data.taluk || "",
                    data.materialType || "",
                    sealNumbers,
                    sealStatus,
                    sealDiscrepancyReason,
                    data.quantity,
                    data.temperature,
                    data.remarks || "",
                    data.sampleCollectedBy || "",
                    data.sampleCollectedByEmpId || "",
                    collectedAt,
                ]
            );
        }
    } else {
        await pool.execute(
            `UPDATE SampleCollections SET
                vehicleNumber = ?, gateEntryId = ?, wbEntryId = ?, routeNo = ?, taluk = ?, materialType = ?,
                sealNumbers = ?, sealStatus = ?, sealDiscrepancyReason = ?, quantity = ?, temperature = ?,
                remarks = ?, sampleCollectedBy = ?, sampleCollectedByEmpId = ?, collectedAt = ?
             WHERE sampleId = ?`,
            [
                String(data.vehicleNumber).toUpperCase(),
                data.gateEntryId || "",
                data.wbEntryId || "",
                data.routeNo || "",
                data.taluk || "",
                data.materialType || "",
                sealNumbers,
                sealStatus,
                sealDiscrepancyReason,
                data.quantity,
                data.temperature,
                data.remarks || "",
                data.sampleCollectedBy || "",
                data.sampleCollectedByEmpId || "",
                collectedAt,
                data.sampleId,
            ]
        );
    }

    await saveCompartments(pool, data, collectedAt);

    return { ...data, sampleId: targetSampleId, vehicleNumber: String(data.vehicleNumber).toUpperCase(), collectedAt };
};

// Convert a client wall-clock date ("YYYY-MM-DD") plus the client's UTC offset
// in minutes (e.g. +330 for IST) into a UTC datetime range for the whole local day.
// Sample collections are stored in UTC (DB connection timezone "+00:00"), while the
// frontend filters by the user's local date — without this conversion, records
// collected early in the morning (00:00–05:30 IST) get stored as the previous UTC
// day and disappear from "Today" views.
const localDateRangeUtc = (dateStr, offsetMinutes) => {
    const parts = String(dateStr || "").split("-").map(Number);
    if (parts.length !== 3 || parts.some((n) => Number.isNaN(n))) return null;
    const [y, m, d] = parts;
    const offsetMs = (Number(offsetMinutes) || 0) * 60000;
    const startUtc = new Date(Date.UTC(y, m - 1, d) - offsetMs);
    const endUtc = new Date(startUtc.getTime() + 86400000);
    const toSql = (dt) => dt.toISOString().slice(0, 19).replace("T", " ");
    return { start: toSql(startUtc), end: toSql(endUtc) };
};

exports.getAll = async ({ vehicleNumber, routeNo, startDate, endDate, search, utcOffsetMinutes } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await migrateAdulterationColumns(pool);
    await migrateAdulterationValueColumns(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    let query = "SELECT * FROM SampleCollections WHERE (isDeleted IS NULL OR isDeleted = 0)";
    const params = [];
    let ft = null;

    if (vehicleNumber && vehicleNumber.trim()) {
        const vUpper = String(vehicleNumber).trim().toUpperCase();
        const vClean = vUpper.replace(/[\s-]/g, "");
        query += " AND (UPPER(vehicleNumber) = ? OR REPLACE(REPLACE(UPPER(vehicleNumber), ' ', ''), '-', '') = ?)";
        params.push(vUpper, vClean);
    }

    if (routeNo && routeNo.trim()) {
        const rUpper = String(routeNo).trim().toUpperCase();
        const rClean = rUpper.replace(/^0+/, "");
        query += " AND (UPPER(routeNo) = ? OR UPPER(routeNo) LIKE ? OR UPPER(routeNo) LIKE ?)";
        params.push(rUpper, `${rUpper}%`, `%${rClean}%`);
    }

    if (startDate && endDate) {
        const range = localDateRangeUtc(startDate, utcOffsetMinutes);
        if (range) {
            query += " AND collectedAt >= ? AND collectedAt < ?";
            params.push(range.start, range.end);
        }
    }

    if (search && search.trim()) {
        ft = freeText("SampleCollections", search);
        query += ` AND ${ft.fragment}`;
        params.push(...ft.params);
    }

    query += " ORDER BY collectedAt DESC, id DESC";

    const rows = await pool.execute(query, params).catch(async (e) => {
        if (ft && ft.kind === "match" && e && /MATCH|FULLTEXT/i.test(e && e.message ? e.message : "")) {
            const like = freeText("SampleCollections", search || "", true);
            query = query.replace(ft.fragment, like.fragment);
            params = params.slice(0, params.length - ft.params.length).concat(like.params);
            return pool.execute(query, params);
        }
        throw e;
    });
    if (rows && rows.length > 0) {
        const sampleIds = rows.map((r) => r.sampleId);
        const placeholders = sampleIds.map(() => "?").join(",");
        const compRows = await pool.execute(
            `SELECT sampleId, compartment, ${COMPARTMENT_SELECT}
             FROM SampleCompartmentTests WHERE sampleId IN (${placeholders}) ORDER BY compartment`,
            sampleIds
        ).catch(() => []);
        const bySample = {};
        (compRows || []).forEach((c) => {
            if (!bySample[c.sampleId]) bySample[c.sampleId] = [];
            bySample[c.sampleId].push(c);
        });
        rows.forEach((r) => { r.compartments = bySample[r.sampleId] || []; });
    }
    return rows;
};

exports.getCompartments = async (sampleId) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await migrateAdulterationColumns(pool);
    await migrateAdulterationValueColumns(pool);
    const rows = await pool.execute(
        `SELECT compartment, ${COMPARTMENT_SELECT} FROM SampleCompartmentTests WHERE sampleId = ? ORDER BY compartment`,
        [sampleId]
    ).catch(() => []);
    return rows || [];
};

exports.getByVehicleAndDate = async (vehicleNumber, date, utcOffsetMinutes) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await migrateAdulterationColumns(pool);
    await migrateAdulterationValueColumns(pool);
    await ensureSearchIndexes(pool);

    let bounds;
    const range = date && /^\d{4}-\d{2}-\d{2}/.test(String(date))
        ? localDateRangeUtc(String(date).slice(0, 10), utcOffsetMinutes)
        : null;
    if (range) {
        bounds = [range.start, range.end];
    } else {
        const now = new Date();
        const dayStart = new Date(now);
        dayStart.setHours(0, 0, 0, 0);
        const dayEnd = new Date(dayStart);
        dayEnd.setDate(dayEnd.getDate() + 1);
        bounds = [dayStart, dayEnd];
    }

    const rows = await pool.execute(
        "SELECT * FROM SampleCollections WHERE (UPPER(vehicleNumber) = ? OR vehKey = ?) AND collectedAt >= ? AND collectedAt < ? AND (isDeleted IS NULL OR isDeleted = 0) ORDER BY collectedAt DESC, id DESC LIMIT 1",
        [String(vehicleNumber || "").trim().toUpperCase(), normalizePlate(vehicleNumber), bounds[0], bounds[1]]
    ).catch(() => []);
    if (!rows || rows.length === 0) return null;
    const row = rows[0];
    if (row.sealNumbers && typeof row.sealNumbers === "string") {
        try { row.sealNumbers = JSON.parse(row.sealNumbers); } catch { row.sealNumbers = []; }
    }
    row.compartments = await exports.getCompartments(row.sampleId);
    return row;
};

exports.getVehicleData = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);
    const input = String(vehicleNumber || "").trim().toUpperCase();
    if (!input) return { gate: null, weighbridge: null };

    // Strip spaces and hyphens for flexible plate matching (e.g. KA-01-AB-1234 vs KA01AB1234)
    const cleanInput = input.replace(/[\s-]/g, "");

    // Expand search list using active alternative vehicle window today
    const today = new Date().toISOString().slice(0, 10);
    const searchPlates = new Set([input, cleanInput]);

    try {
        const alt = await AlternativeVehicle.findActiveForVehicle(input, today);
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

    // 1. Lookup Gate Entry
    let gateResult = [];
    if (plateKeys.length > 0) {
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND vehKey IN (${keyPlaceholders})
             ORDER BY COALESCE(entryDateTime, createdAt) DESC, id DESC LIMIT 1`,
            plateKeys
        ).catch(() => []);
    }

    // Fallback: If no Gate Entry found by plate, search by routeName
    if (!gateResult || gateResult.length === 0) {
        gateResult = await pool.execute(
            `SELECT * FROM GateEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND UPPER(routeName) = UPPER(?)
             ORDER BY COALESCE(entryDateTime, createdAt) DESC, id DESC LIMIT 1`,
            [input]
        ).catch(() => []);
    }

    // 2. Lookup WeighBridge Entry
    let weighbridgeResult = [];
    if (plateKeys.length > 0) {
        weighbridgeResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND vehKey IN (${keyPlaceholders})
             ORDER BY COALESCE(initialWeightAt, createdAt) DESC, id DESC LIMIT 1`,
            plateKeys
        ).catch(() => []);
    }

    // Fallback: If no WeighBridge Entry found by plate, search by routeName
    if (!weighbridgeResult || weighbridgeResult.length === 0) {
        weighbridgeResult = await pool.execute(
            `SELECT * FROM WeighBridgeEntries
             WHERE (isDeleted IS NULL OR isDeleted = 0)
               AND UPPER(routeName) = UPPER(?)
             ORDER BY COALESCE(initialWeightAt, createdAt) DESC, id DESC LIMIT 1`,
            [input]
        ).catch(() => []);
    }

    const gate = gateResult[0] || null;
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
            // Check legacy individual seal columns
            const legacy = [gate.sealNumber1, gate.sealNumber2, gate.sealNumber3, gate.sealNumber4]
                .filter((s) => s && String(s).trim() !== "");
            if (legacy.length > 0) seals = legacy;
        }
        gate.sealNumbers = Array.isArray(seals) ? seals : [];
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
    await migrateAdulterationColumns(pool);
    await migrateAdulterationValueColumns(pool);
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
