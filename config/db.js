require("dotenv").config();

const DB_TYPE = (process.env.DB_TYPE || "mysql").toLowerCase();

let pool = null;

/* =========================================================
   SQL DIALECT HELPERS
   Use in model files for database-compatible SQL.
   e.g.  createdAt DATETIME DEFAULT ${sql.now()}
   ========================================================= */
const sqlHelpers = {
    autoIncrement: DB_TYPE === "mssql" ? "IDENTITY(1,1)" : "AUTO_INCREMENT",
    longText:      DB_TYPE === "mssql" ? "NVARCHAR(MAX)" : "LONGTEXT",
    now:      () => DB_TYPE === "mssql" ? "GETDATE()"  : "NOW()",
    curdate:  () => DB_TYPE === "mssql" ? "CAST(GETDATE() AS DATE)" : "CURDATE()",
    date:     (col) => DB_TYPE === "mssql" ? `CAST(${col} AS DATE)` : `DATE(${col})`,
    dateFormat: (col, fmt) => DB_TYPE === "mssql"
        ? `CONVERT(VARCHAR(10), ${col}, 23)`
        : `DATE_FORMAT(${col}, '${fmt}')`,
    trim: (col) => DB_TYPE === "mssql" ? `LTRIM(RTRIM(${col}))` : `TRIM(${col})`,
};

/* =========================================================
   ADAPT SQL  – converts MySQL-style SQL → MSSQL on the fly
   (no-op when DB_TYPE is mysql)
   ========================================================= */
function adaptSQL(query) {
    if (DB_TYPE === "mysql") return query;

    let r = query;

    /* 1. ? → @p0 @p1 … */
    let pi = 0;
    r = r.replace(/\?/g, () => `@p${pi++}`);

    /* 2. CREATE TABLE IF NOT EXISTS → IF NOT EXISTS … BEGIN … END */
    if (/\bCREATE\s+TABLE\s+IF\s+NOT\s+EXISTS\b/i.test(r)) {
        r = r.replace(
            /\bCREATE\s+TABLE\s+IF\s+NOT\s+EXISTS\s+(\w+)\s*\(/gi,
            (_m, t) => `IF NOT EXISTS (SELECT * FROM sys.tables WHERE name='${t}') BEGIN CREATE TABLE ${t} (`
        );
        const last = r.lastIndexOf(");");
        if (last >= 0) r = r.substring(0, last + 1) + " END;" + r.substring(last + 2);
    }

    /* 3. AUTO_INCREMENT → IDENTITY(1,1) */
    r = r.replace(/\bAUTO_INCREMENT\b/gi, "IDENTITY(1,1)");

    /* 4. LONGTEXT → NVARCHAR(MAX) */
    r = r.replace(/\bLONGTEXT\b/gi, "NVARCHAR(MAX)");

    /* 5. NOW() → GETDATE() */
    r = r.replace(/\bNOW\(\)/gi, "GETDATE()");

    /* 6. CURDATE() → CAST(GETDATE() AS DATE) */
    r = r.replace(/\bCURDATE\(\)/gi, "CAST(GETDATE() AS DATE)");

    /* 7. DATE(col) → CAST(col AS DATE) */
    r = r.replace(/\bDATE\(([^)]+)\)/gi, "CAST($1 AS DATE)");

    /* 8. DATE_FORMAT(col,'…') → CONVERT(VARCHAR(10),col,23) */
    r = r.replace(/DATE_FORMAT\(([^,]+),\s*'[^']+'\)/gi, "CONVERT(VARCHAR(10), $1, 23)");

    /* 9. TRIM(col) → LTRIM(RTRIM(col)) */
    r = r.replace(/\bTRIM\(([^)]+)\)/gi, "LTRIM(RTRIM($1))");

    /* 10. LIMIT N → TOP(N) after the nearest SELECT */
    let off = 0;
    while (true) {
        const lr = /\bLIMIT\s+(\d+)/gi;
        lr.lastIndex = off;
        const lm = lr.exec(r);
        if (!lm) break;
        const lp = lm.index, n = lm[1], le = lp + lm[0].length;
        const before = r.substring(0, lp);
        const sr = /\bSELECT\b/gi;
        let lsp = -1, m;
        while ((m = sr.exec(before)) !== null) lsp = m.index;
        if (lsp >= 0) {
            r = r.substring(0, lp) + r.substring(le);
            const se = lsp + 6;
            r = r.substring(0, se) + ` TOP(${n})` + r.substring(se);
            off = se + ` TOP(${n})`.length;
        } else {
            off = le;
        }
    }

    return r;
}

