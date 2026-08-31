const express = require("express");
const router = express.Router();
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const vehicleController = require("../controllers/vehicleController");

// ── Vehicle Master (Lab-allocated serial numbers, shared with Gate Entry) ──
router.get("/", authMiddleware, vehicleController.getAllVehicles);
router.get("/check-duplicates", authMiddleware, vehicleController.checkDuplicates);
router.get("/:vehicleNumber", authMiddleware, vehicleController.lookupVehicle);

// Upsert by (vehicleNumber + allocationDate): same vehicle on the same date
// is updated, otherwise a new record is created.
router.post(
    "/",
    authMiddleware,
    body("vehicleNumber").notEmpty().withMessage("Vehicle number is required"),
    vehicleController.registerVehicle
);

router.delete("/:id", authMiddleware, vehicleController.deleteVehicle);

module.exports = router;
