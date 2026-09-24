const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { requireSuperAdmin, isSuperAdmin } = require("../middleware/authorizeMiddleware");
const userController = require("../controllers/userController");

const router = express.Router();

const canCreateUser = (req, res, next) => {
    const user = req.session?.user;
    if (!user) {
        return res.status(401).json({ success: false, message: "Unauthorized. Please log in again." });
    }
    if (isSuperAdmin(user)) return next();

    const targetDept = String(req.body?.department || "").trim().toLowerCase();
    const userDept = String(user.department || "").trim().toLowerCase();

    // Department admins can create users for their own department
    if (user.isDepartmentAdmin && userDept === targetDept) {
        return next();
    }

    // CIP / Cleaning staff or supervisor can register/add CIP staff members
    if (["cip", "cleaning"].includes(userDept) && ["cip", "cleaning"].includes(targetDept)) {
        return next();
    }

    return res.status(403).json({
        success: false,
        message: "Only Admin/Management users can create accounts for other departments.",
    });
};

// GET /api/users - any authenticated user can list users (needed by operational modules like CIP)
router.get("/", authMiddleware, userController.listUsers);

// POST /api/users - SuperAdmin, Department Admin for their department, or CIP staff creating CIP users
router.post("/", authMiddleware, canCreateUser, userController.createUser);

// PUT /api/users/:id - SuperAdmin only
router.put("/:id", authMiddleware, requireSuperAdmin, userController.updateUser);

module.exports = router;