const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");
const Vehicle = require("./vehicleModel");
const AlternativeVehicle = require("./alternativeVehicleModel");
const VehicleCatalog = require("./vehicleCatalogModel");
const RouteMember = require("./routeMemberModel");
const { ensureSearchIndexes } = require("../utils/searchIndexes");

const toDateStr = (v) => {
    if (!v) return null;
    if (v instanceof Date) {
        if (isNaN(v.getTime())) return null;
        const y = v.getFullYear();
        const m = String(v.getMonth() + 1).padStart(2, "0");
        const d = String(v.getDate()).padStart(2, "0");
        return `${y}-${m}-${d}`;
    }
    return String(v).slice(0, 10);
};

const toDate = (value) => {
    if (!value) return null;
    const d = new Date(value);
    return Number.isNaN(d.getTime()) ? null : d;
};

const toNum = (value) => {
    if (value === "" || value === null || value === undefined) return null;
    const n = parseFloat(value);
    return Number.isNaN(n) ? null : n;
};

const buildReportId = (reportDate, vehicleNumber) => {
    const date = toDate(reportDate);
    const datePart = date ? date.toISOString().slice(0, 10).replace(/-/g, "") : String(reportDate || "").replace(/-/g, "");
    const vehiclePart = String(vehicleNumber || "").toUpperCase().trim();
    return `MC-${datePart}-${vehiclePart}`;
};

const clamp = (value, max) => {
    const s = String(value ?? "");
    return s.length > max ? s.slice(0, max) : s;
};

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS MilkCollections (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            reportId VARCHAR(50) NOT NULL,
            reportDate DATE NOT NULL,
            vehicleNumber VARCHAR(20) NOT NULL,
            routeNo VARCHAR(50) NULL,
            serialNo INT NULL,
            memberCode VARCHAR(50) NULL,
            memberName VARCHAR(150) NULL,
            eveningDate DATE NULL,
            eveningKg DECIMAL(10,2) NULL,
            eveningCLR DECIMAL(10,2) NULL,
            eveningFat DECIMAL(10,2) NULL,
            eveningSNF DECIMAL(10,2) NULL,
            morningDate DATE NULL,
            morningKg DECIMAL(10,2) NULL,
            morningCLR DECIMAL(10,2) NULL,
            morningFat DECIMAL(10,2) NULL,
            morningSNF DECIMAL(10,2) NULL,
            enteredBy VARCHAR(150) NULL,
            enteredByEmpId VARCHAR(50) NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_mc_report (reportId),
            INDEX idx_mc_vehicle (vehicleNumber),
            INDEX idx_mc_date (reportDate)
        )
    `);
};

exports.buildReportId = buildReportId;

exports.saveReport = async (data) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);
    await ensureSearchIndexes(pool);

    const reportDate = toDate(data.reportDate);
    const vehicleNumber = clamp(data.vehicleNumber, 20).toUpperCase().trim();
    if (!reportDate || !vehicleNumber) throw new Error("Report date and vehicle number are required.");

    const reportId = buildReportId(reportDate, vehicleNumber);
    const entries = Array.isArray(data.entries) ? data.entries : [];

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        const existing = await conn.execute(
            "SELECT id FROM MilkCollections WHERE reportId = ? AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
            [reportId]
        );
        if (existing.length > 0) {
            throw new Error("This vehicle & date report is already saved and locked. It cannot be modified after saving. Click New / Clear to start a different report.");
        }

        await conn.execute("DELETE FROM MilkCollections WHERE reportId = ?", [reportId]);

        for (let i = 0; i < entries.length; i += 1) {
            const entry = entries[i] || {};
            await conn.execute(
                `INSERT INTO MilkCollections
                 (reportId, reportDate, vehicleNumber, routeNo, serialNo, memberCode, memberName,
                  eveningDate, eveningKg, eveningCLR, eveningFat, eveningSNF,
                  morningDate, morningKg, morningCLR, morningFat, morningSNF,
                  enteredBy, enteredByEmpId)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    clamp(reportId, 50),
                    reportDate,
                    vehicleNumber,
                    clamp(data.routeNo, 50),
                    parseInt(entry.serialNo, 10) || i + 1,
                    clamp(entry.memberCode, 50),
                    clamp(entry.memberName, 150),
                    toDate(entry.eveningDate || data.reportDate),
                    toNum(entry.eveningKg),
                    toNum(entry.eveningCLR),
                    toNum(entry.eveningFat),
                    toNum(entry.eveningSNF),
                    toDate(entry.morningDate || data.reportDate),
                    toNum(entry.morningKg),
                    toNum(entry.morningCLR),
                    toNum(entry.morningFat),
                    toNum(entry.morningSNF),
                    clamp(data.enteredBy, 150),
                    clamp(data.enteredByEmpId, 50),
                ]
            );
        }

        await conn.commit();
        return { reportId, reportDate, vehicleNumber, routeNo: data.routeNo || "", count: entries.length };
    } catch (error) {
        try { await conn.rollback(); } catch { /* ignore */ }
        throw error;
    } finally {
        conn.release();
    }
};

