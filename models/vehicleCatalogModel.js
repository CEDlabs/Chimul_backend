const { connectDB, sql } = require("../config/db");
const { ensureSearchIndexes } = require("../utils/searchIndexes");

async function ensureVehicleCatalogTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS VehicleCatalog (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                vehicleNumber VARCHAR(20) NOT NULL UNIQUE,
                vehicleType VARCHAR(50) NULL,
                routeName VARCHAR(100) NULL,
                taluk VARCHAR(100) NULL,
                compartments INT DEFAULT 3,
                capacity VARCHAR(50) NULL,
                remarks VARCHAR(255) NULL,
                createdByName VARCHAR(100) NULL,
                createdByEmpId VARCHAR(50) NULL,
                createdByEmail VARCHAR(150) NULL,
                createdByDept VARCHAR(100) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                isDeleted TINYINT(1) DEFAULT 0,
                deletedAt DATETIME NULL,
                deletedBy VARCHAR(100) NULL,
                deletedById VARCHAR(50) NULL,
                INDEX idx_catalog_number (vehicleNumber),
                INDEX idx_catalog_route (routeName)
            )
        `);
    } catch (e) {
        console.warn("[VehicleCatalog] Table creation warning:", e.message);
    }

    // Best-effort migrations for existing databases.
    const migrations = [
        "ALTER TABLE VehicleCatalog ADD routeName VARCHAR(100) NULL",
        "ALTER TABLE VehicleCatalog ADD COLUMN compartments INT DEFAULT 3",
        "ALTER TABLE VehicleCatalog ADD COLUMN taluk VARCHAR(100) NULL",
        "ALTER TABLE VehicleCatalog ADD COLUMN capacity VARCHAR(50) NULL",
    ];
    for (const stmt of migrations) {
        try { await pool.execute(stmt); } catch (_) {}
    }
}

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

const toDateOnly = (v) => {
    if (!v) return null;
    return String(v).slice(0, 10);
};

const normalizeRow = (row) => {
    if (!row) return null;
    row.createdAt = toDateOnly(row.createdAt);
    return row;
};

// List of fleet vehicles (master vehicle list). Admin/dept-admin maintains it;
// all other users pick a vehicle from here for allocating seal numbers/date.
exports.getAll = async () => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);
    await ensureSearchIndexes(pool);

    const rows = await pool.execute(
        `SELECT * FROM VehicleCatalog
         WHERE (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY UPPER(vehicleNumber) ASC, id ASC`
    );
    return rows.map(normalizeRow);
};

exports.findByNumber = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);

    const vNum = String(vehicleNumber || "").trim().toUpperCase();
    if (!vNum) return null;

    const rows = await pool.execute(
        `SELECT * FROM VehicleCatalog
         WHERE UPPER(vehicleNumber) = UPPER(?) AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [vNum]
    );
    return normalizeRow(rows[0]);
};

exports.getByRoute = async (routeName) => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);
    await ensureSearchIndexes(pool);

    const rName = String(routeName || "").trim();
    if (!rName) return null;

    const rows = await pool.execute(
        `SELECT * FROM VehicleCatalog
         WHERE UPPER(routeName) = UPPER(?) AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [rName]
    );
    return normalizeRow(rows[0]);
};

// Distinct routes from the master vehicle list and dedicated Routes table.
// This is the single source of truth for the route dropdowns across departments.
exports.getAllRoutes = async () => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);

    const catalogRows = await pool.execute(
        `SELECT routeName, vehicleNumber, vehicleType
         FROM VehicleCatalog
         WHERE routeName IS NOT NULL AND routeName <> ''
           AND (isDeleted IS NULL OR isDeleted = 0)`
    );

    const routeTableRows = await pool.execute(
        `SELECT routeName, NULL AS vehicleNumber, NULL AS vehicleType
         FROM Routes
         WHERE routeName IS NOT NULL AND routeName <> ''
           AND (isDeleted IS NULL OR isDeleted = 0)`
    ).catch(() => []);

    const map = new Map();
    (catalogRows || []).forEach((r) => {
        if (r && r.routeName) map.set(r.routeName.toUpperCase(), r);
    });
    (routeTableRows || []).forEach((r) => {
        if (r && r.routeName && !map.has(r.routeName.toUpperCase())) {
            map.set(r.routeName.toUpperCase(), { routeName: r.routeName, vehicleNumber: "", vehicleType: "" });
        }
    });

    const combined = Array.from(map.values());
    combined.sort((a, b) => {
        const ra = String(a.routeName || "");
        const rb = String(b.routeName || "");
        return ra.localeCompare(rb, undefined, { numeric: true, sensitivity: "base" });
    });

    return combined;
};

exports.create = async (data, user = null) => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);

    const vehicleNumber = String(data.vehicleNumber || "").trim().toUpperCase();
    const routeName = String(data.routeName || "").trim();

    if (!vehicleNumber) {
        const err = new Error("Vehicle number is required.");
        err.status = 400;
        throw err;
    }

    if (!routeName) {
        const err = new Error("Allocated route is required for master list entries.");
        err.status = 400;
        throw err;
    }

    const { name, empId, email, dept } = extractUserDetails(user);

    const existingVehicle = await pool.execute(
        "SELECT id, vehicleNumber FROM VehicleCatalog WHERE UPPER(vehicleNumber) = UPPER(?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [vehicleNumber]
    );
    if (existingVehicle.length > 0) {
        const err = new Error(`Vehicle ${vehicleNumber} is already in the master vehicle list.`);
        err.status = 409;
        throw err;
    }

    const existingRoute = await pool.execute(
        "SELECT id, vehicleNumber, routeName FROM VehicleCatalog WHERE UPPER(routeName) = UPPER(?) AND (isDeleted IS NULL OR isDeleted = 0)",
        [routeName]
    );
    if (existingRoute.length > 0) {
        const err = new Error(`Route "${routeName}" is already allocated to vehicle ${existingRoute[0].vehicleNumber} in the master vehicle list. Each route must be unique.`);
        err.status = 409;
        throw err;
    }

    const result = await pool.execute(
        `INSERT INTO VehicleCatalog
         (vehicleNumber, vehicleType, routeName, taluk, compartments, capacity, remarks, createdByName, createdByEmpId, createdByEmail, createdByDept)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
            vehicleNumber,
            data.vehicleType || "Tanker",
            routeName,
            data.taluk || null,
            parseInt(data.compartments, 10) || 3,
            data.capacity || null,
            data.remarks || "",
            name,
            empId,
            email,
            dept,
        ]
    );

    return {
        id: result.insertId,
        vehicleNumber,
        vehicleType: data.vehicleType || "Tanker",
        routeName,
        taluk: data.taluk || null,
        compartments: parseInt(data.compartments, 10) || 3,
        capacity: data.capacity || null,
        remarks: data.remarks || "",
    };
};

exports.remove = async (id, user = null) => {
    const pool = await connectDB();
    await ensureVehicleCatalogTable(pool);

    const idVal = parseInt(id, 10);
    if (!idVal) {
        const err = new Error("Vehicle list entry id is required.");
        err.status = 400;
        throw err;
    }

    const { name, empId } = extractUserDetails(user);
    const now = new Date();

    await pool.execute(
        "UPDATE VehicleCatalog SET isDeleted = 1, deletedAt = ?, deletedBy = ?, deletedById = ?, updatedAt = ? WHERE id = ?",
        [now, name, empId, now, idVal]
    );

    return { id: idVal };
};