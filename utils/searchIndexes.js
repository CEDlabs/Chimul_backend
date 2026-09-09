const { DB_TYPE } = require("../config/db");

/* =====================================================================
   SEARCH INDEX UTILITY
   ---------------------------------------------------------------------
   Makes searches on 1,000–10,000+ records fast by guaranteeing that the
   exact search patterns used by the models are covered by database
   indexes:

   1) Normalized plate key  (vehKey)   – UPPER, spaces/hyphens stripped.
      Generated (computed) column + index on every table searched by
      vehicle number. Searches compare vehKey = ? instead of wrapping
      the column in UPPER()/REPLACE() which prevents index usage.
   2) Normalized route key  (routeKey) – UPPER + TRIM. Same idea for the
      route/routeNo lookups used across departments.
   3) Composite B-tree indexes matching the real WHERE + ORDER BY clauses.
   4) VehicleSeals / GateSeals lookup tables – seal numbers are stored as
      JSON arrays in the main tables, which forces slow scans. These two
      tables normalize one seal per row so seal searches and duplicate
      checks are EXACT, INDEXED and fast.

   All operations are idempotent and safe to call on every server start.
   ===================================================================== */

let initialized = false;

const isMysql = () => DB_TYPE === "mysql";

const normalizePlate = (value) => String(value || "")
    .toUpperCase()
    .replace(/[\s-]/g, "");

async function count(pool, table, column, indexName) {
    try {
        const rows = await pool.execute(
            "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.STATISTICS " +
            "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ? AND INDEX_NAME = ?",
            [table, indexName]
        );
        if (rows && rows.length) return Number(rows[0].c);
    } catch (_) { /* ignore */ }
    return -1;
}

async function columnExists(pool, table, column) {
    try {
        const rows = await pool.execute(
            "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS " +
            "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ? AND COLUMN_NAME = ?",
            [table, column]
        );
        if (rows && rows.length) return Number(rows[0].c) > 0;
    } catch (_) { /* ignore */ }
    return false;
}

async function tableExists(pool, table) {
    try {
        const rows = await pool.execute(
            "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.TABLES " +
            "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ?",
            [table]
        );
        if (rows && rows.length) return Number(rows[0].c) > 0;
    } catch (_) { /* ignore */ }
    return false;
}

// Index definition table: [ indexName, table, columns, unique? ]
const INDEXES = [
    /* VehicleCatalog */
    ["idx_catalog_route", "VehicleCatalog", "routeName"],

    /* RouteAlternativeVehicles */
    ["idx_alt_primary_dates", "RouteAlternativeVehicles", "primaryVehicleNumber, fromDate, toDate"],
    ["idx_alt_alt_dates", "RouteAlternativeVehicles", "alternativeVehicleNumber, fromDate, toDate"],
    ["idx_alt_fromdate", "RouteAlternativeVehicles", "fromDate"],
    ["idx_alt_todate", "RouteAlternativeVehicles", "toDate"],

    /* Vehicles */
    ["idx_veh_route_alloc", "Vehicles", "routeName, allocationDate"],
    ["idx_veh_alloc", "Vehicles", "allocationDate"],

    /* GateEntries */
    ["idx_ge_vehicle_created", "GateEntries", "vehicleNumber, createdAt"],
    ["idx_ge_route_created", "GateEntries", "routeName, createdAt"],
    ["idx_ge_created", "GateEntries", "createdAt, id"],
    ["idx_ge_gateentryid", "GateEntries", "gateEntryId"],
    ["idx_ge_sealstatus", "GateEntries", "sealStatus"],
    ["idx_ge_vehstatus", "GateEntries", "vehicleStatus"],

    /* WeighBridgeEntries */
    ["idx_wb_vehicle_status", "WeighBridgeEntries", "vehicleNumber, status, createdAt"],
    ["idx_wb_route_created", "WeighBridgeEntries", "routeName, createdAt"],
    ["idx_wb_created", "WeighBridgeEntries", "createdAt, id"],
    ["idx_wb_status", "WeighBridgeEntries", "status"],

    /* SampleCollections */
    ["idx_sc_vehicle_collected", "SampleCollections", "vehicleNumber, collectedAt"],
    ["idx_sc_route_collected", "SampleCollections", "routeNo, collectedAt"],
    ["idx_sc_collected", "SampleCollections", "collectedAt, id"],
    ["idx_sc_gateid", "SampleCollections", "gateEntryId"],
    ["idx_sc_wbid", "SampleCollections", "wbEntryId"],

    /* MilkCollections */
    ["idx_mc_vehicle_date", "MilkCollections", "vehicleNumber, reportDate"],
    ["idx_mc_route_date", "MilkCollections", "routeNo, reportDate"],
    ["idx_mc_member_code", "MilkCollections", "memberCode, reportDate"],

    /* LaboratoryTests */
    ["idx_lt_vehicle_tested", "LaboratoryTests", "vehicleNumber, testedAt"],
    ["idx_lt_route_tested", "LaboratoryTests", "routeNo, testedAt"],
    ["idx_lt_gateid", "LaboratoryTests", "gateEntryId"],
    ["idx_lt_wbid", "LaboratoryTests", "wbEntryId"],

    /* VehicleExits (join + exit listing) */
    ["idx_ve_gateid", "VehicleExits", "gateEntryId"],
    ["idx_ve_vehicle", "VehicleExits", "vehicleNumber"],
    ["idx_ve_exit", "VehicleExits", "exitDateTime, id"],
];

