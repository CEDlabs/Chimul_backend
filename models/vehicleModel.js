const { connectDB, sql } = require("../config/db");
const { ensureSearchIndexes, syncVehicleSeals } = require("../utils/searchIndexes");

async function ensureVehiclesTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS Vehicles (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                vehicleNumber VARCHAR(20) NOT NULL,
                vehicleType VARCHAR(50) NULL,
                routeName VARCHAR(50) NULL,
                conductorName VARCHAR(100) NULL,
                driverName VARCHAR(100) NULL,
                driverMobile VARCHAR(20) NULL,
                supplierCode VARCHAR(50) NULL,
                contractorCode VARCHAR(50) NULL,
                productGroup VARCHAR(100) NULL,
                productName VARCHAR(100) NULL,
                compartments INT DEFAULT 1,
                destination VARCHAR(100) NULL,
                purpose VARCHAR(50) DEFAULT 'Load Tanker (BMC)',
                weighBridgeNo INT DEFAULT 1,
                serialNumbers ${sql.longText} NULL,
                allocationDate DATE NOT NULL DEFAULT (${sql.curdate()}),
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                UNIQUE KEY uq_vehicle_date (vehicleNumber, allocationDate),
                INDEX idx_veh_number (vehicleNumber)
            )
        `);
    } catch (e) {
        console.warn("[Vehicles] Table creation warning:", e.message);
    }
}

const ensureAuditColumns = async (pool) => {
    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Vehicles' AND COLUMN_NAME = 'createdByName'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE Vehicles ADD createdByName VARCHAR(100) NULL");
            await pool.execute("ALTER TABLE Vehicles ADD createdByEmpId VARCHAR(50) NULL");
            await pool.execute("ALTER TABLE Vehicles ADD createdByEmail VARCHAR(150) NULL");
            await pool.execute("ALTER TABLE Vehicles ADD createdByDept VARCHAR(100) NULL");
        }
        const delCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Vehicles' AND COLUMN_NAME = 'isDeleted'"
        );
        if (delCheck.length === 0) {
            await pool.execute("ALTER TABLE Vehicles ADD isDeleted TINYINT(1) DEFAULT 0");
            await pool.execute("ALTER TABLE Vehicles ADD deletedAt DATETIME NULL");
            await pool.execute("ALTER TABLE Vehicles ADD deletedBy VARCHAR(100) NULL");
            await pool.execute("ALTER TABLE Vehicles ADD deletedById VARCHAR(50) NULL");
        }
    } catch (e) {
        console.warn("[Vehicles] audit columns migration warning:", e.message);
    }
};

const extractUserDetails = (user) => {
    let name = null;
    let empId = null;
    let email = null;
    let dept = null;

    if (user && typeof user === "object") {
        name = user.employeeName || user.name || null;
        empId = user.employeeId || user.id || null;
        email = user.email || null;
        dept = user.department || null;
    } else if (typeof user === "string" && user.trim()) {
        name = user.trim();
    }

    return { name, empId, email, dept };
};

const ensureVehicleDataColumns = async (pool) => {
    try {
        const colCheck = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Vehicles' AND COLUMN_NAME = 'retiredSerials'"
        );
        if (colCheck.length === 0) {
            await pool.execute("ALTER TABLE Vehicles ADD retiredSerials LONGTEXT NULL");
            await pool.execute("ALTER TABLE Vehicles ADD approvalCopy LONGTEXT NULL");
            await pool.execute("ALTER TABLE Vehicles ADD sealChangeHistory LONGTEXT NULL");
        }
    } catch (e) {
        console.warn("[Vehicles] data columns migration warning:", e.message);
    }
};

const normalizeVehicle = (row) => {
    if (!row) return null;
    const parseJsonArray = (field) => {
        if (row[field] && typeof row[field] === "string") {
            try { row[field] = JSON.parse(row[field]); } catch { row[field] = []; }
        } else if (!Array.isArray(row[field])) {
            row[field] = [];
        }
    };
    parseJsonArray("serialNumbers");
    parseJsonArray("retiredSerials");
    parseJsonArray("sealChangeHistory");
    if (row.allocationDate && typeof row.allocationDate === "string") {
        row.allocationDate = row.allocationDate.slice(0, 10);
    }
    return row;
};


exports.findByNumber = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const vNum = (vehicleNumber || "").toUpperCase().trim();
    const rows = await pool.execute(
        "SELECT * FROM Vehicles WHERE vehicleNumber = ? AND (isDeleted IS NULL OR isDeleted = 0) ORDER BY allocationDate DESC, id DESC LIMIT 1",
        [vNum]
    );

    return normalizeVehicle(rows[0]);
};

exports.getAll = async () => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const rows = await pool.execute(
        "SELECT * FROM Vehicles WHERE (isDeleted IS NULL OR isDeleted = 0) ORDER BY allocationDate DESC, vehicleNumber ASC"
    );

    return rows.map(normalizeVehicle);
};

exports.checkDuplicates = async ({ vehicleNumber, primaryVehicleNumber, routeName, serialNumbers, allocationDate, excludeId, checkOnlyNew }) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);

    const result = {
        duplicateVehicle: null,
        duplicateRoute: null,
        duplicateSerials: [],
        invalidSerials: []
    };

    const targetDate = allocationDate || new Date().toISOString().slice(0, 10);

    const vehiclesToCheck = Array.from(new Set(
        [vehicleNumber, primaryVehicleNumber].filter(v => v && String(v).trim())
    ));

    // 1. Check if same vehicle number or primary vehicle number is already allocated on this date
    for (const vNum of vehiclesToCheck) {
        let vQuery = `SELECT id, vehicleNumber, vehicleType, routeName, allocationDate, serialNumbers
             FROM Vehicles
             WHERE UPPER(vehicleNumber) = UPPER(?) AND allocationDate = ?
               AND (isDeleted IS NULL OR isDeleted = 0)`;
        const vParams = [vNum.trim(), targetDate];
        if (excludeId) {
            vQuery += ` AND id != ?`;
            vParams.push(parseInt(excludeId, 10));
        }
        vQuery += ` LIMIT 1`;
        const vRows = await pool.execute(vQuery, vParams);
        if (vRows.length > 0) {
            result.duplicateVehicle = normalizeVehicle(vRows[0]);
            break;
        }
    }

    // 2. Check if any vehicle already allocated for this route on this date
    if (routeName && routeName.trim()) {
        let rQuery = `SELECT id, vehicleNumber, vehicleType, routeName, allocationDate, serialNumbers
             FROM Vehicles
             WHERE routeName = ? AND allocationDate = ?
               AND (isDeleted IS NULL OR isDeleted = 0)`;
        const rParams = [routeName.trim(), targetDate];
        if (excludeId) {
            rQuery += ` AND id != ?`;
            rParams.push(parseInt(excludeId, 10));
        }
        rQuery += ` ORDER BY createdAt DESC LIMIT 1`;
        const rRows = await pool.execute(rQuery, rParams);
        if (rRows.length > 0) {
            result.duplicateRoute = normalizeVehicle(rRows[0]);
        }
    }

    // 3. Check if any serial number already allocated - across ALL dates
    //    (active seal numbers and retired/seal-changed numbers are reserved)
    //    When checkOnlyNew is true, skip seals that belong to the current allocation (excludeId).
    if (Array.isArray(serialNumbers) && serialNumbers.length > 0) {
        const filtered = serialNumbers.filter(s => s && String(s).trim());

        // A. Check for duplicates within the provided array itself (intra-form duplicates)
        const seenInRequest = new Set();
        for (const s of filtered) {
            const str = String(s).trim();
            if (seenInRequest.has(str)) {
                if (!result.duplicateSerials.some(d => d.serialNumber === str)) {
                    result.duplicateSerials.push({
                        serialNumber: str,
                        vehicleNumber: vehicleNumber || "Same Allocation",
                        routeName: routeName || "Same Allocation",
                        allocationDate: targetDate,
                        retired: false,
                        duplicateInForm: true,
                    });
                }
            }
            seenInRequest.add(str);
        }

        // B. Check against existing database records across ALL dates
        //    Uses the indexed VehicleSeals lookup table for exact & fast matches.
        //    When checkOnlyNew is true, get current allocation's seals to skip them.
        let existingSealsToSkip = new Set();
        if (checkOnlyNew && excludeId) {
            try {
                const currentVehicle = await pool.execute(
                    `SELECT serialNumbers FROM Vehicles WHERE id = ?`,
                    [parseInt(excludeId, 10)]
                );
                if (currentVehicle.length > 0) {
                    const currSerials = JSON.parse(currentVehicle[0].serialNumbers || "[]");
                    currSerials.forEach(s => existingSealsToSkip.add(String(s).trim()));
                }
            } catch {}
        }

        for (const serial of filtered) {
            const serialStr = String(serial).trim();
            // Skip unchanged seals when checkOnlyNew is true
            if (checkOnlyNew && existingSealsToSkip.has(serialStr)) {
                continue;
            }
            const sRows = await pool.execute(
                `SELECT vs.sealNumber, vs.sealStatus, v.vehicleNumber, v.routeName, v.allocationDate
                 FROM VehicleSeals vs
                 LEFT JOIN Vehicles v ON v.id = vs.vehicleId
                 WHERE vs.sealNumber = ?
                 ORDER BY vs.allocationDate DESC, vs.id DESC
                 LIMIT 1`,
                [serialStr]
            ).catch(() => []);

            if (sRows && sRows.length > 0) {
                const existing = sRows[0];
                if (!result.duplicateSerials.some(d => d.serialNumber === serialStr)) {
                    result.duplicateSerials.push({
                        serialNumber: serialStr,
                        vehicleNumber: existing.vehicleNumber,
                        routeName: existing.routeName,
                        allocationDate: existing.allocationDate,
                        retired: existing.sealStatus === "RETIRED",
                    });
                }
            }
        }
    }

    // 4. 6-digit seal-number format validation
    if (Array.isArray(serialNumbers) && serialNumbers.length > 0) {
        for (const serial of serialNumbers) {
            const str = String(serial).trim();
            if (str && !/^\d{6}$/.test(str)) {
                result.invalidSerials.push(str);
            }
        }
    }

    return result;
};

exports.remove = async (id, user = null) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);

    const idVal = parseInt(id, 10);
    const now = new Date();
    const { name, empId } = extractUserDetails(user);

    await pool.execute(
        "UPDATE Vehicles SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ?, updatedAt = ? WHERE id = ?",
        [now, name, empId, now, idVal]
    );
    return { id: idVal };
};

exports.register = async (data) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const vehicleNumber = (data.vehicleNumber || "").toUpperCase().trim();

    let allocationDate = new Date();
    if (data.allocationDate) {
        const parsed = new Date(data.allocationDate);
        if (!isNaN(parsed.getTime())) allocationDate = parsed;
    }

    const hasSerialNumbers = Array.isArray(data.serialNumbers) || typeof data.serialNumbers === "string";
    const serialNumbersJson = hasSerialNumbers
        ? JSON.stringify(
            (Array.isArray(data.serialNumbers) ? data.serialNumbers : [data.serialNumbers])
                .filter(Boolean)
          )
        : null;

    const { name, empId, email, dept } = extractUserDetails(data.createdBy);

    // Look up compartments from VehicleCatalog; default to 2 if not found
    let compartments = 2;
    try {
        const catRows = await pool.execute(
            "SELECT compartments FROM VehicleCatalog WHERE UPPER(vehicleNumber) = UPPER(?) LIMIT 1",
            [vehicleNumber]
        );
        if (catRows.length > 0 && catRows[0].compartments) {
            compartments = parseInt(catRows[0].compartments, 10) || 2;
        }
    } catch {}
    // Override with explicit value if provided in request
    if (data.compartments !== undefined && data.compartments !== null && data.compartments !== "") {
        compartments = parseInt(data.compartments, 10) || 2;
    }

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        let target = null;
        let restoring = false;

        if (data.id) {
            const byId = await conn.execute(
                "SELECT id, allocationDate, serialNumbers, retiredSerials, sealChangeHistory FROM Vehicles WHERE id = ?",
                [parseInt(data.id, 10)]
            );
            if (byId.length) {
                target = byId[0];
            }
        }

        if (!target) {
            const existing = await conn.execute(
                "SELECT id, allocationDate, serialNumbers, retiredSerials, sealChangeHistory FROM Vehicles WHERE vehicleNumber = ? AND allocationDate = ? AND (isDeleted IS NULL OR isDeleted = 0)",
                [vehicleNumber, allocationDate.toISOString().slice(0, 10)]
            );
            target = existing.length ? existing[0] : null;
        }

        if (!target) {
            // A soft-deleted record for the same vehicle+date blocks the unique key
            // uq_vehicle_date on INSERT, so reactivate it instead.
            const softDeleted = await conn.execute(
                "SELECT id, allocationDate, serialNumbers, retiredSerials, sealChangeHistory FROM Vehicles WHERE vehicleNumber = ? AND allocationDate = ?",
                [vehicleNumber, allocationDate.toISOString().slice(0, 10)]
            );
            if (softDeleted.length) {
                target = softDeleted[0];
                restoring = true;
            }
        }

        // STRICT PRE-CHECK FOR DUPLICATE SEALS BEFORE SAVING TO DB
        if (hasSerialNumbers) {
            const serialsArr = (Array.isArray(data.serialNumbers) ? data.serialNumbers : [data.serialNumbers])
                .filter(s => s && String(s).trim())
                .map(s => String(s).trim());

            // 1. Check intra-request duplicates (repeated seal in same payload)
            const setSerials = new Set();
            for (const s of serialsArr) {
                if (setSerials.has(s)) {
                    throw new Error(`Duplicate seal number '${s}' entered multiple times in this allocation. Each seal number must be unique.`);
                }
                setSerials.add(s);
            }

            // 2. Check DB duplicates across active and retired seals
            // When updating (target exists), only check NEW seals that differ from existing ones
            let sealsToCheck = serialsArr;
            if (target) {
                const existingSerials = (() => {
                    try { return JSON.parse(target.serialNumbers || "[]"); } catch { return []; }
                })();
                const existingSet = new Set(existingSerials.map(s => String(s).trim()));
                sealsToCheck = serialsArr.filter(s => !existingSet.has(String(s).trim()));
            }

            const dupCheck = await exports.checkDuplicates({
                vehicleNumber: data.vehicleNumber,
                routeName: data.routeName,
                serialNumbers: sealsToCheck,
                allocationDate: data.allocationDate,
                excludeId: target ? target.id : null,
            });

            if (dupCheck.duplicateSerials && dupCheck.duplicateSerials.length > 0) {
                const firstDup = dupCheck.duplicateSerials[0];
                if (firstDup.duplicateInForm) {
                    throw new Error(`Seal number '${firstDup.serialNumber}' is duplicated within the allocation form.`);
                } else {
                    const dupDate = firstDup.allocationDate instanceof Date
                        ? firstDup.allocationDate.toISOString().slice(0, 10)
                        : String(firstDup.allocationDate || "").slice(0, 10);
                    throw new Error(`Seal number '${firstDup.serialNumber}' is already allocated to vehicle ${firstDup.vehicleNumber} on date ${dupDate}. Seal numbers cannot be duplicated.`);
                }
            }
        }

        let newId;
        let action;
        let retiredNext = null;
        let historyNext = null;

        if (target) {
            const prevSerials = (() => {
                try { return JSON.parse(target.serialNumbers || "[]"); } catch { return []; }
            })();
            const prevRetired = (() => {
                try { return JSON.parse(target.retiredSerials || "[]"); } catch { return []; }
            })();
            const prevHistory = (() => {
                try { return JSON.parse(target.sealChangeHistory || "[]"); } catch { return []; }
            })();

            const newSerialsList = hasSerialNumbers ? JSON.parse(serialNumbersJson || "[]") : [];
            // Any seal removed during an edit is moved to retiredSerials so BOTH the old and
            // new seal numbers remain on record (seal change request requirement).
            const removed = prevSerials.filter(s => !newSerialsList.includes(s));
            retiredNext = removed.length
                ? Array.from(new Set([...prevRetired, ...removed]))
                : prevRetired;

            const historyEntry = (removed.length > 0 || data.approvalCopy)
                ? {
                    changedAt: new Date().toISOString(),
                    changedBy: name || "Unknown",
                    changedByEmpId: empId || "",
                    removed,
                    added: newSerialsList,
                    approvalCopy: data.approvalCopy || null,
                    allocationDate: allocationDate.toISOString().slice(0, 10),
                }
                : null;
            historyNext = historyEntry ? [...prevHistory, historyEntry] : prevHistory;

            await conn.execute(
                `UPDATE Vehicles SET
                    vehicleType = ?, routeName = ?, conductorName = ?, driverName = ?,
                    driverMobile = ?, supplierCode = ?, contractorCode = ?,
                    productGroup = ?, productName = ?, compartments = ?,
                    destination = ?, purpose = ?, weighBridgeNo = ?,
                    serialNumbers = COALESCE(?, serialNumbers),
                    retiredSerials = ?,
                    sealChangeHistory = ?,
                    approvalCopy = COALESCE(?, approvalCopy),
                    createdByName = COALESCE(?, createdByName),
                    createdByEmpId = COALESCE(?, createdByEmpId),
                    createdByEmail = COALESCE(?, createdByEmail),
                    createdByDept = COALESCE(?, createdByDept),
                    isDeleted = 0,
                    updatedAt = ${sql.now()}
                 WHERE id = ?`,
                [
                    data.vehicleType || "Tanker",
                    data.routeName || "",
                    data.conductorName || "",
                    data.driverName || "",
                    data.driverMobile || "",
                    data.supplierCode || "",
                    data.contractorCode || "",
                    data.productGroup || "Dairy Products",
                    data.productName || "",
                    compartments,
                    data.destination || "",
                    data.purpose || "Load Tanker (BMC)",
                    parseInt(data.weighBridgeNo, 10) || 1,
                    serialNumbersJson,
                    JSON.stringify(retiredNext || []),
                    JSON.stringify(historyNext || []),
                    data.approvalCopy || null,
                    name,
                    empId,
                    email,
                    dept,
                    target.id,
                ]
            );
            newId = target.id;
            action = restoring ? "restored" : "updated";
        } else {
            const result = await conn.execute(
                `INSERT INTO Vehicles
                 (vehicleNumber, vehicleType, routeName, conductorName, driverName,
                  driverMobile, supplierCode, contractorCode, productGroup, productName,
                  compartments, destination, purpose, weighBridgeNo, serialNumbers, allocationDate,
                  retiredSerials, sealChangeHistory, approvalCopy,
                  createdByName, createdByEmpId, createdByEmail, createdByDept)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    vehicleNumber,
                    data.vehicleType || "Tanker",
                    data.routeName || "",
                    data.conductorName || "",
                    data.driverName || "",
                    data.driverMobile || "",
                    data.supplierCode || "",
                    data.contractorCode || "",
                    data.productGroup || "Dairy Products",
                    data.productName || "",
                    compartments,
                    data.destination || "",
                    data.purpose || "Load Tanker (BMC)",
                    parseInt(data.weighBridgeNo, 10) || 1,
                    serialNumbersJson || "[]",
                    allocationDate.toISOString().slice(0, 10),
                    null,
                    null,
                    data.approvalCopy || null,
                    name,
                    empId,
                    email,
                    dept,
                ]
            );
            newId = result.insertId;
            action = "created";
        }

        // Keep the indexed VehicleSeals lookup in sync with the JSON columns.
        const activeSerialList = hasSerialNumbers
            ? (JSON.parse(serialNumbersJson || "[]") || [])
            : [];
        const retiredSerialList = Array.isArray(retiredNext) ? retiredNext : [];
        await syncVehicleSeals(conn, {
            vehicleId: newId,
            vehicleNumber,
            allocationDate: allocationDate.toISOString().slice(0, 10),
            activeSerials: activeSerialList,
            retiredSerials: retiredSerialList,
        });

        await conn.commit();
        console.log(`[Vehicles] ${action} master vehicle: ${vehicleNumber} on ${allocationDate.toISOString().slice(0, 10)} by ${name || "unknown"}`);

        return {
            id: newId,
            action,
            vehicleNumber,
            ...data,
            createdByName: name,
            createdByEmpId: empId,
            serialNumbers: hasSerialNumbers
                ? JSON.parse(serialNumbersJson || "[]")
                : (data.serialNumbers || []),
            retiredSerials: retiredNext || [],
            sealChangeHistory: historyNext || [],
        };
    } catch (err) {
        await conn.rollback();
        console.error(`[Vehicles] Register error for ${vehicleNumber}:`, err.message);
        throw err;
    } finally {
        conn.release();
    }
};

exports.listAllocatedRoutes = async (date) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const targetDate = date || new Date().toISOString().slice(0, 10);
    const rows = await pool.execute(
        `SELECT * FROM Vehicles
         WHERE allocationDate = ? AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY routeName ASC, createdAt DESC`,
        [targetDate]
    );
    return rows.map(normalizeVehicle);
};

exports.findPrimaryByRoute = async (routeName, date) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const rows = await pool.execute(
        `SELECT * FROM Vehicles
         WHERE routeName = ? AND allocationDate = ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY createdAt DESC LIMIT 1`,
        [routeName, date || new Date().toISOString().slice(0, 10)]
    );
    return normalizeVehicle(rows[0]);
};

exports.findByNumberAndDate = async (vehicleNumber, date) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);
    await ensureVehicleDataColumns(pool);
    await ensureSearchIndexes(pool);

    const rows = await pool.execute(
        `SELECT * FROM Vehicles
         WHERE UPPER(vehicleNumber) = UPPER(?) AND allocationDate = ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY createdAt DESC LIMIT 1`,
        [vehicleNumber.trim(), date || new Date().toISOString().slice(0, 10)]
    );
    return normalizeVehicle(rows[0]);
};
