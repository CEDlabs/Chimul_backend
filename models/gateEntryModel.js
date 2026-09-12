const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");
const { ensureSearchIndexes, syncGateSeals, markGateSealsDeleted, freeText, normalizePlate } = require("../utils/searchIndexes");

const parseCustomDate = (dateStr) => {
    if (!dateStr) return null;
    if (typeof dateStr !== "string") {
        const parsed = new Date(dateStr);
        return isNaN(parsed.getTime()) ? null : parsed;
    }
    
    const match = dateStr.trim().match(/^(\d{2})-(\d{2})-(\d{4})\s+(\d{1,2}):(\d{2}):(\d{2})\s*(AM|PM)?$/i);
    if (match) {
        let [ , d, m, y, h, min, s, ampm ] = match;
        h = parseInt(h, 10);
        if (ampm) {
            if (ampm.toUpperCase() === 'PM' && h < 12) h += 12;
            if (ampm.toUpperCase() === 'AM' && h === 12) h = 0;
        }
        const isoStr = `${y}-${m}-${d}T${String(h).padStart(2, '0')}:${min}:${s}`;
        const parsed = new Date(isoStr);
        if (!isNaN(parsed.getTime())) return parsed;
    }
    
    const parsed = new Date(dateStr);
    return isNaN(parsed.getTime()) ? null : parsed;
};

const nextDay = (isoDate) => {
    const d = new Date(`${isoDate}T00:00:00Z`);
    d.setUTCDate(d.getUTCDate() + 1);
    return d.toISOString().slice(0, 10);
};

/* Index-friendly date filter for GateEntries:
   - createdAt is DATETIME  -> range scan on idx_ge_created
   - entryDateTime is TEXT  -> generated entryDt DATE column (idx_ge_entrydt) */
const dateRangeClause = (alias) => {
    const p = alias ? `${alias}.` : "";
    return `((${p}createdAt >= ? AND ${p}createdAt < ?) OR (${p}entryDt IS NOT NULL AND ${p}entryDt >= ? AND ${p}entryDt <= ?))`;
};

const sameDayClause = () =>
    `(createdAt >= ? AND createdAt < ? OR (entryDt IS NOT NULL AND entryDt = ?))`;

const ensureRouteColumn = async (pool) => {
    try {
        const cols = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'routeName'"
        );
        if (cols.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD routeName VARCHAR(50) NULL");
        }
    } catch (e) {
        console.warn("[GateEntries] routeName column migration warning:", e.message);
    }
};

const ensureSoftDeleteColumns = async (pool) => {
    try {
        const cols = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'isDeleted'"
        );
        if (cols.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD isDeleted TINYINT(1) DEFAULT 0");
            await pool.execute("ALTER TABLE GateEntries ADD deletedAt DATETIME NULL");
            await pool.execute("ALTER TABLE GateEntries ADD deletedBy VARCHAR(150) NULL");
            await pool.execute("ALTER TABLE GateEntries ADD deletedById VARCHAR(50) NULL");
        }
    } catch (e) {
        console.warn("[GateEntries] soft-delete columns migration warning:", e.message);
    }
};

const ensureCreatedByDetailColumns = async (pool) => {
    try {
        const cols = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'createdByEmail'"
        );
        if (cols.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD createdByEmail VARCHAR(150) NULL");
            await pool.execute("ALTER TABLE GateEntries ADD createdByDept VARCHAR(100) NULL");
        }
        const exitColByName = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'exitCheckedBy'"
        );
        if (exitColByName.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD exitCheckedBy VARCHAR(100) NULL");
        }
        const exitCols = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'exitCheckedById'"
        );
        if (exitCols.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD exitCheckedById VARCHAR(50) NULL");
            await pool.execute("ALTER TABLE GateEntries ADD exitCheckedByEmail VARCHAR(150) NULL");
        }
    } catch (e) {
        console.warn("[GateEntries] detail columns migration warning:", e.message);
    }
};

const extractUserDetails = (createdBy) => {
    let createdByInt = null;
    let createdByName = null;
    let createdByEmpId = null;
    let createdByEmail = null;
    let createdByDept = null;

    if (createdBy !== undefined && createdBy !== null) {
        if (typeof createdBy === "number") {
            createdByInt = createdBy;
        } else if (typeof createdBy === "string" && createdBy.trim() !== "") {
            createdByInt = parseInt(createdBy, 10);
        } else if (typeof createdBy === "object") {
            createdByInt = parseInt(createdBy.id || createdBy.employeeId, 10);
            createdByName = createdBy.employeeName || createdBy.name || null;
            createdByEmpId = createdBy.employeeId || null;
            createdByEmail = createdBy.email || null;
            createdByDept = createdBy.department || null;
        }
    }
    if (isNaN(createdByInt)) createdByInt = null;

    return { createdByInt, createdByName, createdByEmpId, createdByEmail, createdByDept };
};