// FULLTEXT indexes for fast keyword search at 6–10 lakh rows.
// LIKE '%keyword%' scans every row; MATCH ... AGAINST uses these indexes.
const FULLTEXT_INDEXES = [
    ["idx_ge_ft", "GateEntries", "vehicleNumber, gateEntryId, driverName, supplierName, materialType"],
    ["idx_wb_ft", "WeighBridgeEntries", "vehicleNumber, wbEntryId, driverName, supplierCode, productGroup, routeName"],
    ["idx_veh_ft", "Vehicles", "vehicleNumber, driverName, supplierCode, productName, routeName"],
    ["idx_sc_ft", "SampleCollections", "vehicleNumber, sampleId, sampleCollectedBy, materialType, routeNo"],
    ["idx_mc_ft", "MilkCollections", "vehicleNumber, reportId, memberCode, memberName, routeNo"],
    ["idx_lt_ft", "LaboratoryTests", "vehicleNumber, labTestId, routeNo, testedByName, materialType"],
];

// Which FULLTEXT index serves a table, plus extra exact-match columns to use
// alongside MATCH (e.g. status filters that are cheaper as equalities).
const FT_COLUMNS = {
    GateEntries: { alias: "ge", cols: ["vehicleNumber", "gateEntryId", "driverName", "supplierName", "materialType"], extras: ["vehicleStatus", "exitStatus"] },
    WeighBridgeEntries: { alias: "wb", cols: ["vehicleNumber", "wbEntryId", "driverName", "supplierCode", "productGroup", "routeName"], extras: [] },
    Vehicles: { alias: "v", cols: ["vehicleNumber", "driverName", "supplierCode", "productName", "routeName"], extras: [] },
    SampleCollections: { alias: "s", cols: ["vehicleNumber", "sampleId", "sampleCollectedBy", "materialType", "routeNo"], extras: [] },
    MilkCollections: { alias: "m", cols: ["vehicleNumber", "reportId", "memberCode", "memberName", "routeNo"], extras: [] },
    LaboratoryTests: { alias: "l", cols: ["vehicleNumber", "labTestId", "routeNo", "testedByName", "materialType"], extras: [] },
};

function quoteIdent(name) {
    if (isMysql()) return `\`${name}\``;
    return `[${name}]`;
}

/* ---------------------------------------------------------------------
   Build a WHERE fragment for free-text search.
   - term 4+ chars  -> MATCH ... AGAINST (indexed, fast at lakh scale)
   - short term     -> LIKE (tiny scan, no false negatives)
   Returns { kind, fragment, params }. Both variants must be safe to
   use through db.execute().
   --------------------------------------------------------------------- */
