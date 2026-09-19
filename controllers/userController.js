const bcrypt = require("bcryptjs");
const { connectDB } = require("../config/db");
const Session = require("../models/sessionModel");

// Accepts boolean-ish values coming from JSON bodies (true/false, 1/0).
const normalizeFlag = (value) => {
    return value === undefined || value === null
        ? false
        : value === true || value === 1 || value === "1" || value === "true";
};

const VALID_STATUSES = ["pending", "active", "disabled", "rejected"];

exports.listUsers = async (req, res) => {
    try {
        const pool = await connectDB();
        const rows = await pool.execute(
            `SELECT id, employee_id, employee_name, email, phone, department, role,
                    is_department_admin, account_status, created_at
             FROM employees
             ORDER BY id ASC`
        );

        const users = rows.map((u) => ({
            id: u.id,
            employeeId: u.employee_id,
            employeeName: u.employee_name,
            email: u.email,
            phone: u.phone,
            department: u.department,
            role: u.role,
            isDepartmentAdmin: !!Number(u.is_department_admin),
            accountStatus: u.account_status || "active",
            createdAt: u.created_at,
        }));

        return res.json({ success: true, count: users.length, users });
    } catch (err) {
        console.error("List users error:", err);
        return res.status(500).json({ success: false, message: "Failed to load users." });
    }
};

exports.createUser = async (req, res) => {
    try {
        const { employeeId, employeeName, email, phone, department, password, isDepartmentAdmin, status } = req.body;

        if (!employeeId || !employeeName || !email || !phone || !department || !password) {
            return res.status(400).json({
                success: false,
                message: "Employee ID, name, email, phone, department and password are required.",
            });
        }

        const pool = await connectDB();
        const existing = await pool.execute(
            "SELECT id FROM employees WHERE email = ? OR employee_id = ?",
            [email, employeeId]
        );
        if (existing.length > 0) {
            return res.status(400).json({
                success: false,
                message: "Email or Employee ID already exists.",
            });
        }

        const hashedPassword = await bcrypt.hash(password, 12);
        const dept = String(department).trim();
        const role = String(dept).toLowerCase();
        // Accounts created here are created BY a Management/Admin account, so
        // they are approved immediately by default.
        const accountStatus = VALID_STATUSES.includes(String(status || "").trim().toLowerCase())
            ? String(status).trim().toLowerCase()
            : "active";

        console.log(`[USER_CREATE] Attempting to create user:`, {
            employeeId,
            employeeName,
            email,
            phone,
            department: dept,
            role,
            isDepartmentAdmin: normalizeFlag(isDepartmentAdmin),
            accountStatus,
        });

        await pool.execute(
            `INSERT INTO employees
             (employee_id, employee_name, email, phone, department, role, password_hash, is_department_admin, account_status)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [employeeId, employeeName, email, phone, dept, role, hashedPassword, normalizeFlag(isDepartmentAdmin) ? 1 : 0, accountStatus]
        );

        console.log(`[USER_CREATE] Inserted into employees table. Querying created user for employeeId: "${employeeId}"`);

        const rows = await pool.execute(
            `SELECT id, employee_id, employee_name, email, phone, department, role,
                    is_department_admin, account_status, created_at
             FROM employees
             WHERE employee_id = ?`,
            [employeeId]
        );

        console.log(`[USER_CREATE] Query result rows (${rows?.length || 0}):`, rows);

        const createdUser = rows && rows.length > 0 ? {
            id: rows[0].id,
            employeeId: rows[0].employee_id,
            employeeName: rows[0].employee_name,
            email: rows[0].email,
            phone: rows[0].phone,
            department: rows[0].department,
            role: rows[0].role,
            isDepartmentAdmin: !!Number(rows[0].is_department_admin),
            accountStatus: rows[0].account_status || "active",
            createdAt: rows[0].created_at,
        } : null;

        console.log(`[USER_CREATE] Formatted createdUser response:`, createdUser);

        return res.status(201).json({
            success: true,
            message: "User created successfully.",
            user: createdUser,
        });
    } catch (err) {
        console.error("[USER_CREATE] Error creating user:", err);
        return res.status(500).json({ success: false, message: "Failed to create user." });
    }
};

exports.updateUser = async (req, res) => {
    try {
        const { id } = req.params;
        const { department, isDepartmentAdmin, password, status } = req.body;

        const pool = await connectDB();
        const rows = await pool.execute("SELECT * FROM employees WHERE id = ?", [id]);
        if (rows.length === 0) {
            return res.status(404).json({ success: false, message: "User not found." });
        }
        const user = rows[0];

        // Guard against a super admin demoting themselves (would lock the app
        // out of user management). Department admins can never touch super admins.
        if (user.department && /^(admin|management)$/i.test(String(user.department).trim())) {
            return res.status(403).json({
                success: false,
                message: "Admin/Management accounts cannot be modified here.",
            });
        }

        if (password) {
            const hashedPassword = await bcrypt.hash(password, 12);
            await pool.execute("UPDATE employees SET password_hash = ? WHERE id = ?", [hashedPassword, id]);
        }

        if (department !== undefined && String(department).trim()) {
            const dept = String(department).trim();
            await pool.execute(
                "UPDATE employees SET department = ?, role = ? WHERE id = ?",
                [dept, String(dept).toLowerCase(), id]
            );
        }

        if (isDepartmentAdmin !== undefined) {
            await pool.execute(
                "UPDATE employees SET is_department_admin = ? WHERE id = ?",
                [normalizeFlag(isDepartmentAdmin) ? 1 : 0, id]
            );
        }

        // Approval / enable-disable workflow. Disabling or rejecting a user
        // revokes every active session so they are logged out immediately.
        if (status !== undefined) {
            const newStatus = String(status).trim().toLowerCase();
            if (!VALID_STATUSES.includes(newStatus)) {
                return res.status(400).json({ success: false, message: "Invalid account status." });
            }
            await pool.execute(
                "UPDATE employees SET account_status = ? WHERE id = ?",
                [newStatus, id]
            );
            if (newStatus === "disabled" || newStatus === "rejected") {
                await Session.deleteByUserId(id);
            }
        }

        return res.json({ success: true, message: "User updated successfully." });
    } catch (err) {
        console.error("Update user error:", err);
        return res.status(500).json({ success: false, message: "Failed to update user." });
    }
};