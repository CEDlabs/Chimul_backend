const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { requireSuperAdmin } = require("../middleware/authorizeMiddleware");
const routeController = require("../controllers/routeController");

const router = express.Router();

// Read route list (accessible to any logged-in user)
router.get("/", authMiddleware, routeController.getAll);

// Route master management (restricted to Admin / Management)
router.post("/", authMiddleware, requireSuperAdmin, routeController.create);
router.put("/:id", authMiddleware, requireSuperAdmin, routeController.update);
router.delete("/:id", authMiddleware, requireSuperAdmin, routeController.remove);

module.exports = router;
