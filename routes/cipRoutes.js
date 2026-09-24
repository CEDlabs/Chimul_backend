const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canAccess } = require("../middleware/authorizeMiddleware");
const controller = require("../controllers/cipController");

const router = express.Router();
const cipAccess = canAccess(["cip", "cleaning"]);

router.use(authMiddleware, cipAccess);
router.post("/", controller.create);
router.get("/pending", controller.pending);
router.get("/", controller.list);
router.get("/weighbridge/:wbEntryId", controller.getByWBEntry);

module.exports = router;