exports.getByReport = async ({ reportDate, vehicleNumber } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    let query = "SELECT * FROM MilkCollections WHERE (isDeleted IS NULL OR isDeleted = 0)";
    const params = [];

    if (reportDate) {
        query += " AND reportDate = ?";
        params.push(toDate(reportDate));
    }
    if (vehicleNumber) {
        query += " AND vehicleNumber = ?";
        params.push(String(vehicleNumber).toUpperCase().trim());
    }
    query += " ORDER BY serialNo, id";

    const rows = await pool.execute(query, params);
    return rows;
};

exports.getDates = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    let query = `SELECT DISTINCT ${sql.dateFormat("reportDate", "%Y-%m-%d")} AS reportDate FROM MilkCollections WHERE (isDeleted IS NULL OR isDeleted = 0)`;
    const params = [];

    if (vehicleNumber) {
        query += " AND vehicleNumber = ?";
        params.push(String(vehicleNumber).toUpperCase().trim());
    }
    query += " ORDER BY reportDate DESC";

    const rows = await pool.execute(query, params);
    return rows;
};

exports.getVehicleAndPrevious = async (vehicleNumber, reportDate) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);
    const normalizedVehicle = String(vehicleNumber || "").toUpperCase().trim();
    if (!normalizedVehicle) return { vehicle: null, route: null, previousMembers: [], routeMembers: [] };

    const targetDate = toDate(reportDate);
    const dateStr = targetDate ? targetDate.toISOString().slice(0, 10) : null;

    let vehicleQuery, vehicleParams;
    if (dateStr) {
        vehicleQuery = "SELECT * FROM Vehicles WHERE vehicleNumber = ? AND allocationDate <= ? ORDER BY allocationDate DESC, id DESC LIMIT 1";
        vehicleParams = [normalizedVehicle, dateStr];
    } else {
        vehicleQuery = "SELECT * FROM Vehicles WHERE vehicleNumber = ? ORDER BY allocationDate DESC, id DESC LIMIT 1";
        vehicleParams = [normalizedVehicle];
    }

    let wbQuery, wbParams;
    if (dateStr) {
        wbQuery = `SELECT * FROM WeighBridgeEntries WHERE vehicleNumber = ? AND ${sql.date("createdAt")} <= ? ORDER BY createdAt DESC, id DESC LIMIT 1`;
        wbParams = [normalizedVehicle, dateStr];
    } else {
        wbQuery = "SELECT * FROM WeighBridgeEntries WHERE vehicleNumber = ? ORDER BY createdAt DESC, id DESC LIMIT 1";
        wbParams = [normalizedVehicle];
    }

    const [vehicleRows, wbRows] = await Promise.all([
        pool.execute(vehicleQuery, vehicleParams),
        pool.execute(wbQuery, wbParams),
    ]);

    let vehicle = vehicleRows[0] || null;
    const weighbridge = wbRows[0] || null;

    // Active alternative window → surface the effective (alternative) vehicle's
    // seals/details while keeping the searched plate as the vehicle number.
    const activeDateStr = dateStr || new Date().toISOString().slice(0, 10);
    const altWindow = await AlternativeVehicle.findActiveForVehicle(normalizedVehicle, activeDateStr).catch(() => null);
    if (altWindow) {
        const altRec = (await Vehicle.findByNumberAndDate(altWindow.alternativeVehicleNumber, activeDateStr).catch(() => null))
            || (await Vehicle.findByNumber(altWindow.alternativeVehicleNumber).catch(() => null));
        const primRec = (await Vehicle.findByNumberAndDate(altWindow.primaryVehicleNumber, activeDateStr).catch(() => null))
            || (await Vehicle.findByNumber(altWindow.primaryVehicleNumber).catch(() => null));
        const altCatalog = (await VehicleCatalog.findByNumber(altWindow.primaryVehicleNumber).catch(() => null))
            || (await VehicleCatalog.findByNumber(altWindow.alternativeVehicleNumber).catch(() => null));

        vehicle = {
            id: altRec?.id || null,
            vehicleNumber: normalizedVehicle,
            primaryVehicleNumber: altWindow.primaryVehicleNumber,
            alternativeVehicleNumber: altWindow.alternativeVehicleNumber,
            vehicleType: (altCatalog && altCatalog.vehicleType) || (altRec && altRec.vehicleType) || "Tanker",
            routeName: altWindow.routeName,
            allocationDate: toDateStr(altRec && altRec.allocationDate) || activeDateStr,
            serialNumbers: (altRec && altRec.serialNumbers) || [],
            alternativeVehicleSerials: (primRec && primRec.serialNumbers) || [],
            retiredSerials: Array.from(new Set([
                ...((altRec && altRec.retiredSerials) || []),
                ...((primRec && primRec.retiredSerials) || []),
            ])),
            driverName: (altRec && altRec.driverName) || "",
            driverMobile: (altRec && altRec.driverMobile) || "",
            conductorName: (altRec && altRec.conductorName) || "",
            destination: (altRec && altRec.destination) || "",
            purpose: (altRec && altRec.purpose) || "",
            isAlternative: true,
            alternativeValidFrom: altWindow.fromDate,
            alternativeValidTo: altWindow.toDate,
        };
    }

    // Date-aware flag: if the top allocation is not on the exact target date
    // (e.g. today), surface that so the frontend can warn the user.
    if (vehicle && dateStr) {
        const allocDateStr = toDateStr(vehicle.allocationDate);
        vehicle.searchedDate = dateStr;
        if (allocDateStr !== dateStr) {
            vehicle.notAllocatedOnDate = true;
            vehicle.allocatedOnDate = allocDateStr || null;
        } else {
            vehicle.notAllocatedOnDate = false;
        }
    }

    let reportId = null;
    if (dateStr) {
        const dated = await pool.execute(
            "SELECT reportId FROM MilkCollections WHERE vehicleNumber = ? AND reportDate = ? AND (isDeleted IS NULL OR isDeleted = 0) ORDER BY createdAt DESC, id DESC LIMIT 1",
            [normalizedVehicle, targetDate]
        );
        reportId = dated[0]?.reportId || null;
    }
    if (!reportId && !dateStr) {
        const latest = await pool.execute(
            "SELECT reportId FROM MilkCollections WHERE vehicleNumber = ? AND (isDeleted IS NULL OR isDeleted = 0) ORDER BY reportDate DESC, createdAt DESC, id DESC LIMIT 1",
            [normalizedVehicle]
        );
        reportId = latest[0]?.reportId || null;
    }

    let previousMembers = [];
    if (reportId) {
        const members = await pool.execute(
            `SELECT serialNo, memberCode, memberName,
                    eveningDate, eveningKg, eveningCLR, eveningFat, eveningSNF,
                    morningDate, morningKg, morningCLR, morningFat, morningSNF
             FROM MilkCollections WHERE reportId = ? AND (isDeleted IS NULL OR isDeleted = 0) ORDER BY serialNo, id`,
            [reportId]
        );
        previousMembers = members;
    }

    // Default member rows come from the Route Members master list. When a saved
    // report already exists its members win; otherwise the route's master list
    // members pre-fill the report so the user only has to add what's missing.
    let routeMembers = [];
    const effectiveRoute = vehicle?.routeName || weighbridge?.routeName || "";
    if (!previousMembers.length && effectiveRoute) {
        routeMembers = await RouteMember.getByRoute(effectiveRoute).catch(() => []);
    }

    return {
        vehicle,
        weighbridge,
        route: effectiveRoute,
        previousMembers,
        routeMembers,
        reportId: reportId || null,
    };
};

