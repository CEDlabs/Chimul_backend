const { connectDB, sql, DB_TYPE } = require("../config/db");
const Notifications = require("./notificationModel");

const ensureTables = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SiloFulfillments (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            productRequestId INT NOT NULL,
            siloId INT NOT NULL,
            quantityDumped DECIMAL(12,3) NOT NULL,
            resultingFat DECIMAL(8,3) NOT NULL,
            resultingSnf DECIMAL(8,3) NOT NULL,
            notes LONGTEXT NULL,
            fulfilledById VARCHAR(50) NULL,
            fulfilledByName VARCHAR(150) NULL,
            fulfilledAt DATETIME NOT NULL DEFAULT ${sql.now()},
            INDEX idx_fulfillment_request (productRequestId),
            INDEX idx_fulfillment_silo (siloId)
        )
    `);
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN notes LONGTEXT NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkQuantity DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkClr DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkFat DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkSnf DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkKgFat DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN milkKgSnf DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveQuantity DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveClr DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveFat DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveSnf DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveKgFat DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN additiveKgSnf DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN totalKgFat DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN totalKgSnf DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN startTime DATETIME NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillments ADD COLUMN endTime DATETIME NULL"); } catch {}

    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SiloFulfillmentSources (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            fulfillmentId INT NOT NULL,
            tankId INT NOT NULL,
            quantity DECIMAL(12,3) NOT NULL,
            INDEX idx_source_fulfillment (fulfillmentId),
            INDEX idx_source_tank (tankId)
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS SiloFulfillmentAdditives (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            fulfillmentId INT NOT NULL,
            additiveType VARCHAR(80) NOT NULL,
            quantity DECIMAL(12,3) NOT NULL,
            unit VARCHAR(20) NOT NULL DEFAULT 'kg',
            INDEX idx_additive_fulfillment (fulfillmentId)
        )
    `);
    try { await pool.execute("ALTER TABLE SiloFulfillmentAdditives ADD COLUMN clr DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillmentAdditives ADD COLUMN fat DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillmentAdditives ADD COLUMN snf DECIMAL(8,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillmentAdditives ADD COLUMN kgFat DECIMAL(12,3) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE SiloFulfillmentAdditives ADD COLUMN kgSnf DECIMAL(12,3) NULL"); } catch {}
};

const positive = (value, field) => {
    const n = Number(value);
    if (!Number.isFinite(n) || n <= 0) throw new Error(`${field} must be greater than zero.`);
    return n;
};
const lockSuffix = DB_TYPE === "mysql" ? " FOR UPDATE" : "";

