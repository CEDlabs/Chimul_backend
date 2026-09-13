const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const controller = require("../controllers/notificationController");

const router = express.Router();
router.use(authMiddleware);
router.get("/", controller.list);
router.get("/department/:department", controller.listByDepartment);
router.put("/:id/read", controller.markRead);
module.exports = router;
