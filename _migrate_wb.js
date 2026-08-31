require("dotenv").config();
const mysql = require("mysql2/promise");

const cfg = {
  host: process.env.DB_HOST || "localhost",
  port: parseInt(process.env.DB_PORT, 10) || 3306,
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "123456",
  database: process.env.DB_NAME || "chimul_md",
};

const cols = [
  { col: "initialWeightAt", def: "DATETIME NULL" },
  { col: "intermediateWeight1At", def: "DATETIME NULL" },
  { col: "intermediateWeight2At", def: "DATETIME NULL" },
  { col: "intermediateWeight3At", def: "DATETIME NULL" },
  { col: "tareWeightAt", def: "DATETIME NULL" },
  { col: "initialWeightMode", def: "VARCHAR(20) NULL" },
  { col: "intermediateWeight1Mode", def: "VARCHAR(20) NULL" },
  { col: "intermediateWeight2Mode", def: "VARCHAR(20) NULL" },
  { col: "intermediateWeight3Mode", def: "VARCHAR(20) NULL" },
  { col: "tareWeightMode", def: "VARCHAR(20) NULL" },
];

(async () => {
  const connection = await mysql.createConnection(cfg);
  for (const { col, def } of cols) {
    const [r] = await connection.execute(
      "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='WeighBridgeEntries' AND COLUMN_NAME=?",
      [col]
    );
    if (r.length === 0) {
      await connection.execute("ALTER TABLE WeighBridgeEntries ADD " + col + " " + def);
      console.log("ADDED", col);
    } else {
      console.log("exists", col);
    }
  }
  const [check] = await connection.execute(
    "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='WeighBridgeEntries' ORDER BY ORDINAL_POSITION"
  );
  console.log("----FINAL----");
  console.log(check.map((x) => x.COLUMN_NAME).join("\n"));
  await connection.end();
})().catch((e) => { console.error("ERR", e.message); process.exit(1); });
