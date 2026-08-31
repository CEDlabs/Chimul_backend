const { connectDB, sql } = require("../config/db");

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
                purpose VARCHAR(50) DEFAULT 'Unloading',
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

const normalizeVehicle = (row) => {
    if (!row) return null;
    if (row.serialNumbers && typeof row.serialNumbers === "string") {
        try { row.serialNumbers = JSON.parse(row.serialNumbers); } catch { row.serialNumbers = []; }
    } else if (!Array.isArray(row.serialNumbers)) {
        row.serialNumbers = [];
    }
    if (row.allocationDate && typeof row.allocationDate === "string") {
        row.allocationDate = row.allocationDate.slice(0, 10);
    }
    return row;
};


exports.findByNumber = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);

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

    const rows = await pool.execute(
        "SELECT * FROM Vehicles WHERE (isDeleted IS NULL OR isDeleted = 0) ORDER BY allocationDate DESC, vehicleNumber ASC"
    );

    return rows.map(normalizeVehicle);
};

exports.checkDuplicates = async ({ vehicleNumber, routeName, serialNumbers, allocationDate, excludeId }) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);

    const result = {
        duplicateVehicle: null,
        duplicateRoute: null,
        duplicateSerials: []
    };

    const targetDate = allocationDate || new Date().toISOString().slice(0, 10);

    // 1. Check if same vehicle number already allocated on this date
    if (vehicleNumber && vehicleNumber.trim()) {
        let vQuery = `SELECT id, vehicleNumber, vehicleType, routeName, allocationDate, serialNumbers
             FROM Vehicles
             WHERE UPPER(vehicleNumber) = UPPER(?) AND allocationDate = ?
               AND (isDeleted IS NULL OR isDeleted = 0)`;
        const vParams = [vehicleNumber.trim(), targetDate];
        if (excludeId) {
            vQuery += ` AND id != ?`;
            vParams.push(parseInt(excludeId, 10));
        }
        vQuery += ` LIMIT 1`;
        const vRows = await pool.execute(vQuery, vParams);
        if (vRows.length > 0) {
            result.duplicateVehicle = normalizeVehicle(vRows[0]);
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

    // 3. Check if any serial number already allocated on this date
    if (Array.isArray(serialNumbers) && serialNumbers.length > 0) {
        const filtered = serialNumbers.filter(s => s && String(s).trim());
        for (const serial of filtered) {
            let sQuery = `SELECT id, vehicleNumber, routeName, allocationDate, serialNumbers
                 FROM Vehicles
                 WHERE allocationDate = ? AND JSON_CONTAINS(serialNumbers, ?)
                   AND (isDeleted IS NULL OR isDeleted = 0)`;
            const sParams = [targetDate, JSON.stringify(String(serial).trim())];
            if (excludeId) {
                sQuery += ` AND id != ?`;
                sParams.push(parseInt(excludeId, 10));
            }
            sQuery += ` ORDER BY createdAt DESC LIMIT 1`;
            const sRows = await pool.execute(sQuery, sParams);
            if (sRows.length > 0) {
                const existing = normalizeVehicle(sRows[0]);
                result.duplicateSerials.push({
                    serialNumber: String(serial).trim(),
                    vehicleNumber: existing.vehicleNumber,
                    routeName: existing.routeName,
                    allocationDate: existing.allocationDate
                });
            }
        }
    }

    return result;
};

exports.remove = async (id, user = null) => {
    const pool = await connectDB();
    await ensureVehiclesTable(pool);
    await ensureAuditColumns(pool);

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

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        const existing = await conn.execute(
            "SELECT id FROM Vehicles WHERE vehicleNumber = ? AND allocationDate = ? AND (isDeleted IS NULL OR isDeleted = 0)",
            [vehicleNumber, allocationDate.toISOString().slice(0, 10)]
        );

        let newId;
        let action;

        if (existing.length > 0) {
            await conn.execute(
                `UPDATE Vehicles SET
                    vehicleType = ?, routeName = ?, conductorName = ?, driverName = ?,
                    driverMobile = ?, supplierCode = ?, contractorCode = ?,
                    productGroup = ?, productName = ?, compartments = ?,
                    destination = ?, purpose = ?, weighBridgeNo = ?,
                    serialNumbers = COALESCE(?, serialNumbers),
                    createdByName = COALESCE(?, createdByName),
                    createdByEmpId = COALESCE(?, createdByEmpId),
                    createdByEmail = COALESCE(?, createdByEmail),
                    createdByDept = COALESCE(?, createdByDept),
                    updatedAt = ${sql.now()}
                 WHERE vehicleNumber = ? AND allocationDate = ? AND (isDeleted IS NULL OR isDeleted = 0)`,
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
                    parseInt(data.compartments, 10) || 1,
                    data.destination || "",
                    data.purpose || "Unloading",
                    parseInt(data.weighBridgeNo, 10) || 1,
                    serialNumbersJson,
                    name,
                    empId,
                    email,
                    dept,
                    vehicleNumber,
                    allocationDate.toISOString().slice(0, 10),
                ]
            );
            newId = existing[0].id;
            action = "updated";
        } else {
            const result = await conn.execute(
                `INSERT INTO Vehicles
                 (vehicleNumber, vehicleType, routeName, conductorName, driverName,
                  driverMobile, supplierCode, contractorCode, productGroup, productName,
                  compartments, destination, purpose, weighBridgeNo, serialNumbers, allocationDate,
                  createdByName, createdByEmpId, createdByEmail, createdByDept)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
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
                    parseInt(data.compartments, 10) || 1,
                    data.destination || "",
                    data.purpose || "Unloading",
                    parseInt(data.weighBridgeNo, 10) || 1,
                    serialNumbersJson || "[]",
                    allocationDate.toISOString().slice(0, 10),
                    name,
                    empId,
                    email,
                    dept,
                ]
            );
            newId = result.insertId;
            action = "created";
        }

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
        };
    } catch (err) {
        await conn.rollback();
        console.error(`[Vehicles] Register error for ${vehicleNumber}:`, err.message);
        throw err;
    } finally {
        conn.release();
    }
};