function freeText(table, term, forceLike) {
    const cfg = FT_COLUMNS[table];
    const tokens = String(term || "").trim().split(/\s+/).filter(Boolean);
    if (!cfg || tokens.length === 0) return { kind: "like", fragment: "1=1", params: [] };

    /* LIKE variant (fallback) */
    const likeCols = cfg.cols.concat(cfg.extras);
    const likeFrag = likeCols.map((c) => `${cfg.alias}.${c} LIKE ?`).join(" OR ");
    const likeParam = `%${tokens.join("")}%`;
    const like = { kind: "like", fragment: `(${likeFrag})`, params: likeCols.map(() => likeParam) };

    /* MATCH needs a FULLTEXT index on exactly the columns (extra cols are
       matched with = so they join through the regular index). Short tokens
       are ignored by MySQL FT (min token size 3) so fall back to LIKE. */
    const useMatch = !forceLike && tokens.length === 1 && tokens[0].length >= 4;
    if (!useMatch) return like;

    const matchCols = cfg.cols.map((c) => `${cfg.alias}.${c}`).join(", ");
    const matchFrag = `MATCH(${matchCols}) AGAINST (? IN BOOLEAN MODE)`;
    const extraFrags = cfg.extras.length ? cfg.extras.map((c) => `${cfg.alias}.${c} = ?`).join(" OR ") : "";
    const frag = extraFrags ? `(${matchFrag} OR ${extraFrags})` : matchFrag;
    const extraParams = cfg.extras.map(() => term.trim());
    /* Prefix wildcard: "KA0*" keeps the FT index usable for partial plates. */
    const ftParam = `${tokens[0]}*`;
    return { kind: "match", fragment: frag, params: [ftParam, ...extraParams] };
}

/* ---------------------------------------------------------------------
   Generated / computed search-key columns per table.
   routeCol = the actual route column name in that table.
   --------------------------------------------------------------------- */
const KEY_COLUMNS = [
    { table: "VehicleCatalog",          vehicleCol: "vehicleNumber", routeCol: "routeName" },
    { table: "Vehicles",                vehicleCol: "vehicleNumber", routeCol: "routeName" },
    { table: "RouteAlternativeVehicles", vehicleCol: "primaryVehicleNumber", routeCol: "routeName",
      vehicleCol2: "alternativeVehicleNumber", keyPrimary: "vehKeyPrimary", keyAlt: "vehKeyAlt" },
    { table: "GateEntries",             vehicleCol: "vehicleNumber", routeCol: "routeName" },
    { table: "WeighBridgeEntries",      vehicleCol: "vehicleNumber", routeCol: "routeName" },
    { table: "SampleCollections",       vehicleCol: "vehicleNumber", routeCol: "routeNo" },
    { table: "MilkCollections",         vehicleCol: "vehicleNumber", routeCol: "routeNo" },
    { table: "LaboratoryTests",         vehicleCol: "vehicleNumber", routeCol: "routeNo" },
    { table: "VehicleExits",            vehicleCol: "vehicleNumber" },
];

function plateExpr(col) {
    return `UPPER(REPLACE(REPLACE(${col},' ',''),'-',''))`;
}

function routeExpr(col) {
    return `UPPER(TRIM(${col}))`;
}

