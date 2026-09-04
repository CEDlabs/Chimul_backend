// Authorization helpers layered on top of authMiddleware.
//
// Every logged-in request carries req.session.user (set by authMiddleware) with
// the user's department, role, and isDepartmentAdmin flag. Roles follow this
// hierarchy:
//
//   - Super admin ("admin"/"management"): full access everywhere.
//   - Department admin: may modify records inside its OWN department only.
//   - Regular user: no modify/delete access (create + read only).

const SUPER_ROLES = ["admin", "management"];

const normalize = (value) => String(value || "").trim().toLowerCase();

// A super admin is identified by either the `role` or `department` field so the
// check works regardless of how the account was created (both mirror the same
// value in this codebase).
exports.isSuperAdmin = (user) =>
    !!user &&
    (SUPER_ROLES.includes(normalize(user.role)) ||
        SUPER_ROLES.includes(normalize(user.department)));

// Only Admin/Management may pass (used for user management endpoints).
exports.requireSuperAdmin = (req, res, next) => {
    const user = req.session?.user;
    if (!user) {
        return res.status(401).json({
            success: false,
            message: "Unauthorized. Please log in again.",
        });
    }
    if (exports.isSuperAdmin(user)) return next();
    return res.status(403).json({
        success: false,
        message: "Only Admin/Management users can perform this action.",
    });
};

// Allows Admin/Management always, plus a Department Admin whose department is
// part of `moduleDepartments` (lowercase department slugs, e.g. ["security"]).
exports.canManage = (moduleDepartments = []) => (req, res, next) => {
    const user = req.session?.user;
    if (!user) {
        return res.status(401).json({
            success: false,
            message: "Unauthorized. Please log in again.",
        });
    }
    if (exports.isSuperAdmin(user)) return next();
    if (
        user.isDepartmentAdmin &&
        moduleDepartments.includes(normalize(user.department))
    ) {
        return next();
    }
    return res.status(403).json({
        success: false,
        message: "You do not have permission to modify records in this module.",
    });
};