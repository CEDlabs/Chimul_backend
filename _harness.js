const jwt = require("jsonwebtoken");
const { connectDB } = require("./config/db");
const { getJwtSecret } = require("./config/security");
(async () => {
  const db = await connectDB();
  let emp = await db.execute("SELECT id, employee_id, employee_name, email, department, role, is_department_admin, session_version FROM employees WHERE email = ?", ["md@gmail.com"]);
  emp = emp[0];
  const token = jwt.sign({ id: emp.id, sessionVersion: emp.session_version }, getJwtSecret(), { expiresIn: "1h" });
  const now = new Date(); now.setHours(now.getHours() + 1);
  await db.execute(
    "INSERT INTO Sessions (userId, employeeId, employeeName, email, department, role, isDepartmentAdmin, token, expiresAt) VALUES (?,?,?,?,?,?,?,?,?)",
    [emp.id, emp.employee_id, emp.employee_name, emp.email, emp.department, emp.role, emp.is_department_admin || 0, token, now.toISOString().slice(0,19).replace("T"," ")]
  );
  const cookie = "auth_token=" + token;
  const test = (label, path) => fetch("http://localhost:5000" + path, { headers: { cookie, "x-tab-id": "testtab" } })
    .then(async (r) => { let b = null; try { b = await r.json(); } catch (e) {} console.log(label, r.status, JSON.stringify(b).slice(0, 250)); })
    .catch((e) => console.log(label, "FETCH ERR", e.message));
  await test("5000 GET /clusters          ", "/api/milk-collection/clusters");
  await test("5000 GET /clusters/route/7B ", "/api/milk-collection/clusters/route/7B");
  await test("5000 GET /bmcs/route/7B     ", "/api/milk-collection/bmcs/route/7B");
  await db.execute("DELETE FROM Sessions WHERE userId = ? AND token = ?", [emp.id, token]);
  process.exit(0);
})();
