const { connectDB, sql } = require("../config/db");

async function ensureRouteAlternativeTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS RouteAlternativeVehicles (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                routeName VARCHAR(50) NOT NULL,
                primaryVehicleNumber VARCHAR(20) NOT NULL,
                alternativeVehicleNumber VARCHAR(20) NOT NULL,
                fromDate DATE NOT NULL,
                toDate DATE NOT NULL,
                remarks VARCHAR(255) NULL,
                approvalCopy LONGTEXT NULL,
                createdByName VARCHAR(100) NULL,
                createdByEmpId VARCHAR(50) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                isDeleted TINYINT(1) DEFAULT 0,
                INDEX idx_alt_route_dates (routeName, fromDate, toDate)
            )
        `);
    } catch (e) {
        console.warn("[RouteAlternatives] Table creation warning:", e.message);
    }
}

const toDateOnly = (v) => {
    if (!v) return null;
    return String(v).slice(0, 10);
};

const extractUserDetails = (user) => {
    let name = null;
    let empId = null;

    if (user && typeof user === "object") {
        name = user.employeeName || user.name || null;
        empId = user.employeeId || user.id || null;
    } else if (typeof user === "string" && user.trim()) {
        name = user.trim();
    }

    return { name, empId };
};

const normalizeAltRow = (row) => {
    if (!row) return null;
    row.fromDate = toDateOnly(row.fromDate);
    row.toDate = toDateOnly(row.toDate);
    return row;
};

exports.getAll = async () => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const rows = await pool.execute(
        `SELECT * FROM RouteAlternativeVehicles
         WHERE (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY fromDate DESC, id DESC`
    );
    return rows.map(normalizeAltRow);
};

exports.getActiveForDate = async (date) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const targetDate = toDateOnly(date) || new Date().toISOString().slice(0, 10);
    const rows = await pool.execute(
        `SELECT * FROM RouteAlternativeVehicles
         WHERE fromDate <= ? AND toDate >= ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY toDate DESC, id DESC`,
        [targetDate, targetDate]
    );
    return rows.map(normalizeAltRow);
};

exports.findActiveForRoute = async (routeName, date) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const targetDate = toDateOnly(date) || new Date().toISOString().slice(0, 10);
    const rows = await pool.execute(
        `SELECT * FROM RouteAlternativeVehicles
         WHERE routeName = ? AND fromDate <= ? AND toDate >= ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY fromDate DESC, id DESC LIMIT 1`,
        [routeName, targetDate, targetDate]
    );
    return normalizeAltRow(rows[0]);
};

exports.findActiveForVehicle = async (vehicleNumber, date) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const targetDate = toDateOnly(date) || new Date().toISOString().slice(0, 10);
    const rows = await pool.execute(
        `SELECT * FROM RouteAlternativeVehicles
         WHERE (UPPER(primaryVehicleNumber) = UPPER(?) OR UPPER(alternativeVehicleNumber) = UPPER(?))
           AND fromDate <= ? AND toDate >= ?
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY fromDate DESC, id DESC LIMIT 1`,
        [vehicleNumber, vehicleNumber, targetDate, targetDate]
    );
    return normalizeAltRow(rows[0]);
};

// Find any non-deleted alternative window that references this vehicle (as primary
// or alternative), regardless of date. Used to stop a vehicle being reused across
// the Master List and the Route Alternative Vehicle list unless it was deleted.
exports.findByVehicleNumber = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const vNum = String(vehicleNumber || "").trim().toUpperCase();
    if (!vNum) return null;

    const rows = await pool.execute(
        `SELECT id, routeName, primaryVehicleNumber, alternativeVehicleNumber, fromDate, toDate
         FROM RouteAlternativeVehicles
         WHERE (UPPER(primaryVehicleNumber) = UPPER(?) OR UPPER(alternativeVehicleNumber) = UPPER(?))
           AND (isDeleted IS NULL OR isDeleted = 0)
         ORDER BY fromDate DESC, id DESC LIMIT 1`,
        [vNum, vNum]
    );
    return normalizeAltRow(rows[0]);
};

exports.checkOverlap = async (pool, { routeName, primaryVehicleNumber, alternativeVehicleNumber, fromDate, toDate, excludeId }) => {
    const rows = await pool.execute(
        `SELECT id, routeName, primaryVehicleNumber, alternativeVehicleNumber, fromDate, toDate
         FROM RouteAlternativeVehicles
         WHERE routeName = ?
           AND NOT (toDate < ? OR fromDate > ?)
           AND (isDeleted IS NULL OR isDeleted = 0)`,
        [routeName, fromDate, toDate]
    );

    for (const row of rows) {
        if (excludeId && parseInt(row.id, 10) === parseInt(excludeId, 10)) continue;
        const sameVehicle =
            row.primaryVehicleNumber === primaryVehicleNumber ||
            row.alternativeVehicleNumber === alternativeVehicleNumber ||
            row.primaryVehicleNumber === alternativeVehicleNumber ||
            row.alternativeVehicleNumber === primaryVehicleNumber;
        if (sameVehicle) return normalizeAltRow(row);
    }
    return null;
};

exports.create = async (data) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const routeName = (data.routeName || "").trim();
    const primaryVehicleNumber = (data.primaryVehicleNumber || "").toUpperCase().trim();
    const alternativeVehicleNumber = (data.alternativeVehicleNumber || "").toUpperCase().trim();
    const fromDate = toDateOnly(data.fromDate);
    const toDate = toDateOnly(data.toDate);
    const { name, empId } = extractUserDetails(data.createdBy);

    if (!routeName || !primaryVehicleNumber || !alternativeVehicleNumber || !fromDate || !toDate) {
        throw new Error("Route, primary vehicle, alternative vehicle, from date and to date are required.");
    }
    if (fromDate > toDate) {
        throw new Error("From date cannot be after the to date.");
    }
    if (primaryVehicleNumber === alternativeVehicleNumber) {
        throw new Error("Alternative vehicle must be different from the primary vehicle.");
    }

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        const overlap = await exports.checkOverlap(conn, {
            routeName,
            primaryVehicleNumber,
            alternativeVehicleNumber,
            fromDate,
            toDate,
        });

        if (overlap) {
            await conn.rollback();
            const err = new Error(
                `Window for Route ${routeName} overlaps the existing window (${overlap.fromDate} to ${overlap.toDate}, vehicle ${overlap.alternativeVehicleNumber}).`
            );
            err.status = 409;
            throw err;
        }

        const result = await conn.execute(
            `INSERT INTO RouteAlternativeVehicles
             (routeName, primaryVehicleNumber, alternativeVehicleNumber, fromDate, toDate, remarks, approvalCopy, createdByName, createdByEmpId)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                routeName,
                primaryVehicleNumber,
                alternativeVehicleNumber,
                fromDate,
                toDate,
                data.remarks || "",
                data.approvalCopy || null,
                name,
                empId,
            ]
        );
        await conn.commit();

        console.log(`[RouteAlternatives] created window for ${routeName}: ${alternativeVehicleNumber} (${fromDate}..${toDate}) by ${name || "unknown"}`);
        return { id: result.insertId, routeName, primaryVehicleNumber, alternativeVehicleNumber, fromDate, toDate };
    } catch (err) {
        await conn.rollback();
        throw err;
    } finally {
        conn.release();
    }
};

exports.remove = async (id, user = null) => {
    const pool = await connectDB();
    await ensureRouteAlternativeTable(pool);

    const idVal = parseInt(id, 10);
    const now = new Date();
    const { name, empId } = extractUserDetails(user);

    await pool.execute(
        "UPDATE RouteAlternativeVehicles SET isDeleted = 1, updatedAt = ? WHERE id = ?",
        [now, idVal]
    );
    console.log(`[RouteAlternatives] deleted window ${idVal} by ${name || "unknown"}`);
    return { id: idVal };
};