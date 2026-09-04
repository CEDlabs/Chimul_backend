const express = require("express");
const router = express.Router();
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const vehicleController = require("../controllers/vehicleController");

// ── Vehicle Master (Lab-allocated serial numbers, shared with Gate Entry) ──
router.get("/", authMiddleware, vehicleController.getAllVehicles);
router.get("/check-duplicates", authMiddleware, vehicleController.checkDuplicates);

// Master vehicle list (catalog): read for everyone, write for admin/dept-admin.
router.get("/catalog", authMiddleware, vehicleController.getVehicleCatalog);
router.get("/catalog/check-vehicle", authMiddleware, vehicleController.checkCatalogVehicle);
router.post(
    "/catalog",
    authMiddleware,
    canManage(["laboratory", "laboratory1"]),
    vehicleController.createVehicleCatalog
);
router.delete(
    "/catalog/:id",
    authMiddleware,
    canManage(["laboratory", "laboratory1"]),
    vehicleController.deleteVehicleCatalog
);

// Allocated routes for a date (alt-window aware) + by-route resolution
router.get("/routes", authMiddleware, vehicleController.getAllocatedRoutes);
router.get("/by-route/:routeName", authMiddleware, vehicleController.getByRoute);

// Route Alternative Vehicle windows
router.get("/alternatives", authMiddleware, vehicleController.getAlternativeWindows);
router.post(
    "/alternatives",
    authMiddleware,
    canManage(["laboratory", "laboratory1"]),
    vehicleController.createAlternativeWindow
);
router.delete("/alternatives/:id", authMiddleware, canManage(["laboratory", "laboratory1"]), vehicleController.deleteAlternativeWindow);

// Distinct routes (with primary vehicle) from the master vehicle list.
// Shared source of truth for the route dropdowns in every department.
router.get("/route-list", authMiddleware, vehicleController.getRoutes);

router.get("/:vehicleNumber", authMiddleware, vehicleController.lookupVehicle);

// Upsert by (vehicleNumber + allocationDate): same vehicle on the same date
// is updated, otherwise a new record is created.
router.post(
    "/",
    authMiddleware,
    body("vehicleNumber").notEmpty().withMessage("Vehicle number is required"),
    vehicleController.registerVehicle
);

// Only Admin/Management or the Laboratory/Weigh Bridge department admin may delete.
router.delete("/:id", authMiddleware, canManage(["laboratory", "laboratory1", "weighmenttracker"]), vehicleController.deleteVehicle);

module.exports = router;
