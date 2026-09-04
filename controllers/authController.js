const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const generateToken = require("../utils/generateToken");
const { getJwtSecret } = require("../config/security");
const { connectDB } = require("../config/db");
const Session = require("../models/sessionModel");

const COOKIE_NAME = "auth_token";
const COOKIE_MAX_AGE_MS = 12 * 60 * 60 * 1000; // 12 hours

// Departments a user is allowed to self-register for. Privileged roles
// (admin/management) can NOT be self-registered to prevent privilege escalation.
const ALLOWED_REGISTER_DEPARTMENTS = [
    "security",
    "stores",
    "laboratory",
    "laboratory1",
    "production",
    "weighmenttracker",
    "samplecollector",
    "trucksheet",
];

// Bcrypt hash of a throwaway string. When an email is not found we still run a
// bcrypt.compare against this dummy hash so the response time is indistinguishable
// from a real user login, preventing timing attacks that enumerate valid emails.
const TIMING_DUMMY_HASH = bcrypt.hashSync("timing-equalizer-dummy", 12);

const getUserPayload = (user) => ({
    id: user.id,
    employeeId: user.employee_id || user.employeeId,
    employeeName: user.employee_name || user.employeeName,
    email: user.email,
    phone: user.phone,
    department: user.department,
    role: user.role,
    isDepartmentAdmin: !!Number(user.is_department_admin),
    accountStatus: user.account_status || "active",
});

exports.register = async (req, res) => {
    try {
        const { employeeId, employeeName, email, phone, department, password } = req.body;

        // Determine role from department; self-registration for privileged
        // roles is forbidden (reject admin/management).
        const dept = String(department || "").trim().toLowerCase();
        if (!ALLOWED_REGISTER_DEPARTMENTS.includes(dept)) {
            return res.status(403).json({
                success: false,
                message: "Self-registration is not allowed for this department.",
            });
        }

        const pool = await connectDB();

        const existing = await pool.execute("SELECT * FROM employees WHERE email = ?", [email]);
        if (existing.length > 0) {
            return res.status(400).json({ success: false, message: "Email already exists" });
        }

        const hashedPassword = await bcrypt.hash(password, 12);

        // Newly self-registered accounts start as "pending" and can only log in
        // after a Management/Admin approves them from the User Management page.
        await pool.execute(
            `INSERT INTO employees (employee_id, employee_name, email, phone, department, password_hash, role, account_status)
             VALUES (?, ?, ?, ?, ?, ?, ?, 'pending')`,
            [employeeId, employeeName, email, phone, dept, hashedPassword, dept]
        );

        res.status(201).json({
            success: true,
            message: "Registration successful. Your account is pending approval by Management/Admin.",
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, message: "Registration failed. Please try again." });
    }
};

exports.login = async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ success: false, message: "Email and Password are required" });
        }

        const pool = await connectDB();
        const rows = await pool.execute("SELECT * FROM employees WHERE email = ?", [email]);

        if (rows.length === 0) {
            // Timing equalizer: burn a bcrypt compare even when no user exists so
            // the response time is the same as for a valid account with a wrong
            // password (prevents email enumeration via response timing).
            await bcrypt.compare(password, TIMING_DUMMY_HASH);
            return res.status(401).json({ success: false, message: "Invalid Email or Password" });
        }

        const user = rows[0];
        const isMatch = await bcrypt.compare(password, user.password_hash);
        if (!isMatch) {
            return res.status(401).json({ success: false, message: "Invalid Email or Password" });
        }

        // Account approval / enable-disable gate. Self-registered accounts must
        // be approved first, and disabled/rejected accounts are locked out.
        const accountStatus = String(user.account_status || "active").trim().toLowerCase();
        if (accountStatus !== "active") {
            const accountMessages = {
                pending: "Your account is pending approval. Please wait for Management/Admin to approve it.",
                disabled: "Your account has been disabled. Please contact Management/Admin.",
                rejected: "Your registration was declined. Please contact Management/Admin.",
            };
            return res.status(403).json({
                success: false,
                message: accountMessages[accountStatus] || "Your account cannot log in. Please contact Management/Admin.",
            });
        }

        // SINGLE ACTIVE SESSION: any existing sessions for this user are revoked
        // (including tabs/other browsers), and the session version is bumped so
        // every previously-issued token is rejected by the auth middleware.
        await Session.deleteByUserId(user.id);
        const sessionVersion = await Session.bumpSessionVersion(user.id);

        const tokenPayload = {
            id: user.id,
            employeeId: user.employee_id,
            employeeName: user.employee_name,
            email: user.email,
            department: user.department,
            role: user.role,
            isDepartmentAdmin: !!Number(user.is_department_admin),
            sessionVersion,
        };

        const token = generateToken(tokenPayload);
        const expiresAt = new Date(Date.now() + COOKIE_MAX_AGE_MS);

        // Bind the session to the specific browser tab that logged in, so a
        // login on another tab revokes this one (single active session per tab).
        const tabId = req.headers["x-tab-id"] || req.body?.tabId || null;

        await Session.create({
            userId: user.id,
            employeeId: user.employee_id,
            employeeName: user.employee_name,
            email: user.email,
            department: user.department,
            role: user.role,
            isDepartmentAdmin: !!Number(user.is_department_admin),
            token,
            tabId,
            ipAddress: req.ip || req.connection?.remoteAddress || null,
            userAgent: req.headers["user-agent"] || null,
            expiresAt,
        });

        res.cookie(COOKIE_NAME, token, {
            httpOnly: true,
            secure: process.env.COOKIE_SECURE === "true",
            sameSite: "lax",
            path: "/",
            maxAge: COOKIE_MAX_AGE_MS,
        });

        return res.status(200).json({
            success: true,
            message: "Login Successful",
            user: getUserPayload(user),
        });
    } catch (err) {
        console.error("Login Error:", err);
        return res.status(500).json({ success: false, message: "Login failed. Please try again." });
    }
};

