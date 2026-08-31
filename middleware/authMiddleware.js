const jwt = require("jsonwebtoken");
const Session = require("../models/sessionModel");
const { getJwtSecret } = require("../config/security");
const { connectDB } = require("../config/db");

const COOKIE_NAME = "auth_token";

module.exports = async (req, res, next) => {
    try {
        const token = req.cookies?.[COOKIE_NAME];
        if (!token) {
            return res.status(401).json({
                success: false,
                message: "Session expired or Unauthorized. Please log in again.",
            });
        }

        const decoded = jwt.verify(token, getJwtSecret());

        // Resolve the session for this (token, tab) pair. When the request
        // carries X-Tab-Id, the session must be bound to that same tab; a tab
        // whose session was superseded by a login on another tab (shared cookie,
        // different tabId) is rejected right here.
        const tabId = req.headers["x-tab-id"];
        const session = tabId
            ? await Session.findByTokenAndTab(token, tabId)
            : await Session.findByToken(token);
        if (!session) {
            return res.status(401).json({
                success: false,
                message: "Session expired or Unauthorized. Please log in again.",
            });
        }

        // Single-active-session check: if the token carries a sessionVersion and
        // it no longer matches the employee's current version, a newer login has
        // superseded it (on another device/browser/tab) — reject so only the
        // latest login stays active. Legacy tokens without the claim are allowed
        // (backward compatibility) and become invalid the next time they log in.
        if (decoded.sessionVersion !== undefined) {
            const currentVersion = await Session.getSessionVersion(session.userId);
            if (currentVersion === null || Number(decoded.sessionVersion) !== Number(currentVersion)) {
                return res.status(401).json({
                    success: false,
                    message: "Your session was superseded by a newer login. Please log in again.",
                });
            }
        }

        req.session = req.session || {};
        req.session.user = {
            id: session.userId,
            employeeId: session.employeeId,
            employeeName: session.employeeName,
            email: session.email,
            department: session.department,
            role: session.role,
        };

        return next();
    } catch (err) {
        if (err.name === "JsonWebTokenError" || err.name === "TokenExpiredError") {
            return res.status(401).json({
                success: false,
                message: "Session expired or Unauthorized. Please log in again.",
            });
        }
        console.error("Auth middleware error:", err);
        return res.status(500).json({
            success: false,
            message: "Authentication error. Please try again.",
        });
    }
};