async function ensureGeneratedColumns(pool) {
    for (const cfg of KEY_COLUMNS) {
        if (!(await tableExists(pool, cfg.table))) continue;
        const cols = [];
        if (!cfg.keyPrimary && !cfg.keyAlt && !(await columnExists(pool, cfg.table, "vehKey"))) {
            cols.push("vehKey");
        }
        let routeKeyName = "routeKey";
        if (cfg.keyPrimary && (await columnExists(pool, cfg.table, cfg.keyPrimary)) === false) cols.push(cfg.keyPrimary);
        if (cfg.keyAlt && (await columnExists(pool, cfg.table, cfg.keyAlt)) === false) cols.push(cfg.keyAlt);
        if (cfg.routeKeyName) routeKeyName = cfg.routeKeyName;
        if (cfg.routeCol && !(await columnExists(pool, cfg.table, routeKeyName))) cols.push(routeKeyName);
        if (cols.length === 0) continue;

        const addClauses = [];
        for (const c of cols) {
            if (c === "vehKey") {
                addClauses.push(`ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (${plateExpr(cfg.vehicleCol)}) VIRTUAL`);
            } else if (c === cfg.keyPrimary) {
                addClauses.push(`ADD COLUMN ${cfg.keyPrimary} VARCHAR(60) GENERATED ALWAYS AS (${plateExpr(cfg.vehicleCol)}) VIRTUAL`);
            } else if (c === cfg.keyAlt) {
                addClauses.push(`ADD COLUMN ${cfg.keyAlt} VARCHAR(60) GENERATED ALWAYS AS (${plateExpr(cfg.vehicleCol2)}) VIRTUAL`);
            } else {
                addClauses.push(`ADD COLUMN ${c} VARCHAR(100) GENERATED ALWAYS AS (${routeExpr(cfg.routeCol)}) VIRTUAL`);
            }
        }
        try {
            await pool.execute(`ALTER TABLE ${cfg.table} ${addClauses.join(", ")}`);
        } catch (e) {
            console.warn(`[SearchIndexes] add key columns to ${cfg.table}:`, e.message);
        }
    }

    /* Create indexes on the key columns (separate ALTERs are safe in one pass). */
    const idxGrants = [
        ["idx_vehkey", "vehKey"],
        ["idx_routekey", "routeKey"],
        ["idx_vehkey_primary", "vehKeyPrimary"],
        ["idx_vehkey_alt", "vehKeyAlt"],
    ];
    for (const cfg of KEY_COLUMNS) {
        for (const [idxName, colName] of idxGrants) {
            if (!cfg.keyPrimary && colName === "vehKeyPrimary") continue;
            if (!cfg.keyAlt && colName === "vehKeyAlt") continue;
            if (colName === "vehKey" && cfg.keyPrimary) continue; // RouteAlt uses Primary/Alt keys only
            if (colName === "routeKey" && cfg.routeKeyName) continue;
            if ((await columnExists(pool, cfg.table, colName)) === false) continue;
            if ((await count(pool, cfg.table, colName, idxName)) > 0) continue;
            try {
                await pool.execute(`ALTER TABLE ${cfg.table} ADD KEY ${idxName} (${colName})`);
            } catch (e) {
                console.warn(`[SearchIndexes] add ${idxName} on ${cfg.table}:`, e.message);
            }
        }
    }
}

async function ensureBtreeIndexes(pool) {
    for (const [name, table, columns] of INDEXES) {
        if (!(await tableExists(pool, table))) continue;
        if ((await count(pool, table, columns, name)) > 0) continue;
        try {
            await pool.execute(`ALTER TABLE ${table} ADD KEY ${name} (${columns})`);
        } catch (e) {
            console.warn(`[SearchIndexes] add ${name} on ${table}:`, e.message);
        }
    }
}

/* ---------------------------------------------------------------------
   FULLTEXT indexes – replace LIKE '%x%' scans for keyword search on
   lakh-scale tables. MySQL InnoDB only. Idempotent.
   --------------------------------------------------------------------- */
async function ensureFulltextIndexes(pool) {
    if (!isMysql()) {
        console.warn("[SearchIndexes] FULLTEXT skip: MySQL only. Keyword search keeps LIKE fallback.");
        return;
    }
    for (const [name, table, columns] of FULLTEXT_INDEXES) {
        if (!(await tableExists(pool, table))) continue;
        if ((await count(pool, table, columns, name)) > 0) continue;
        try {
            await pool.execute(`ALTER TABLE ${table} ADD FULLTEXT ${name} (${columns})`);
        } catch (e) {
            console.warn(`[SearchIndexes] add FULLTEXT ${name} on ${table}:`, e.message);
        }
    }
}

/* ---------------------------------------------------------------------
   GateEntries stores entryDateTime as DATETIME. Add a generated DATE
   column + index so date filters are range scans (not full-table scans).
   --------------------------------------------------------------------- */
