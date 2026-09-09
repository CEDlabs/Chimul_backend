const { connectDB } = require("../config/db");
const { ensureSearchIndexes, normalizePlate } = require("../utils/searchIndexes");

async function ensureExitColumnsExist(pool) {
    try {
        const cols1 = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'exitDateTime'"
        );
        if (cols1.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD exitDateTime DATETIME NULL");
        }

        const cols2 = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'exitStatus'"
        );
        if (cols2.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD exitStatus VARCHAR(50) NULL");
        }

        const cols3 = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'VehicleExits' AND COLUMN_NAME = 'exitCheckedById'"
        );
        if (cols3.length === 0) {
            await pool.execute("ALTER TABLE VehicleExits ADD exitCheckedById VARCHAR(50) NULL");
            await pool.execute("ALTER TABLE VehicleExits ADD exitCheckedByEmail VARCHAR(150) NULL");
        }

        const cols4 = await pool.execute(
            "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'GateEntries' AND COLUMN_NAME = 'exitCheckedById'"
        );
        if (cols4.length === 0) {
            await pool.execute("ALTER TABLE GateEntries ADD exitCheckedById VARCHAR(50) NULL");
            await pool.execute("ALTER TABLE GateEntries ADD exitCheckedByEmail VARCHAR(150) NULL");
        }
    } catch (e) {
        console.error("Migration check error for exit columns:", e.message);
    }
}

exports.recordExit = async (data) => {
    const pool = await connectDB();
    await ensureExitColumnsExist(pool);

    const exitDateTime = new Date();

    const lookupResult = await pool.execute(
        `SELECT id, gateEntryId, vehicleNumber, vehicleType, driverName, driverMobile,
                supplierName, materialType, vehicleStatus, entryDateTime, sealNumbers,
                spinnerSet, tyre, jack
         FROM GateEntries
         WHERE vehicleNumber = ?
           AND (exitDateTime IS NULL AND (exitStatus IS NULL OR exitStatus != 'Gate Exited'))
         ORDER BY createdAt DESC, id DESC
         LIMIT 1`,
        [data.vehicleNumber]
    );

    if (!lookupResult || lookupResult.length === 0) {
        throw new Error(`No active gate entry found for vehicle number: ${data.vehicleNumber}`);
    }

    const activeEntry = lookupResult[0];

    try {
        await pool.execute(
            `INSERT INTO VehicleExits (gateEntryId, vehicleNumber, exitDateTime, exitRemarks, exitCheckedBy, exitCheckedById, exitCheckedByEmail)
             VALUES (?, ?, ?, ?, ?, ?, ?)`,
            [
                activeEntry.gateEntryId,
                activeEntry.vehicleNumber,
                exitDateTime,
                data.exitRemarks || "",
                data.exitCheckedBy || "",
                data.exitCheckedById || "",
                data.exitCheckedByEmail || "",
            ]
        );
        console.log(`[VehicleExit] VehicleExits row inserted for gateEntryId: ${activeEntry.gateEntryId}`);
    } catch (veErr) {
        console.warn(`[VehicleExit] VehicleExits INSERT failed: ${veErr.message}`);
    }

    await pool.execute(
        `UPDATE GateEntries
         SET exitStatus = 'Gate Exited',
             exitDateTime = ?,
             exitCheckedBy = ?,
             exitCheckedById = ?,
             exitCheckedByEmail = ?,
             updatedAt = ?
         WHERE gateEntryId = ?`,
        [exitDateTime, data.exitCheckedBy || "", data.exitCheckedById || "", data.exitCheckedByEmail || "", exitDateTime, activeEntry.gateEntryId]
    );

    console.log(`[VehicleExit] GateEntries updated for gateEntryId: ${activeEntry.gateEntryId}`);

    return {
        gateEntryId: activeEntry.gateEntryId,
        vehicleNumber: activeEntry.vehicleNumber,
        vehicleType: activeEntry.vehicleType,
        driverName: activeEntry.driverName,
        supplierName: activeEntry.supplierName,
        materialType: activeEntry.materialType,
        entryDateTime: activeEntry.entryDateTime,
        exitDateTime,
        exitRemarks: data.exitRemarks || "",
        exitCheckedBy: data.exitCheckedBy || "",
        exitCheckedById: data.exitCheckedById || "",
        exitCheckedByEmail: data.exitCheckedByEmail || ""
    };
};

exports.searchActive = async (vehicleNumber) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);

    const result = await pool.execute(
        `SELECT id, gateEntryId, vehicleNumber, vehicleType, driverName, driverMobile,
                supplierName, materialType, vehicleStatus, entryDateTime, createdAt
         FROM GateEntries
         WHERE (vehKey LIKE CONCAT(?, '%') OR UPPER(vehicleNumber) LIKE CONCAT(?, '%'))
           AND (exitDateTime IS NULL AND (exitStatus IS NULL OR exitStatus != 'Gate Exited'))
         ORDER BY createdAt DESC, id DESC
         LIMIT 5`,
        [normalizePlate(vehicleNumber), String(vehicleNumber || "").toUpperCase()]
    );

    return result;
};

exports.getExitRecords = async ({ startDate, endDate, search } = {}) => {
    const pool = await connectDB();
    await ensureSearchIndexes(pool);

    let query = `
        SELECT
            ve.id AS exitId, ve.gateEntryId, ve.vehicleNumber, ve.exitDateTime,
            ve.exitRemarks, ve.exitCheckedBy, ve.createdAt AS exitCreatedAt,
            ge.vehicleType, ge.driverName, ge.driverMobile, ge.supplierName,
            ge.materialType, ge.entryDateTime, ge.vehicleStatus
        FROM VehicleExits ve
        INNER JOIN GateEntries ge ON ve.gateEntryId = ge.gateEntryId
        WHERE 1=1
    `;
    const params = [];

    if (startDate && endDate) {
        query += ` AND (ve.exitDateTime >= ? AND ve.exitDateTime <= ?)`;
        params.push(`${startDate}T00:00:00`, `${endDate}T23:59:59.999`);
    }

    if (search && search.trim()) {
        const term = String(search).trim();
        const key = normalizePlate(term);
        const prefix = term.toUpperCase();
        query += ` AND (ve.vehKey LIKE CONCAT(?, '%') OR ve.gateEntryId LIKE CONCAT(?, '%'))`;
        params.push(key, prefix);
    }

    query += ` ORDER BY ve.exitDateTime DESC, ve.id DESC`;

    const rows = await pool.execute(query, params);
    return rows;
};
