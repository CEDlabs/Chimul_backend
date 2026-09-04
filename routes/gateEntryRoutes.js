const express = require("express");
const router = express.Router();
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const gateEntryController = require("../controllers/gateEntryController");
const vehicleExitController = require("../controllers/vehicleExitController");

// ── Gate Entry Routes ───────────────────────────────────────────────
router.post(
    "/",
    body("gateEntryId").notEmpty(),
    body("vehicleNumber").notEmpty(),
    body("vehicleType").notEmpty(),
    body("driverName").notEmpty(),
    gateEntryController.createGateEntry
);

router.get("/records", gateEntryController.getGateEntries);
router.get("/stats", gateEntryController.getGateStats);
router.get("/recent", gateEntryController.getRecentGateEntries);
router.get("/check-duplicates", gateEntryController.checkDuplicates);
router.get("/by-vehicle-today/:vehicleNumber", gateEntryController.findByVehicleToday);
// Only Admin/Management or the Gate (Security) department admin may edit/delete.
router.put("/:id", authMiddleware, canManage(["security"]), gateEntryController.updateGateEntry);
router.delete("/:id", authMiddleware, canManage(["security"]), gateEntryController.deleteGateEntry);

// ── Audit Log Routes ────────────────────────────────────────────────
router.get("/audit-log", gateEntryController.getAuditLogs);

// ── Vehicle Exit Routes ─────────────────────────────────────────────
router.post(
    "/exit",
    body("vehicleNumber").notEmpty().withMessage("Vehicle number is required"),
    vehicleExitController.recordVehicleExit
);

router.get("/exit/search", vehicleExitController.searchActiveVehicle);
router.get("/exit/records", vehicleExitController.getExitRecords);

module.exports = router;
