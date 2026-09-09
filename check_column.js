const mysql = require('mysql2/promise');
async function checkColumn() {
  const conn = await mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'chimul_db1'
  });
  const [rows] = await conn.execute('SHOW COLUMNS FROM GateEntries LIKE "entryDt"');
  console.log('entryDt column:', JSON.stringify(rows, null, 2));
  await conn.end();
}
checkColumn();