exports.create = async (data) => {

    const pool = await connectDB();
    await ensureRouteColumn(pool);
    await ensureCreatedByDetailColumns(pool);
    await ensureSearchIndexes(pool);

    const tyreVal = parseInt(data.tyre, 10) || 0;
    const jackVal = parseInt(data.jack, 10) || 0;

    let sealNumbersJson = "[]";
    if (Array.isArray(data.sealNumbers)) {
        sealNumbersJson = JSON.stringify(data.sealNumbers);
    } else if (typeof data.sealNumbers === "string") {
        sealNumbersJson = data.sealNumbers;
    }

    let entryDate = new Date();
    if (data.entryDateTime) {
        const parsed = parseCustomDate(data.entryDateTime);
        if (parsed) entryDate = parsed;
    }
    console.log("data", data);
    console.log(data.entryDateTime, typeof data.entryDateTime, entryDate, typeof entryDate)

    const { createdByInt, createdByName, createdByEmpId, createdByEmail, createdByDept } =
        extractUserDetails(data.createdBy);

    await pool.execute(
        `INSERT INTO GateEntries
         (gateEntryId, entryDateTime, vehicleStatus, vehicleNumber, vehicleType,
          driverName, driverMobile, supplierName, materialType, routeName,
          sealNumbers, sealStatus, spinnerSet, tyre, jack, otherItems,
          createdBy, createdByName, createdByEmpId, createdByEmail, createdByDept)
         VALUES (?, ?, 'Gate Entered', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            data.gateEntryId,
            entryDate,
            data.vehicleNumber,
            data.vehicleType,
            data.driverName,
            data.driverMobile || "",
            data.supplierName || "",
            data.materialType || "",
            data.routeName || "",
            sealNumbersJson,
            data.sealStatus || "Intact",
            data.spinnerSet || "",
            tyreVal,
            jackVal,
            data.otherItems || "",
            createdByInt,
            createdByName,
            createdByEmpId,
            createdByEmail,
            createdByDept,
        ]
    );

    let parsedSeals = [];
    if (Array.isArray(data.sealNumbers)) parsedSeals = data.sealNumbers;
    else if (typeof data.sealNumbers === "string") {
        try { parsedSeals = JSON.parse(data.sealNumbers); } catch { parsedSeals = []; }
    }
    await syncGateSeals(pool, {
        gateEntryId: data.gateEntryId,
        vehicleNumber: data.vehicleNumber,
        sealNumbers: parsedSeals,
        entryDateTime: entryDate,
    });

    return data;
};


exports.getAll = async ({ startDate, endDate, search } = {}) => {

    const pool = await connectDB();
    await ensureRouteColumn(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureCreatedByDetailColumns(pool);
    await ensureSearchIndexes(pool);

    let query = `
        SELECT
            ge.id, ge.gateEntryId, ge.entryDateTime, ge.vehicleStatus,
            ge.exitDateTime, ge.exitStatus, ge.vehicleNumber, ge.vehicleType,
            ge.driverName, ge.driverMobile, ge.supplierName, ge.materialType,
            ge.routeName, ge.sealNumbers, ge.sealStatus, ge.spinnerSet,
            ge.tyre, ge.jack, ge.otherItems, ge.createdBy, ge.createdByName,
            ge.createdByEmpId, ge.createdByEmail, ge.createdByDept,
            ge.createdAt, ge.updatedAt
        FROM GateEntries ge
        WHERE 1 = 1 AND (ge.isDeleted IS NULL OR ge.isDeleted = 0)
    `;
    const params = [];
    let ft = null;

    if (startDate && endDate) {
        query += ` AND ${dateRangeClause("ge")}`;
        params.push(`${startDate}T00:00:00`, `${nextDay(endDate)}T00:00:00`, startDate, endDate);
    }

    if (search && search.trim()) {
        ft = freeText("GateEntries", search);
        query += ` AND ${ft.fragment}`;
        params.push(...ft.params);
    }

    query += ` ORDER BY ge.createdAt DESC, ge.id DESC`;

    const rows = await pool.execute(query, params).catch(async (e) => {
        if (ft && ft.kind === "match" && e && /MATCH|FULLTEXT/i.test(e && e.message ? e.message : "")) {
            const like = freeText("GateEntries", search || "", true);
            query = query.replace(ft.fragment, like.fragment);
            params = params.slice(0, params.length - ft.params.length).concat(like.params);
            return pool.execute(query, params);
        }
        throw e;
    });
    return rows;
};


exports.getStats = async ({ startDate, endDate } = {}) => {

    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    let query = `
        SELECT
            SUM(CASE WHEN exitDateTime IS NULL AND (exitStatus IS NULL OR exitStatus != 'Gate Exited') THEN 1 ELSE 0 END) AS insidePlant,
            COUNT(*) AS todayEntries,
            SUM(CASE WHEN exitDateTime IS NOT NULL OR exitStatus = 'Gate Exited' THEN 1 ELSE 0 END) AS todayExits,
            SUM(CASE WHEN vehicleStatus = 'Waiting' THEN 1 ELSE 0 END) AS waiting,
            COUNT(*) AS totalRecords
        FROM GateEntries
        WHERE 1 = 1 AND (isDeleted IS NULL OR isDeleted = 0)
    `;
    const params = [];

    if (startDate && endDate) {
        query += ` AND ${dateRangeClause("")}`;
        params.push(`${startDate}T00:00:00`, `${nextDay(endDate)}T00:00:00`, startDate, endDate);
    }

    const rows = await pool.execute(query, params);
    const row = rows[0] || {};

    return {
        insidePlant: Number(row.insidePlant) || 0,
        todayEntries: Number(row.todayEntries) || 0,
        todayExits: Number(row.todayExits) || 0,
        waiting: Number(row.waiting) || 0,
        totalRecords: Number(row.totalRecords) || 0
    };
};


exports.getRecent = async ({ startDate, endDate, limit = 5 } = {}) => {

    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    let limitVal = parseInt(limit, 10);
    if (isNaN(limitVal) || limitVal <= 0) limitVal = 5;
    if (limitVal > 100) limitVal = 100;

    let query = `
        SELECT
            id, gateEntryId, vehicleNumber, driverName, entryDateTime,
            vehicleStatus, exitDateTime, exitStatus, createdBy, createdByName,
            createdByEmpId, createdAt, updatedAt
        FROM GateEntries
        WHERE 1 = 1 AND (isDeleted IS NULL OR isDeleted = 0)
    `;
    const params = [];

    if (startDate && endDate) {
        query += ` AND ${dateRangeClause("")}`;
        params.push(`${startDate}T00:00:00`, `${nextDay(endDate)}T00:00:00`, startDate, endDate);
    }

    query += ` ORDER BY createdAt DESC, id DESC LIMIT ${limitVal}`;

    const rows = await pool.execute(query, params);
    return rows;
};


exports.checkDuplicates = async ({ vehicleNumber, routeName, sealNumbers, date }) => {
    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);
    await ensureCreatedByDetailColumns(pool);
    await ensureSearchIndexes(pool);

    const result = {
        duplicateVehicle: null,
        duplicateRouteVehicle: null,
        duplicateSeals: [],
        invalidSeals: []
    };

    const targetDate = date || new Date().toISOString().slice(0, 10);
    const startOfDay = `${targetDate} 00:00:00`;
    const endOfDay = `${targetDate} 23:59:59`;

    // 1. Check duplicate vehicle (same vehicle number active today)
    if (vehicleNumber && vehicleNumber.trim()) {
        const vRows = await pool.execute(
            `SELECT gateEntryId, vehicleNumber, vehicleType, driverName, routeName, entryDateTime, vehicleStatus, exitStatus
             FROM GateEntries
             WHERE (UPPER(vehicleNumber) = UPPER(?) OR vehKey = ?)
               AND (isDeleted IS NULL OR isDeleted = 0)
               AND ${sameDayClause()}
             ORDER BY createdAt DESC LIMIT 1`,
            [vehicleNumber.trim(), normalizePlate(vehicleNumber), `${targetDate}T00:00:00`, `${nextDay(targetDate)}T00:00:00`, targetDate]
        );
        if (vRows.length > 0) {
            result.duplicateVehicle = vRows[0];
        }
    }

    // 2. Check duplicate route (any vehicle already exists for this route today)
    if (routeName && routeName.trim()) {
        const rvRows = await pool.execute(
            `SELECT gateEntryId, vehicleNumber, vehicleType, driverName, routeName, entryDateTime
             FROM GateEntries
             WHERE routeName = ?
               AND (isDeleted IS NULL OR isDeleted = 0)
               AND ${sameDayClause()}
             ORDER BY createdAt DESC LIMIT 1`,
            [routeName.trim(), `${targetDate}T00:00:00`, `${nextDay(targetDate)}T00:00:00`, targetDate]
        );
        if (rvRows.length > 0) {
            result.duplicateRouteVehicle = rvRows[0];
        }
    }

    // 3. Check duplicate seal numbers - across ALL dates. Uses the indexed
    //    GateSeals lookup table for exact, fast matching. A seal is never
    //    reused; the day it was used on is shown as the usage detail.
    if (Array.isArray(sealNumbers) && sealNumbers.length > 0) {
        const filteredSeals = sealNumbers.filter(s => s && s.trim());
        for (const seal of filteredSeals) {
            const sRows = await pool.execute(
                `SELECT gs.sealNumber, gs.gateEntryId, gs.vehicleNumber, gs.entryDateTime,
                        ge.driverName, ge.createdByName, ge.createdByEmpId, ge.createdAt
                 FROM GateSeals gs
                 LEFT JOIN GateEntries ge ON ge.gateEntryId = gs.gateEntryId
                 WHERE gs.sealNumber = ?
                   AND (gs.isDeleted IS NULL OR gs.isDeleted = 0)
                   AND (ge.isDeleted IS NULL OR ge.isDeleted = 0)
                 ORDER BY ge.createdAt DESC, gs.id DESC
                 LIMIT 1`,
                [seal.trim()]
            ).catch(() => []);
            if (sRows && sRows.length > 0) {
                const existing = sRows[0];
                const usedDate = existing.entryDateTime
                    ? existing.entryDateTime
                    : (existing.createdAt || "").toString().slice(0, 10);
                result.duplicateSeals.push({
                    sealNumber: seal.trim(),
                    gateEntryId: existing.gateEntryId,
                    vehicleNumber: existing.vehicleNumber,
                    driverName: existing.driverName,
                    allocatedBy: existing.createdByName || "Unknown",
                    allocatedByEmpId: existing.createdByEmpId || "",
                    entryDateTime: existing.entryDateTime,
                    usedDate,
                });
            }
        }
    }

    // 4. 6-digit seal-number format validation
    if (Array.isArray(sealNumbers) && sealNumbers.length > 0) {
        for (const s of sealNumbers) {
            const str = String(s).trim();
            if (str && !/^\d{6}$/.test(str)) {
                result.invalidSeals.push(str);
            }
        }
    }

    return result;
};

exports.findTodayByVehicle = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    const { normalizePlate } = require("../utils/searchIndexes");
    const key = normalizePlate(vehicleNumber);
    const today = new Date().toISOString().slice(0, 10);
    try {
        const rows = await pool.execute(
            `SELECT gateEntryId, vehicleNumber, driverName, routeName, entryDateTime, vehicleStatus, exitStatus, exitDateTime
             FROM GateEntries
             WHERE (UPPER(vehicleNumber) = UPPER(?) OR vehKey = ?)
               AND (isDeleted IS NULL OR isDeleted = 0)
               AND ${sameDayClause()}
             ORDER BY createdAt DESC LIMIT 1`,
            [vehicleNumber.trim(), key, `${today}T00:00:00`, `${nextDay(today)}T00:00:00`, today]
        );
        if (rows.length > 0) return rows[0];
    } catch (e) {
        console.warn("[GateEntry] findTodayByVehicle today-query failed:", e.message);
    }

    // Fallback: get latest gate entry for this vehicle (any date)
    try {
        const latest = await pool.execute(
            `SELECT gateEntryId, vehicleNumber, driverName, routeName, entryDateTime, vehicleStatus, exitStatus, exitDateTime
             FROM GateEntries
             WHERE (UPPER(vehicleNumber) = UPPER(?) OR vehKey = ?)
               AND (isDeleted IS NULL OR isDeleted = 0)
             ORDER BY createdAt DESC LIMIT 1`,
            [vehicleNumber.trim(), key]
        );
        if (latest.length > 0) return latest[0];
    } catch (e2) {
        console.warn("[GateEntry] findTodayByVehicle fallback-query failed:", e2.message);
        // Last resort: query without isDeleted filter
        try {
            const lastResort = await pool.execute(
                `SELECT gateEntryId, vehicleNumber, driverName, routeName, entryDateTime, vehicleStatus, exitStatus, exitDateTime
                 FROM GateEntries
                 WHERE UPPER(vehicleNumber) = UPPER(?)
                 ORDER BY createdAt DESC LIMIT 1`,
                [vehicleNumber.trim()]
            );
            if (lastResort.length > 0) return lastResort[0];
        } catch { /* give up */ }
    }
    return null;
};

exports.delete = async (id, user = null, ipAddress = null) => {

    const pool = await connectDB();
    await ensureSoftDeleteColumns(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM GateEntries WHERE (gateEntryId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Gate entry not found or already deleted.");
    }

    const record = lookupResult[0];

    await AuditLog.create({
        module: "GateEntry",
        action: "DELETE",
        recordId: record.gateEntryId,
        recordData: {
            id: record.id,
            gateEntryId: record.gateEntryId,
            entryDateTime: record.entryDateTime,
            vehicleStatus: record.vehicleStatus,
            vehicleNumber: record.vehicleNumber,
            vehicleType: record.vehicleType,
            driverName: record.driverName,
            driverMobile: record.driverMobile,
            supplierName: record.supplierName,
            materialType: record.materialType,
            routeName: record.routeName,
            sealNumbers: record.sealNumbers,
            sealStatus: record.sealStatus,
            spinnerSet: record.spinnerSet,
            tyre: record.tyre,
            jack: record.jack,
            otherItems: record.otherItems,
            createdBy: record.createdBy,
            createdByName: record.createdByName,
            createdByEmpId: record.createdByEmpId,
            exitDateTime: record.exitDateTime,
            exitStatus: record.exitStatus,
            createdAt: record.createdAt
        },
        user: user,
        ipAddress: ipAddress
    });

    const now = new Date();
    await pool.execute(
        "UPDATE GateEntries SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ?, updatedAt = ? WHERE gateEntryId = ?",
        [
            now,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            now,
            record.gateEntryId
        ]
    );
    await markGateSealsDeleted(pool, record.gateEntryId);

    return true;
};

exports.update = async (id, data) => {
    const pool = await connectDB();
    await ensureRouteColumn(pool);
    await ensureCreatedByDetailColumns(pool);
    await ensureSearchIndexes(pool);

    const lookupResult = await pool.execute(
        "SELECT * FROM GateEntries WHERE (gateEntryId = ? OR CAST(id AS CHAR) = ?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [String(id), String(id)]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error("Gate entry not found or already deleted.");
    }

    const existing = lookupResult[0];

    let sealNumbersJson = existing.sealNumbers;
    if (Array.isArray(data.sealNumbers)) {
        sealNumbersJson = JSON.stringify(data.sealNumbers);
    } else if (typeof data.sealNumbers === "string") {
        sealNumbersJson = data.sealNumbers;
    }

    const tyreVal = data.tyre !== undefined ? parseInt(data.tyre, 10) || 0 : existing.tyre;
    const jackVal = data.jack !== undefined ? parseInt(data.jack, 10) || 0 : existing.jack;

    let entryDate = existing.entryDateTime;
    if (data.entryDateTime) {
        const parsed = parseCustomDate(data.entryDateTime);
        if (parsed) entryDate = parsed;
    }

    const now = new Date();
    await pool.execute(
        `UPDATE GateEntries SET
            vehicleStatus = ?, vehicleNumber = ?, vehicleType = ?,
            driverName = ?, driverMobile = ?, supplierName = ?, materialType = ?,
            routeName = ?, sealNumbers = ?, sealStatus = ?,
            spinnerSet = ?, tyre = ?, jack = ?, otherItems = ?,
            entryDateTime = ?, updatedAt = ?
         WHERE gateEntryId = ?`,
        [
            data.vehicleStatus || existing.vehicleStatus,
            (data.vehicleNumber || existing.vehicleNumber || "").toUpperCase().trim(),
            data.vehicleType || existing.vehicleType,
            data.driverName || existing.driverName,
            data.driverMobile !== undefined ? data.driverMobile : existing.driverMobile,
            data.supplierName !== undefined ? data.supplierName : existing.supplierName,
            data.materialType !== undefined ? data.materialType : existing.materialType,
            data.routeName !== undefined ? data.routeName : existing.routeName,
            sealNumbersJson,
            data.sealStatus || existing.sealStatus || "Intact",
            data.spinnerSet !== undefined ? data.spinnerSet : existing.spinnerSet,
            tyreVal,
            jackVal,
            data.otherItems !== undefined ? data.otherItems : existing.otherItems,
            entryDate,
            now,
            existing.gateEntryId
        ]
    );

    let parsedSeals = [];
    if (Array.isArray(data.sealNumbers)) parsedSeals = data.sealNumbers;
    else if (typeof data.sealNumbers === "string") {
        try { parsedSeals = JSON.parse(data.sealNumbers); } catch { parsedSeals = []; }
    }
    await syncGateSeals(pool, {
        gateEntryId: existing.gateEntryId,
        vehicleNumber: data.vehicleNumber || existing.vehicleNumber,
        sealNumbers: parsedSeals,
        entryDateTime: entryDate,
    });

    return { ...existing, ...data, gateEntryId: existing.gateEntryId, updatedAt: now };
};