exports.getMemberByCode = async (memberCode) => {
    const pool = await connectDB();
    await ensureTable(pool);
    const normalized = String(memberCode || "").trim();
    if (!normalized) return null;

    const rows = await pool.execute(
        `SELECT memberCode, memberName
         FROM MilkCollections
         WHERE memberCode = ?
           AND memberName IS NOT NULL
           AND ${sql.trim("memberName")} != ''
         ORDER BY reportDate DESC, createdAt DESC, id DESC
         LIMIT 1`,
        [normalized]
    );
    return rows[0] || null;
};

exports.memberExistsForVehicleDate = async ({ vehicleNumber, reportDate, memberCode } = {}) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const normalizedVehicle = String(vehicleNumber || "").toUpperCase().trim();
    const normalizedMember = String(memberCode || "").trim();
    const date = toDate(reportDate);
    if (!normalizedVehicle || !normalizedMember || !date) return false;

    const rows = await pool.execute(
        `SELECT id FROM MilkCollections
         WHERE vehicleNumber = ? AND reportDate = ? AND memberCode = ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [normalizedVehicle, date, normalizedMember]
    );
    return rows.length > 0;
};

const ensureSoftDeleteColumns = async (pool) => {
    try { await pool.execute("ALTER TABLE MilkCollections ADD COLUMN isDeleted TINYINT(1) DEFAULT 0"); } catch {}
    try { await pool.execute("ALTER TABLE MilkCollections ADD COLUMN deletedAt DATETIME NULL"); } catch {}
    try { await pool.execute("ALTER TABLE MilkCollections ADD COLUMN deletedBy VARCHAR(150) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE MilkCollections ADD COLUMN deletedById VARCHAR(50) NULL"); } catch {}
};

exports.updateReport = async (data, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const department = (user?.department || "").trim().toLowerCase();
    if (!["admin", "management"].includes(department)) {
        throw new Error("Only admin/management can update a saved report.");
    }

    const reportDate = toDate(data.reportDate);
    const vehicleNumber = clamp(data.vehicleNumber, 20).toUpperCase().trim();
    if (!reportDate || !vehicleNumber) throw new Error("Report date and vehicle number are required.");

    const reportId = buildReportId(reportDate, vehicleNumber);
    const entries = Array.isArray(data.entries) ? data.entries : [];

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        const existing = await conn.execute(
            "SELECT id FROM MilkCollections WHERE reportId = ? AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
            [reportId]
        );
        if (existing.length === 0) {
            throw new Error("Report not found. It may have been deleted. Please refresh and try again.");
        }

        await AuditLog.create({
            module: "MilkCollection",
            action: "UPDATE",
            recordId: reportId,
            recordData: {
                reportId,
                vehicleNumber,
                reportDate: data.reportDate,
                routeNo: data.routeNo,
                previousEntryCount: existing.length,
                newEntryCount: entries.length,
            },
            user: user,
            ipAddress: ipAddress,
        });

        await conn.execute("DELETE FROM MilkCollections WHERE reportId = ?", [reportId]);

        for (let i = 0; i < entries.length; i += 1) {
            const entry = entries[i] || {};
            await conn.execute(
                `INSERT INTO MilkCollections
                 (reportId, reportDate, vehicleNumber, routeNo, serialNo, memberCode, memberName,
                  eveningDate, eveningKg, eveningCLR, eveningFat, eveningSNF,
                  morningDate, morningKg, morningCLR, morningFat, morningSNF,
                  enteredBy, enteredByEmpId)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    clamp(reportId, 50),
                    reportDate,
                    vehicleNumber,
                    clamp(data.routeNo, 50),
                    parseInt(entry.serialNo, 10) || i + 1,
                    clamp(entry.memberCode, 50),
                    clamp(entry.memberName, 150),
                    toDate(entry.eveningDate || data.reportDate),
                    toNum(entry.eveningKg),
                    toNum(entry.eveningCLR),
                    toNum(entry.eveningFat),
                    toNum(entry.eveningSNF),
                    toDate(entry.morningDate || data.reportDate),
                    toNum(entry.morningKg),
                    toNum(entry.morningCLR),
                    toNum(entry.morningFat),
                    toNum(entry.morningSNF),
                    clamp(data.enteredBy, 150),
                    clamp(data.enteredByEmpId, 50),
                ]
            );
        }

        await conn.commit();
        return { reportId, reportDate, vehicleNumber, routeNo: data.routeNo || "", count: entries.length };
    } catch (error) {
        try { await conn.rollback(); } catch { /* ignore */ }
        throw error;
    } finally {
        conn.release();
    }
};

exports.deleteReport = async (reportId, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureTable(pool);
    await ensureSoftDeleteColumns(pool);

    const existing = await pool.execute(
        "SELECT * FROM MilkCollections WHERE reportId = ? AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1",
        [reportId]
    );
    if (!existing || existing.length === 0) {
        throw new Error("Report not found or already deleted.");
    }

    const record = existing[0];

    await AuditLog.create({
        module: "MilkCollection",
        action: "DELETE",
        recordId: reportId,
        recordData: {
            reportId,
            vehicleNumber: record.vehicleNumber,
            reportDate: record.reportDate,
            routeNo: record.routeNo,
            enteredBy: record.enteredBy,
            createdAt: record.createdAt
        },
        user: user,
        ipAddress: ipAddress
    });

    const now = new Date();
    await pool.execute(
        "UPDATE MilkCollections SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ? WHERE reportId = ?",
        [
            now,
            user?.employeeName || user?.name || null,
            user?.employeeId || user?.id || null,
            reportId
        ]
    );

    return true;
};
