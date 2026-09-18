/**
 * Seed Vehicle Catalog data into the database.
 *
 * Usage:
 *   node datainsert/vehicleList/seedVehicleCatalog.js
 *
 * Reads the adjacent seedVehicleCatalog.sql and executes it against the
 * configured database. Safe to run multiple times – uses INSERT IGNORE
 * so existing vehicle numbers are skipped.
 */

const fs = require("fs");
const path = require("path");
const { connectDB } = require("../../config/db");

const SQL_FILE = path.resolve(__dirname, "seedVehicleCatalog.sql");

const run = async () => {
    const sqlText = fs.readFileSync(SQL_FILE, "utf-8");

    // Strip comment lines, then split on semicolons
    const lines = sqlText.split(/\r?\n/);
    const cleaned = lines
        .map((line) => line.replace(/--.*$/, "").trim())
        .filter((line) => line.length > 0)
        .join("\n");

    const statements = cleaned
        .split(/;\s*\n/)
        .map((s) => s.trim())
        .filter((s) => s.length > 0);

    if (statements.length === 0) {
        console.log("No SQL statements found in", SQL_FILE);
        process.exit(1);
    }

    console.log(`Found ${statements.length} statement(s) in ${path.basename(SQL_FILE)}`);

    const pool = await connectDB();
    let inserted = 0;
    let errors = 0;

    for (const stmt of statements) {
        const sql = stmt.endsWith(";") ? stmt : stmt + ";";
        try {
            await pool.execute(sql);
            inserted++;
            console.log(`  OK  ${sql.slice(0, 80).replace(/\s+/g, " ")}…`);
        } catch (err) {
            if (/ER_DUP_ENTRY|ER_DUP_KEYNAME|Duplicate entry|UNIQUE|already exists/i.test(err.message)) {
                console.log(`  SKIP ${sql.slice(0, 60).replace(/\s+/g, " ")}…`);
            } else {
                console.error(`  ERROR: ${err.message}`);
                errors++;
            }
        }
    }

    console.log(`\nDone. Executed: ${inserted}, Errors: ${errors}`);
    setTimeout(() => process.exit(errors > 0 ? 1 : 0), 1000);
};

run().catch((err) => {
    console.error("Fatal error:", err.message);
    process.exit(1);
});
