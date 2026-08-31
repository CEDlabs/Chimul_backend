require("dotenv").config();

const DB_TYPE = (process.env.DB_TYPE || "mysql").toLowerCase();

async function testConnection() {
    try {
        if (DB_TYPE === "mysql") {
            const mysql = require("mysql2/promise");
            const conn = await mysql.createConnection({
                host:     process.env.DB_HOST,
                port:     parseInt(process.env.DB_PORT, 10) || 3306,
                user:     process.env.DB_MYSQL_USER || process.env.DB_USER,
                password: process.env.DB_MYSQL_PASSWORD || process.env.DB_PASSWORD,
                database: process.env.DB_NAME,
            });
            const [rows] = await conn.execute("SELECT 1 AS result");
            console.log("✅ MySQL Connected Successfully");
            console.log("Test:", rows);
            await conn.end();
        } else {
            const sql = require("mssql");
            await sql.connect({
                server:   process.env.DB_SERVER || "localhost",
                port:     parseInt(process.env.DB_MSSQL_PORT, 10) || parseInt(process.env.DB_PORT, 10) || 1433,
                user:     process.env.DB_MSSQL_USER || process.env.DB_USER,
                password: process.env.DB_MSSQL_PASSWORD || process.env.DB_PASSWORD,
                database: process.env.DB_NAME,
                options:  { encrypt: false, trustServerCertificate: true },
            });
            const result = await sql.query`SELECT 1 AS result`;
            console.log("✅ SQL Server Connected Successfully");
            console.log("Test:", result.recordset);
            await sql.close();
        }
        process.exit(0);
    } catch (err) {
        console.error("❌ Connection Failed:", err.message);
        process.exit(1);
    }
}

testConnection();
