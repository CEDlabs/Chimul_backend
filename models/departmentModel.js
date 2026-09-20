const { connectDB, sql } = require("../config/db");

const ensureTable = async (pool) => {
  await pool.execute(`
        CREATE TABLE IF NOT EXISTS Departments (
            id INT ${sql.autoIncrement} PRIMARY KEY,
            name VARCHAR(150) NOT NULL UNIQUE,
            category VARCHAR(100) NOT NULL DEFAULT 'Main',
            description VARCHAR(500) NULL,
            createdAt DATETIME NOT NULL DEFAULT ${sql.now()},
            updatedAt DATETIME NOT NULL DEFAULT ${sql.now()}
        )
    `);

  // Seed default departments if empty
  try {
    const depts = await pool.execute("SELECT COUNT(*) AS c FROM Departments");
    if (Number(depts[0]?.c || 0) === 0) {
      await pool.execute(`
                INSERT INTO Departments (name, category, description) VALUES
                ('Admin', 'Management', 'System Administrators'),
                ('Management', 'Management', 'Management Level'),
                ('Security', 'Gate Entry', 'Gate Security'),
                ('Stores', 'Stores', 'Main Stores'),
                ('UHT', 'Products', 'UHT Processing'),
                ('Paneer', 'Products', 'Paneer Processing'),
                ('Laboratory', 'Laboratory', 'Quality Control')
            `);
    }
  } catch (err) {
    console.error("Error seeding departments:", err);
  }
};

exports.list = async () => {
  const pool = await connectDB();
  await ensureTable(pool);
  return pool.execute("SELECT * FROM Departments ORDER BY category, name");
};

exports.create = async ({ name, category, description }) => {
  const pool = await connectDB();
  await ensureTable(pool);
  const cleanName = String(name || "").trim();
  const cleanCat = String(category || "Main").trim();
  if (!cleanName) throw new Error("Department name is required.");

  // Check if exists
  const exists = await pool.execute("SELECT id FROM Departments WHERE name = ?", [cleanName]);
  if (exists.length > 0) throw new Error("Department name already exists.");

  await pool.execute(
    "INSERT INTO Departments (name, category, description) VALUES (?, ?, ?)",
    [cleanName, cleanCat, description || null]
  );
  return (await pool.execute("SELECT * FROM Departments WHERE name = ?", [cleanName]))[0];
};

exports.update = async (id, { name, category, description }) => {
  const pool = await connectDB();
  await ensureTable(pool);
  const cleanName = String(name || "").trim();
  if (!cleanName) throw new Error("Department name is required.");

  // Check if exists for another id
  const exists = await pool.execute("SELECT id FROM Departments WHERE name = ? AND id != ?", [cleanName, id]);
  if (exists.length > 0) throw new Error("Department name already exists.");

  await pool.execute(
    `UPDATE Departments SET name = ?, category = ?, description = ?, updatedAt = \${sql.now()} WHERE id = ?`,
    [cleanName, category || "Main", description || null, id]
  );
  return (await pool.execute("SELECT * FROM Departments WHERE id = ?", [id]))[0];
};

exports.remove = async (id) => {
  const pool = await connectDB();
  await ensureTable(pool);
  await pool.execute("DELETE FROM Departments WHERE id = ?", [id]);
  return { success: true };
};