exports.fulfill = async ({
    productRequestId,
    siloId,
    sources,
    additives = [],
    resultingFat,
    resultingSnf,
    notes,
    milkQuantity,
    milkClr,
    milkFat,
    milkSnf,
    milkKgFat,
    milkKgSnf,
    additiveQuantity,
    additiveClr,
    additiveFat,
    additiveSnf,
    additiveKgFat,
    additiveKgSnf,
    totalQuantity,
    totalKgFat,
    totalKgSnf,
}, user) => {
    const pool = await connectDB();
    await ensureTables(pool);
    if (!Array.isArray(sources) || !sources.length) throw new Error("At least one source tank is required.");
    const cleanSources = sources.map((source) => ({ tankId: Number(source.tankId), quantity: positive(source.quantity, "Source quantity") }));
    const totalMilk = cleanSources.reduce((sum, source) => sum + source.quantity, 0);
    const fat = Number(resultingFat), snf = Number(resultingSnf);
    if (!Number.isFinite(fat) || fat < 0 || fat > 100 || !Number.isFinite(snf) || snf < 0 || snf > 100) throw new Error("Resulting fat and SNF must be between 0 and 100.");
    
    const combinedTotal = Number(totalQuantity) > 0 ? Number(totalQuantity) : totalMilk;

    const conn = await pool.getConnection();
    try {
        const requests = await conn.execute(`SELECT * FROM ProductRequests WHERE id = ?${lockSuffix}`, [productRequestId]);
        if (!requests.length) throw new Error("Product request not found.");
        const request = requests[0];
        if (["fulfilled", "cancelled"].includes(request.status)) throw new Error("This request is no longer open.");
        const remaining = Number(request.requestedQuantity) - Number(request.fulfilledQuantity || 0);
        if (combinedTotal > remaining + 0.01) throw new Error("Fulfillment exceeds the remaining request quantity.");
        const silos = await conn.execute(`SELECT * FROM StorageSilos WHERE id = ?${lockSuffix}`, [siloId]);
        if (!silos.length) throw new Error("Silo not found.");
        const silo = silos[0];
        if (silo.status !== "active") throw new Error("Silo is not active.");
        if (Number(silo.currentQuantity) + combinedTotal > Number(silo.capacity)) throw new Error("Fulfillment would exceed silo capacity.");
        for (const source of cleanSources) {
            const tanks = await conn.execute(`SELECT * FROM StorageTanks WHERE id = ?${lockSuffix}`, [source.tankId]);
            if (!tanks.length) throw new Error(`Source tank ${source.tankId} not found.`);
            if (tanks[0].status !== "active") throw new Error(`Source tank ${source.tankId} is not active.`);
            if (Number(tanks[0].currentQuantity) < source.quantity) throw new Error(`Source tank ${source.tankId} does not contain enough milk.`);
        }
        const [userId, userName] = [user?.id || user?.employeeId || null, user?.employeeName || null];
        const insertResult = await conn.execute(
            `INSERT INTO SiloFulfillments (
                productRequestId, siloId, quantityDumped, resultingFat, resultingSnf, notes,
                fulfilledById, fulfilledByName,
                milkQuantity, milkClr, milkFat, milkSnf, milkKgFat, milkKgSnf,
                additiveQuantity, additiveClr, additiveFat, additiveSnf, additiveKgFat, additiveKgSnf,
                totalQuantity, totalKgFat, totalKgSnf,
                startTime, endTime
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                productRequestId,
                siloId,
                combinedTotal,
                fat,
                snf,
                notes || null,
                userId,
                userName,
                milkQuantity !== undefined ? Number(milkQuantity) : totalMilk,
                milkClr !== undefined ? Number(milkClr) : null,
                milkFat !== undefined ? Number(milkFat) : null,
                milkSnf !== undefined ? Number(milkSnf) : null,
                milkKgFat !== undefined ? Number(milkKgFat) : null,
                milkKgSnf !== undefined ? Number(milkKgSnf) : null,
                additiveQuantity !== undefined ? Number(additiveQuantity) : null,
                additiveClr !== undefined ? Number(additiveClr) : null,
                additiveFat !== undefined ? Number(additiveFat) : null,
                additiveSnf !== undefined ? Number(additiveSnf) : null,
                additiveKgFat !== undefined ? Number(additiveKgFat) : null,
                additiveKgSnf !== undefined ? Number(additiveKgSnf) : null,
                combinedTotal,
                totalKgFat !== undefined ? Number(totalKgFat) : null,
                totalKgSnf !== undefined ? Number(totalKgSnf) : null,
                startTime ? new Date(startTime) : null,
                endTime ? new Date(endTime) : null,
            ]
        );
        const fulfillmentId = insertResult.insertId ?? insertResult[0]?.insertId;
        for (const source of cleanSources) {
            await conn.execute("UPDATE StorageTanks SET currentQuantity = currentQuantity - ?, updatedAt = ? WHERE id = ?", [source.quantity, new Date(), source.tankId]);
            await conn.execute("INSERT INTO SiloFulfillmentSources (fulfillmentId, tankId, quantity) VALUES (?, ?, ?)", [fulfillmentId, source.tankId, source.quantity]);
        }
        for (const additive of additives) {
            if (!additive.additiveType || Number(additive.quantity) < 0) throw new Error("Each additive needs a type and non-negative quantity.");
            await conn.execute(
                "INSERT INTO SiloFulfillmentAdditives (fulfillmentId, additiveType, quantity, unit, clr, fat, snf, kgFat, kgSnf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [
                    fulfillmentId,
                    String(additive.additiveType).trim(),
                    Number(additive.quantity),
                    additive.unit || "kg",
                    additive.clr !== undefined ? Number(additive.clr) : null,
                    additive.fat !== undefined ? Number(additive.fat) : null,
                    additive.snf !== undefined ? Number(additive.snf) : null,
                    additive.kgFat !== undefined ? Number(additive.kgFat) : null,
                    additive.kgSnf !== undefined ? Number(additive.kgSnf) : null,
                ]
            );
        }
        const fulfilledQuantity = Number(request.fulfilledQuantity || 0) + combinedTotal;
        const status = fulfilledQuantity >= Number(request.requestedQuantity) ? "fulfilled" : "partially fulfilled";
        await conn.execute(`UPDATE StorageSilos SET currentQuantity = currentQuantity + ?, currentFat = ?, currentSnf = ?, linkedProductRequestId = ?, updatedAt = ${sql.now()} WHERE id = ?`, [combinedTotal, fat, snf, productRequestId, siloId]);
        await conn.execute(`UPDATE ProductRequests SET fulfilledQuantity = ?, status = ?, updatedAt = ${sql.now()} WHERE id = ?`, [fulfilledQuantity, status, productRequestId]);
        await conn.commit();
        try {
            await Notifications.create({ recipientId: request.requestedById, type: "product_request", title: "Product request updated", message: `${request.productName} is ${status}. ${fulfilledQuantity} of ${request.requestedQuantity} kg fulfilled.`, relatedRequestId: productRequestId });
        } catch (notificationError) {
            console.warn("Product fulfillment notification failed:", notificationError.message);
        }
        return { fulfillmentId, productRequestId, siloId, quantityDumped: combinedTotal, status };
    } catch (error) { await conn.rollback(); throw error; }
    finally { conn.release(); }
};

exports.list = async (requestId) => {
    const pool = await connectDB();
    await ensureTables(pool);
    const rows = await pool.execute(
        `SELECT f.*, s.label AS siloLabel
         FROM SiloFulfillments f
         LEFT JOIN StorageSilos s ON s.id = f.siloId
         WHERE f.productRequestId = ?
         ORDER BY f.fulfilledAt DESC, f.id DESC`,
        [requestId]
    );
    for (const row of rows) {
        const sources = await pool.execute(
            `SELECT fs.*, t.label AS tankLabel
             FROM SiloFulfillmentSources fs
             LEFT JOIN StorageTanks t ON t.id = fs.tankId
             WHERE fs.fulfillmentId = ?`,
            [row.id]
        );
        row.sources = sources;
        row.additives = await pool.execute(
            "SELECT * FROM SiloFulfillmentAdditives WHERE fulfillmentId = ?",
            [row.id]
        );
    }
    return rows;
};