async function ensureEntryDateColumn(pool) {
    if (!(await tableExists(pool, "GateEntries"))) return;
    if (!(await columnExists(pool, "GateEntries", "entryDt"))) {
        try {
            if (isMysql()) {
                await pool.execute(
                    `ALTER TABLE ${quoteIdent("GateEntries")} ` +
                    `ADD COLUMN ${quoteIdent("entryDt")} DATE GENERATED ALWAYS AS ` +
                    `(DATE(${quoteIdent("entryDateTime")})) VIRTUAL`
                );
            } else {
                await pool.execute(`ALTER TABLE [GateEntries] ADD entryDt AS (TRY_CONVERT(DATE, entryDateTime))`);
            }
        } catch (e) {
            /* non-parsetable text (old/dirty data) – plain column, still indexed */
            console.warn("[SearchIndexes] add entryDt (generated):", e.message);
            try {
                if (isMysql()) {
                    await pool.execute("ALTER TABLE GateEntries ADD COLUMN entryDt DATE NULL");
                } else {
                    await pool.execute("ALTER TABLE GateEntries ADD entryDt DATE NULL");
                }
            } catch (_) { /* ignore */ }
        }
    }
    if ((await count(pool, "GateEntries", "entryDt", "idx_ge_entrydt")) <= 0) {
        try {
            if (isMysql()) await pool.execute("ALTER TABLE GateEntries ADD KEY idx_ge_entrydt (entryDt)");
            else await pool.execute("CREATE NONCLUSTERED INDEX idx_ge_entrydt ON GateEntries (entryDt)");
        } catch (e) {
            console.warn("[SearchIndexes] add idx_ge_entrydt:", e.message);
        }
    }
}

async function ensureSealTables(pool) {
    if (await tableExists(pool, "VehicleSeals")) {
        if ((await count(pool, "VehicleSeals", "sealNumber", "idx_vehseal_number")) <= 0) {
            try {
                if (isMysql()) {
                    await pool.execute("ALTER TABLE VehicleSeals ADD KEY idx_vehseal_number (sealNumber)");
                    await pool.execute("ALTER TABLE VehicleSeals ADD KEY idx_vehseal_vehicle_status (vehicleNumber, sealStatus, allocationDate)");
                    await pool.execute("ALTER TABLE VehicleSeals ADD KEY idx_vehseal_vehicle_id (vehicleId)");
                } else {
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_number ON VehicleSeals (sealNumber)");
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_vehicle_status ON VehicleSeals (vehicleNumber, sealStatus, allocationDate)");
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_vehicle_id ON VehicleSeals (vehicleId)");
                }
            } catch (e) { console.warn("[SearchIndexes] VehicleSeals indexes:", e.message); }
        }
    } else {
        try {
            if (isMysql()) {
                await pool.execute(`
                    CREATE TABLE IF NOT EXISTS VehicleSeals (
                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        vehicleId INT NOT NULL,
                        vehicleNumber VARCHAR(20) NOT NULL,
                        sealNumber VARCHAR(30) NOT NULL,
                        sealStatus VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
                        allocationDate DATE NULL,
                        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
                        KEY idx_vehseal_number (sealNumber),
                        KEY idx_vehseal_vehicle_status (vehicleNumber, sealStatus, allocationDate),
                        KEY idx_vehseal_vehicle_id (vehicleId)
                    )
                `);
            } else {
                await pool.execute(`
                    CREATE TABLE VehicleSeals (
                        id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        vehicleId INT NOT NULL,
                        vehicleNumber VARCHAR(20) NOT NULL,
                        sealNumber VARCHAR(30) NOT NULL,
                        sealStatus VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
                        allocationDate DATE NULL,
                        createdAt DATETIME2 DEFAULT GETDATE()
                    )
                `);
                await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_number ON VehicleSeals (sealNumber)");
                await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_vehicle_status ON VehicleSeals (vehicleNumber, sealStatus, allocationDate)");
                await pool.execute("CREATE NONCLUSTERED INDEX idx_vehseal_vehicle_id ON VehicleSeals (vehicleId)");
            }
        } catch (e) { console.warn("[SearchIndexes] create VehicleSeals:", e.message); }
    }

    if (await tableExists(pool, "GateSeals")) {
        if ((await count(pool, "GateSeals", "sealNumber", "idx_gateseal_number")) <= 0) {
            try {
                if (isMysql()) {
                    await pool.execute("ALTER TABLE GateSeals ADD KEY idx_gateseal_number (sealNumber)");
                    await pool.execute("ALTER TABLE GateSeals ADD KEY idx_gateseal_ge (gateEntryId)");
                    await pool.execute("ALTER TABLE GateSeals ADD KEY idx_gateseal_veh (vehicleNumber, gateEntryId)");
                } else {
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_number ON GateSeals (sealNumber)");
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_ge ON GateSeals (gateEntryId)");
                    await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_veh ON GateSeals (vehicleNumber, gateEntryId)");
                }
            } catch (e) { console.warn("[SearchIndexes] GateSeals indexes:", e.message); }
        }
    } else {
        try {
            if (isMysql()) {
                await pool.execute(`
                    CREATE TABLE IF NOT EXISTS GateSeals (
                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        gateEntryId VARCHAR(50) NOT NULL,
                        vehicleNumber VARCHAR(20) NOT NULL,
                        sealNumber VARCHAR(30) NOT NULL,
                        entryDateTime DATETIME NULL,
                        isDeleted TINYINT(1) NOT NULL DEFAULT 0,
                        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
                        KEY idx_gateseal_number (sealNumber),
                        KEY idx_gateseal_ge (gateEntryId),
                        KEY idx_gateseal_veh (vehicleNumber, gateEntryId)
                    )
                `);
            } else {
                await pool.execute(`
                    CREATE TABLE GateSeals (
                        id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        gateEntryId VARCHAR(50) NOT NULL,
                        vehicleNumber VARCHAR(20) NOT NULL,
                        sealNumber VARCHAR(30) NOT NULL,
                        entryDateTime DATETIME2 NULL,
                        isDeleted TINYINT NOT NULL DEFAULT 0,
                        createdAt DATETIME2 DEFAULT GETDATE()
                    )
                `);
                await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_number ON GateSeals (sealNumber)");
                await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_ge ON GateSeals (gateEntryId)");
                await pool.execute("CREATE NONCLUSTERED INDEX idx_gateseal_veh ON GateSeals (vehicleNumber, gateEntryId)");
            }
        } catch (e) { console.warn("[SearchIndexes] create GateSeals:", e.message); }
    }
}

