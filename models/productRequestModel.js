const { connectDB, sql } = require("../config/db");

const ensureTable = async (pool) => {
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS Products (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            name VARCHAR(150) NOT NULL UNIQUE,
            department VARCHAR(100) NULL,
            status VARCHAR(30) NOT NULL DEFAULT 'active',
            createdById VARCHAR(50) NULL,
            createdByName VARCHAR(150) NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()}
        )
    `);
    await pool.execute(`
        CREATE TABLE IF NOT EXISTS ProductRequests (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            productId INT NULL,
            productName VARCHAR(150) NOT NULL,
            department VARCHAR(100) NULL,
            requestedQuantity DECIMAL(12,3) NOT NULL,
            requestedFat DECIMAL(8,3) NOT NULL,
            requestedSnf DECIMAL(8,3) NOT NULL,
            fulfilledQuantity DECIMAL(12,3) NOT NULL DEFAULT 0,
            status VARCHAR(30) NOT NULL DEFAULT 'pending',
            requestedById VARCHAR(50) NULL,
            requestedByName VARCHAR(150) NULL,
            requestedAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()}
        )
    `);
    try { await pool.execute("ALTER TABLE Products ADD COLUMN department VARCHAR(100) NULL"); } catch {}
    try { await pool.execute("ALTER TABLE ProductRequests ADD COLUMN productId INT NULL"); } catch {}
    try { await pool.execute("ALTER TABLE ProductRequests ADD COLUMN department VARCHAR(100) NULL"); } catch {}

    // Seed default products with departments if empty
    try {
        const prods = await pool.execute("SELECT COUNT(*) AS c FROM Products");
        if (Number(prods[0]?.c || 0) === 0) {
            await pool.execute(`
                INSERT INTO Products (name, department, status) VALUES
                ('UHT Milk', 'UHT', 'active'),
                ('Fresh Paneer', 'Paneer', 'active'),
                ('Fluxi Drink', 'Fluxi', 'active'),
                ('Pure Cow Ghee', 'Ghee', 'active'),
                ('Milk Sweets', 'Sweet', 'active')
            `);
        }
    } catch {}
};

const positive = (value, name) => {
    const parsed = Number(value);
    if (!Number.isFinite(parsed) || parsed <= 0) throw new Error(`${name} must be greater than zero.`);
    return parsed;
};

exports.list = async () => {
    const pool = await connectDB();
    await ensureTable(pool);
    return pool.execute("SELECT * FROM ProductRequests ORDER BY requestedAt DESC, id DESC");
};

exports.listProducts = async () => {
    const pool = await connectDB();
    await ensureTable(pool);
    return pool.execute("SELECT * FROM Products ORDER BY department, name");
};

exports.createProduct = async ({ name, department }, user) => {
    const pool = await connectDB();
    await ensureTable(pool);
    const cleanName = String(name || "").trim();
    if (!cleanName) throw new Error("Product name is required.");
    const cleanDept = String(department || "General").trim();
    await pool.execute(
        "INSERT INTO Products (name, department, createdById, createdByName) VALUES (?, ?, ?, ?)",
        [cleanName, cleanDept, user?.id || user?.employeeId || null, user?.employeeName || null]
    );
    return (await pool.execute("SELECT * FROM Products WHERE name = ?", [cleanName]))[0];
};

exports.updateProduct = async (id, { name, department, status }, user) => {
    const pool = await connectDB();
    await ensureTable(pool);
    const cleanName = String(name || "").trim();
    if (!cleanName) throw new Error("Product name is required.");
    await pool.execute(
        `UPDATE Products SET name = ?, department = ?, status = ?, updatedAt = ${sql.now()} WHERE id = ?`,
        [cleanName, department || "General", status || "active", id]
    );
    return (await pool.execute("SELECT * FROM Products WHERE id = ?", [id]))[0];
};

exports.create = async ({ productId, productName, requestedQuantity, requestedFat, requestedSnf }, user) => {
    const pool = await connectDB();
    await ensureTable(pool);
    let name = String(productName || "").trim();
    if (productId) {
        const product = await pool.execute("SELECT id, name FROM Products WHERE id = ? AND status = 'active'", [productId]);
        if (!product.length) throw new Error("Active product not found.");
        name = product[0].name;
    }
    if (!name) throw new Error("Product name is required.");
    const quantity = positive(requestedQuantity, "Requested quantity");
    const fat = positive(requestedFat, "Requested fat");
    const snf = positive(requestedSnf, "Requested SNF");
    await pool.execute(
        `INSERT INTO ProductRequests (productId, productName, requestedQuantity, requestedFat, requestedSnf, requestedById, requestedByName) VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [productId || null, name, quantity, fat, snf, user?.id || user?.employeeId || null, user?.employeeName || null]
    );
    return (await pool.execute("SELECT * FROM ProductRequests ORDER BY id DESC LIMIT 1"))[0];
};

exports.cancel = async (id) => {
    const pool = await connectDB();
    await ensureTable(pool);
    const rows = await pool.execute("SELECT * FROM ProductRequests WHERE id = ?", [id]);
    if (!rows.length) throw new Error("Product request not found.");
    if (["fulfilled", "partially fulfilled"].includes(String(rows[0].status || "").toLowerCase())) {
        throw new Error("Requests that have started filling cannot be cancelled.");
    }
    await pool.execute(`UPDATE ProductRequests SET status = 'cancelled', updatedAt = ${sql.now()} WHERE id = ?`, [id]);
    return (await pool.execute("SELECT * FROM ProductRequests WHERE id = ?", [id]))[0];
};