/* =========================================================
   CONNECT DATABASE – returns a pool-like object with a
   unified .execute(query, params) and .getConnection()
   API that is identical for MySQL and MSSQL.
   ========================================================= */
const connectDB = async () => {
    if (pool) return pool;

    if (DB_TYPE === "mysql") {
        const mysql = require("mysql2/promise");
        const raw = await mysql.createPool({
            host:               process.env.DB_HOST,
            port:               parseInt(process.env.DB_PORT, 10) || 3306,
            user:               process.env.DB_MYSQL_USER || process.env.DB_USER,
            password:           process.env.DB_MYSQL_PASSWORD || process.env.DB_PASSWORD,
            database:           process.env.DB_NAME,
            waitForConnections: true,
            connectionLimit:    20,
            queueLimit:         0,
            timezone:           "+00:00",
        });

        pool = {
            execute: async (query, params = []) => {
                const [rows] = await raw.execute(query, params);
                return rows;
            },
            getConnection: async () => {
                const conn = await raw.getConnection();
                return {
                    execute: async (query, params = []) => {
                        const [rows] = await conn.execute(query, params);
                        return rows;
                    },
                    beginTransaction: () => conn.beginTransaction(),
                    commit:           () => conn.commit(),
                    rollback:         () => conn.rollback(),
                    release:          () => conn.release(),
                };
            },
        };

        console.log("✅ Connected to MySQL");
    } else {
        const sql = require("mssql");
        const raw = await sql.connect({
            user:     process.env.DB_MSSQL_USER || process.env.DB_USER,
            password: process.env.DB_MSSQL_PASSWORD || process.env.DB_PASSWORD,
            server:   process.env.DB_SERVER || "localhost",
            port:     parseInt(process.env.DB_MSSQL_PORT, 10) || parseInt(process.env.DB_PORT, 10) || 1433,
            database: process.env.DB_NAME,
            options:  { encrypt: false, trustServerCertificate: true },
            pool:     { max: 10, min: 0, idleTimeoutMillis: 30000 },
        });

        pool = {
            execute: async (query, params = []) => {
                const req = raw.request();
                params.forEach((v, i) => {
                    if (v instanceof Date) {
                        req.input(`p${i}`, sql.NVarChar, v.toISOString().replace('Z',''));
                    } else {
                        req.input(`p${i}`, sql.NVarChar, v != null ? String(v) : null);
                    }
                });
                const res = await req.query(adaptSQL(query));
                return res.recordset;
            },
            getConnection: async () => {
                const txn = new sql.Transaction(raw);
                await txn.begin();
                return {
                    execute: async (query, params = []) => {
                        const req = txn.request();
                        params.forEach((v, i) => {
                            if (v instanceof Date) {
                                req.input(`p${i}`, sql.NVarChar, v.toISOString().replace('Z',''));
                            } else {
                                req.input(`p${i}`, sql.NVarChar, v != null ? String(v) : null);
                            }
                        });
                        const res = await req.query(adaptSQL(query));
                        return res.recordset;
                    },
                    beginTransaction: () => Promise.resolve(),
                    commit:           () => txn.commit(),
                    rollback:         () => txn.rollback(),
                    release:          () => Promise.resolve(),
                };
            },
        };

        console.log("✅ Connected to SQL Server");
    }

    return pool;
};

module.exports = { connectDB, sql: sqlHelpers, DB_TYPE };