/* ---------------------------------------------------------------------
   One-time backfill of seal lookup tables from the JSON columns.
   Runs only when the lookup tables are empty, so it is safe to re-run.
   --------------------------------------------------------------------- */
async function backfillSealLookups(pool) {
    if (!isMysql()) {
        console.warn("[SearchIndexes] backfill skip: only supported on MySQL.");
        return;
    }
    try {
        const vc = await pool.execute("SELECT COUNT(*) AS c FROM VehicleSeals");
        if (vc.length && Number(vc[0].c) === 0) {
            await pool.execute(`
                INSERT INTO VehicleSeals (vehicleId, vehicleNumber, sealNumber, sealStatus, allocationDate)
                SELECT v.id, v.vehicleNumber, jt.seal, 'ACTIVE', v.allocationDate
                FROM Vehicles v
                JOIN JSON_TABLE(IFNULL(v.serialNumbers, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
                WHERE (v.isDeleted IS NULL OR v.isDeleted = 0)
                  AND jt.seal IS NOT NULL AND jt.seal <> ''
            `).catch(() => {});
            await pool.execute(`
                INSERT INTO VehicleSeals (vehicleId, vehicleNumber, sealNumber, sealStatus, allocationDate)
                SELECT v.id, v.vehicleNumber, jt.seal, 'RETIRED', v.allocationDate
                FROM Vehicles v
                JOIN JSON_TABLE(IFNULL(v.retiredSerials, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
                WHERE (v.isDeleted IS NULL OR v.isDeleted = 0)
                  AND jt.seal IS NOT NULL AND jt.seal <> ''
            `).catch(() => {});
            console.log("[SearchIndexes] VehicleSeals backfilled.");
        }

        const gc = await pool.execute("SELECT COUNT(*) AS c FROM GateSeals");
        if (gc.length && Number(gc[0].c) === 0) {
            await pool.execute(`
                INSERT INTO GateSeals (gateEntryId, vehicleNumber, sealNumber, entryDateTime)
                SELECT ge.gateEntryId, ge.vehicleNumber, jt.seal, ge.entryDateTime
                FROM GateEntries ge
                JOIN JSON_TABLE(IFNULL(ge.sealNumbers, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
                WHERE (ge.isDeleted IS NULL OR ge.isDeleted = 0)
                  AND jt.seal IS NOT NULL AND jt.seal <> ''
            `).catch(() => {});
            console.log("[SearchIndexes] GateSeals backfilled.");
        }
    } catch (e) {
        console.warn("[SearchIndexes] backfill error:", e.message);
    }
}

