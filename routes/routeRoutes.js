const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const routeController = require("../controllers/routeController");

const router = express.Router();

// Read route list (accessible to any logged-in user)
router.get("/", authMiddleware, routeController.getAll);

// Route master management (restricted to Admin / Management and department admins)
router.post("/", authMiddleware, canManage(["samplecollector", "laboratory", "laboratory1"]), routeController.create);
router.put("/:id", authMiddleware, canManage(["samplecollector", "laboratory", "laboratory1"]), routeController.update);
router.delete("/:id", authMiddleware, canManage(["samplecollector", "laboratory", "laboratory1"]), routeController.remove);

module.exports = router;
