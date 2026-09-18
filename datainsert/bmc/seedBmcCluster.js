/**
 * Seed BMCs and Clusters from SQL file.
 *
 * Usage:
 *   node datainsert/bmc/seedBmcCluster.js
 *
 * Reads seedBmcCluster.sql and executes all INSERT statements.
 * BMC inserts use subqueries to look up routeName from Routes table.
 * Cluster inserts use subqueries to get bmcId from BMCs table.
 * Safe to re-run: uses INSERT IGNORE.
 */

const fs = require("fs");
const path = require("path");
const { connectDB } = require("../../config/db");

const SQL_FILE = path.resolve(__dirname, "seedBmcCluster.sql");

const run = async () => {
    console.log("Reading:", SQL_FILE);
    const sqlText = fs.readFileSync(SQL_FILE, "utf-8");

    const lines = sqlText.split(/\r?\n/);
    const cleaned = lines
        .map((line) => line.replace(/--.*$/, "").trim())
        .filter((line) => line.length > 0)
        .join("\n");

    const statements = cleaned
        .split(/;\s*\n/)
        .map((s) => s.trim())
        .filter((s) => s.length > 0);

    console.log(`Found ${statements.length} SQL statements`);

    const pool = await connectDB();
    let inserted = 0;
    let skipped = 0;
    let errors = 0;

    for (const stmt of statements) {
        const sql = stmt.endsWith(";") ? stmt : stmt + ";";
        try {
            await pool.execute(sql);
            inserted++;
        } catch (err) {
            if (/ER_DUP_ENTRY|ER_DUP_KEYNAME|Duplicate entry|UNIQUE|already exists/i.test(err.message)) {
                skipped++;
            } else {
                console.error(`  ERROR: ${err.message}`);
                errors++;
            }
        }
    }

    console.log(`\nDone. Executed: ${inserted}, Skipped: ${skipped}, Errors: ${errors}`);
    setTimeout(() => process.exit(errors > 0 ? 1 : 0), 1000);
};

run().catch((err) => {
    console.error("Fatal error:", err.message);
    process.exit(1);
});