const clearAuthCookie = (res) => {
    // Must pass the EXACT same options used when the cookie was set, otherwise
    // the browser will not match the cookie and it will never be cleared.
    res.clearCookie(COOKIE_NAME, {
        httpOnly: true,
        secure: process.env.COOKIE_SECURE === "true",
        sameSite: "lax",
        path: "/",
    });
};

exports.logout = async (req, res) => {
    try {
        const token = req.cookies?.[COOKIE_NAME];
        const tabId = req.headers["x-tab-id"] || req.query?.tab || null;
        if (token) {
            // Delete only the session belonging to this tab so logging out from
            // one tab never kills another tab's active session.
            await Session.deleteByTokenAndTab(token, tabId);
        }
        clearAuthCookie(res);
        return res.json({ success: true, message: "Logged out successfully" });
    } catch (err) {
        console.error("Logout error:", err);
        clearAuthCookie(res);
        return res.json({ success: true, message: "Logged out successfully" });
    }
};

exports.profile = async (req, res) => {
    try {
        const token = req.cookies?.[COOKIE_NAME];
        if (!token) {
            return res.status(401).json({ success: false, message: "Not logged in" });
        }

        const decoded = jwt.verify(token, getJwtSecret());
        const tabId = req.headers["x-tab-id"];
        let session = tabId ? await Session.findByTokenAndTab(token, tabId) : null;
        if (!session) session = await Session.findByToken(token);
        if (!session && decoded && decoded.id) session = await Session.findByUserId(decoded.id);

        if (!session) {
            return res.status(401).json({ success: false, message: "Session expired. Please log in again." });
        }

        // Renew cookie with new token on profile fetch so session stays alive on refresh
        const newToken = jwt.sign(
            { id: session.userId, employeeId: session.employeeId, email: session.email, department: session.department, role: session.role },
            getJwtSecret(),
            { expiresIn: "8h" }
        );

        // Synchronize updated token into Sessions table
        await Session.updateToken(session.id, newToken).catch(() => {});

        res.cookie(COOKIE_NAME, newToken, {
            httpOnly: true,
            secure: process.env.COOKIE_SECURE === "true",
            sameSite: "lax",
            path: "/",
            maxAge: COOKIE_MAX_AGE_MS,
        });

        return res.status(200).json({
            success: true,
            user: {
                id: session.userId,
                employeeId: session.employeeId,
                employeeName: session.employeeName,
                email: session.email,
                department: session.department,
                role: session.role,
                isDepartmentAdmin: !!Number(session.isDepartmentAdmin),
            },
        });
    } catch (err) {
        if (err.name === "JsonWebTokenError" || err.name === "TokenExpiredError") {
            return res.status(401).json({ success: false, message: "Invalid or expired token" });
        }
        return res.status(500).json({ success: false, message: err.message });
    }
};
