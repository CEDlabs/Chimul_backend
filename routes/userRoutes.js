const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { requireSuperAdmin } = require("../middleware/authorizeMiddleware");
const userController = require("../controllers/userController");

const router = express.Router();

// Every user-management route requires an authenticated Admin/Management
// account. Regular users and department admins are rejected here.
router.use(authMiddleware, requireSuperAdmin);

router.get("/", userController.listUsers);
router.post("/", userController.createUser);
router.put("/:id", userController.updateUser);

module.exports = router;