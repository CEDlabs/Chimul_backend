const { connectDB, sql } = require("../config/db");
const AuditLog = require("./auditLogModel");

async function ensureTaluksTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS Taluks (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                name VARCHAR(100) NOT NULL UNIQUE,
                description VARCHAR(255) NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                updatedAt DATETIME DEFAULT ${sql.now()},
                isDeleted TINYINT(1) DEFAULT 0,
                deletedAt DATETIME NULL,
                deletedBy VARCHAR(100) NULL,
                deletedById VARCHAR(50) NULL,
                INDEX idx_taluks_name (name)
            )
        `);
    } catch (e) {
        console.warn("[Taluks] Table creation warning:", e.message);
    }
}

// Junction of taluk -> routes. Holds every assigned route regardless of whether
// the route exists in the Management Routes master, so any lab route can be
// linked to a taluk. Mirrors to Routes.taluk when a master row exists.
async function ensureTalukRoutesTable(pool) {
    try {
        await pool.execute(`
            CREATE TABLE IF NOT EXISTS TalukRoutes (
                id INT ${sql.autoIncrement} PRIMARY KEY,
                talukName VARCHAR(100) NOT NULL,
                routeName VARCHAR(100) NOT NULL,
                createdAt DATETIME DEFAULT ${sql.now()},
                UNIQUE KEY uq_taluk_route (talukName, routeName),
                INDEX idx_talukroutes_route (routeName),
                INDEX idx_talukroutes_taluk (talukName)
            )
        `);
    } catch (e) {
        console.warn("[TalukRoutes] Table creation warning:", e.message);
    }
}

const normalizeRow = (row) => {
    if (!row) return null;
    return {
        ...row,
        createdAt: row.createdAt ? String(row.createdAt).slice(0, 19).replace("T", " ") : null,
        updatedAt: row.updatedAt ? String(row.updatedAt).slice(0, 19).replace("T", " ") : null,
        routeCount: row.routeCount !== undefined ? Number(row.routeCount) || 0 : undefined,
    };
};

exports.getAll = async () => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);
    await ensureTalukRoutesTable(pool);

    const rows = await pool.execute(
        `SELECT t.*
         FROM Taluks t
         WHERE (t.isDeleted IS NULL OR t.isDeleted = 0)
         ORDER BY t.name ASC`
    );

    const routeCounts = new Map();
    const countRows = await pool.execute(
        `SELECT LOWER(TRIM(talukName)) AS talukKey, COUNT(*) AS cnt
         FROM TalukRoutes
         GROUP BY talukKey`
    ).catch(() => []);
    for (const cr of countRows || []) {
        routeCounts.set(cr.talukKey, Number(cr.cnt) || 0);
    }

    return rows.map((row) => ({
        ...normalizeRow(row),
        routeCount: routeCounts.get(String(row.name || "").trim().toLowerCase()) || 0,
    }));
};

exports.findByName = async (name) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);

    const n = String(name || "").trim();
    if (!n) return null;

    const rows = await pool.execute(
        `SELECT * FROM Taluks
         WHERE LOWER(TRIM(name)) = LOWER(TRIM(?)) AND (isDeleted IS NULL OR isDeleted = 0)
         LIMIT 1`,
        [n]
    );
    return normalizeRow(rows[0]);
};

exports.create = async (data, user = null) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);

    const name = String(data.name || "").trim();
    const description = String(data.description || "").trim();

    if (!name) throw new Error("Taluk name is required.");

    const existing = await exports.findByName(name);
    if (existing) {
        throw new Error(`Taluk "${name}" already exists.`);
    }

    await pool.execute(
        `INSERT INTO Taluks (name, description, createdAt, updatedAt)
         VALUES (?, ?, ${sql.now()}, ${sql.now()})`,
        [name, description || null]
    );

    return await exports.findByName(name);
};

exports.update = async (id, data, user = null) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);
    await ensureTalukRoutesTable(pool);

    const talukId = parseInt(id, 10);
    if (isNaN(talukId)) throw new Error("Invalid taluk ID.");

    const existingRows = await pool.execute(
        "SELECT * FROM Taluks WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [talukId]
    );
    if (!existingRows || existingRows.length === 0) {
        throw new Error("Taluk not found or already deleted.");
    }

    const existing = existingRows[0];
    const oldName = String(existing.name || "").trim();
    const name = data.name !== undefined ? String(data.name).trim() : oldName;
    const description = data.description !== undefined ? String(data.description).trim() : existing.description;

    if (!name) throw new Error("Taluk name cannot be empty.");

    const lower = (s) => String(s || "").trim().toLowerCase();

    if (lower(oldName) !== lower(name)) {
        const duplicate = await exports.findByName(name);
        if (duplicate && duplicate.id !== talukId) {
            throw new Error(`Taluk "${name}" already exists.`);
        }
    }

    await pool.execute(
        `UPDATE Taluks SET name = ?, description = ?, updatedAt = ${sql.now()} WHERE id = ?`,
        [name, description || null, talukId]
    );

    // Keep route assignments in sync when the taluk is renamed.
    if (lower(oldName) !== lower(name)) {
        await pool.execute(
            "UPDATE TalukRoutes SET talukName = ? WHERE LOWER(TRIM(talukName)) = LOWER(TRIM(?))",
            [name, oldName]
        ).catch(() => {});
        await pool.execute(
            `UPDATE Routes SET taluk = ?, updatedAt = ${sql.now()} WHERE taluk IS NOT NULL AND LOWER(TRIM(taluk)) = LOWER(TRIM(?))`,
            [name, oldName]
        ).catch(() => {});
    }

    return await exports.findByName(name);
};

exports.assignRoutes = async (talukName, routeNames = [], user = null) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);
    await ensureTalukRoutesTable(pool);

    const name = String(talukName || "").trim();
    if (!name) throw new Error("Taluk name is required.");

    const taluk = await exports.findByName(name);
    if (!taluk) throw new Error(`Taluk "${name}" does not exist.`);

    const seen = new Set();
    const routes = (Array.isArray(routeNames) ? routeNames : [])
        .map((r) => String(r || "").trim().toUpperCase())
        .filter((r) => r && !seen.has(r) && (seen.add(r), true));

    const conn = await pool.getConnection();
    try {
        await conn.beginTransaction();

        // Replace the whole route set for this taluk.
        await conn.execute("DELETE FROM TalukRoutes WHERE LOWER(TRIM(talukName)) = LOWER(TRIM(?))", [name]);

        if (routes.length > 0) {
            const values = routes.map(() => "(?, ?)").join(", ");
            const params = [];
            for (const route of routes) {
                params.push(name, route);
            }
            await conn.execute(
                `INSERT INTO TalukRoutes (talukName, routeName) VALUES ${values}`,
                params
            );
        }

        await conn.commit();
    } catch (err) {
        await conn.rollback().catch(() => {});
        throw err;
    } finally {
        conn.release();
    }

    // Mirror to the Management Routes master so any existing row picks the link up too.
    if (routes.length > 0) {
        await pool.execute(
            `UPDATE Routes SET taluk = ?, updatedAt = ${sql.now()} WHERE (isDeleted IS NULL OR isDeleted = 0) AND UPPER(routeName) IN (${routes.map(() => "?").join(",")})`,
            [name, ...routes]
        ).catch(() => {});
        await pool.execute(
            `UPDATE Routes SET taluk = NULL, updatedAt = ${sql.now()} WHERE LOWER(TRIM(taluk)) = LOWER(TRIM(?)) AND UPPER(routeName) NOT IN (${routes.map(() => "?").join(",")})`,
            [name, ...routes]
        ).catch(() => {});
    } else {
        await pool.execute(
            `UPDATE Routes SET taluk = NULL, updatedAt = ${sql.now()} WHERE LOWER(TRIM(taluk)) = LOWER(TRIM(?))`,
            [name]
        ).catch(() => {});
    }

    return exports.getRoutesByTaluk(name);
};

exports.getRoutesByTaluk = async (talukName) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);
    await ensureTalukRoutesTable(pool);

    const name = String(talukName || "").trim();
    if (!name) return [];

    const rows = await pool.execute(
        `SELECT routeName FROM TalukRoutes
         WHERE LOWER(TRIM(talukName)) = LOWER(TRIM(?))
         ORDER BY LENGTH(routeName) ASC, routeName ASC`,
        [name]
    );
    return rows.map((r) => r.routeName);
};

exports.remove = async (id, user = null, ipAddress = null) => {
    const pool = await connectDB();
    await ensureTaluksTable(pool);
    await ensureTalukRoutesTable(pool);

    const talukId = parseInt(id, 10);
    if (isNaN(talukId)) throw new Error("Invalid taluk ID.");

    const existingRows = await pool.execute(
        "SELECT * FROM Taluks WHERE id = ? AND (isDeleted IS NULL OR isDeleted = 0)",
        [talukId]
    );
    if (!existingRows || existingRows.length === 0) {
        throw new Error("Taluk not found or already deleted.");
    }

    const record = existingRows[0];
    const name = String(record.name || "").trim();

    try {
        await AuditLog.create({
            module: "TalukMaster",
            action: "DELETE",
            recordId: String(record.id),
            recordData: { id: record.id, name: record.name, description: record.description },
            user,
            ipAddress,
        });
    } catch (_) {}

    // Unassign routes that belong to this taluk.
    await pool.execute(
        "DELETE FROM TalukRoutes WHERE LOWER(TRIM(talukName)) = LOWER(TRIM(?))",
        [name]
    ).catch(() => {});
    await pool.execute(
        "UPDATE Routes SET taluk = NULL WHERE LOWER(TRIM(taluk)) = LOWER(TRIM(?))",
        [name]
    ).catch(() => {});

    const userName = user?.employeeName || user?.name || null;
    const userId = user?.employeeId || user?.id || null;

    await pool.execute(
        `UPDATE Taluks SET
            isDeleted = 1,
            deletedAt = ${sql.now()},
            deletedBy = ?,
            deletedById = ?
         WHERE id = ?`,
        [userName, userId ? String(userId) : null, talukId]
    );

    return true;
};