/* ---------------------------------------------------------------------
   Maintenance helpers used by the models on every write so the lookup
   tables stay in sync (exact data fetch).
   --------------------------------------------------------------------- */
async function syncVehicleSeals(db, { vehicleId, vehicleNumber, allocationDate, activeSerials, retiredSerials } = {}) {
    if (!vehicleId) return;
    const clean = (arr) =>
        (Array.isArray(arr) ? arr : [])
            .map((s) => (s ? String(s).trim() : ""))
            .filter((s) => s !== "" && s !== "null");
    try {
        await db.execute("DELETE FROM VehicleSeals WHERE vehicleId = ?", [vehicleId]);
        const rows = [
            ...clean(activeSerials).map((n) => ({ n, st: "ACTIVE" })),
            ...clean(retiredSerials).map((n) => ({ n, st: "RETIRED" })),
        ];
        const vNum = String(vehicleNumber || "").toUpperCase();
        for (const r of rows) {
            await db.execute(
                "INSERT INTO VehicleSeals (vehicleId, vehicleNumber, sealNumber, sealStatus, allocationDate) VALUES (?, ?, ?, ?, ?)",
                [vehicleId, vNum, r.n, r.st, allocationDate || null]
            );
        }
    } catch (e) {
        console.warn("[SearchIndexes] syncVehicleSeals:", e.message);
    }
}

async function syncGateSeals(db, { gateEntryId, vehicleNumber, sealNumbers, entryDateTime } = {}) {
    if (!gateEntryId) return;
    const seals = (Array.isArray(sealNumbers) ? sealNumbers : [])
        .map((s) => (s ? String(s).trim() : ""))
        .filter((s) => s !== "");
    try {
        await db.execute("DELETE FROM GateSeals WHERE gateEntryId = ?", [gateEntryId]);
        const vNum = String(vehicleNumber || "").toUpperCase();
        for (const s of seals) {
            await db.execute(
                "INSERT INTO GateSeals (gateEntryId, vehicleNumber, sealNumber, entryDateTime) VALUES (?, ?, ?, ?)",
                [gateEntryId, vNum, s, entryDateTime || null]
            );
        }
    } catch (e) {
        console.warn("[SearchIndexes] syncGateSeals:", e.message);
    }
}

async function markGateSealsDeleted(db, gateEntryId) {
    if (!gateEntryId) return;
    try {
        await db.execute("UPDATE GateSeals SET isDeleted = 1 WHERE gateEntryId = ?", [gateEntryId]);
    } catch (e) {
        console.warn("[SearchIndexes] markGateSealsDeleted:", e.message);
    }
}

/* ---------------------------------------------------------------------
   MAIN ENTRY – called once per process from any model.
   --------------------------------------------------------------------- */
async function ensureSearchIndexes(pool) {
    if (initialized) return;
    initialized = true;
    try {
        await ensureGeneratedColumns(pool);
        await ensureBtreeIndexes(pool);
        await ensureFulltextIndexes(pool);
        await ensureEntryDateColumn(pool);
        await ensureSealTables(pool);
        await backfillSealLookups(pool);
        console.log("[SearchIndexes] all indexes verified.");
    } catch (e) {
        console.warn("[SearchIndexes] ensureSearchIndexes:", e.message);
    }
}

module.exports = {
    ensureSearchIndexes,
    normalizePlate,
    freeText,
    syncVehicleSeals,
    syncGateSeals,
    markGateSealsDeleted,
};