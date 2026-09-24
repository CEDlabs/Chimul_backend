const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage, canAccess } = require("../middleware/authorizeMiddleware");
const laboratoryTestController = require("../controllers/laboratoryTestController");
const laboratoryReportController = require("../controllers/laboratoryReportController");
const talukController = require("../controllers/talukController");

const router = express.Router();

router.post(
    "/",
    authMiddleware,
    body("labTestId").trim().notEmpty(),
    body("vehicleNumber").trim().notEmpty(),
    body("temperature").trim().notEmpty(),
    body("clr").trim().notEmpty(),
    body("fat").trim().notEmpty(),
    laboratoryTestController.create
);
// Only Admin/Management or the Laboratory department admin may edit/delete.
router.put("/:id", authMiddleware, canManage(["laboratory", "laboratory1"]), laboratoryTestController.update);
router.delete("/:id", authMiddleware, canManage(["laboratory", "laboratory1"]), laboratoryTestController.remove);
router.get("/find-existing", authMiddleware, laboratoryTestController.findExisting);
router.get("/find-previous", authMiddleware, laboratoryTestController.findPreviousByVehicle);
router.get("/vehicle/:vehicleNumber", authMiddleware, laboratoryTestController.getVehicleData);
router.get("/lookup", authMiddleware, laboratoryTestController.getDataByRoute);
router.get("/records", authMiddleware, laboratoryTestController.getAll);
router.get("/reports/routes", authMiddleware, laboratoryReportController.getRoutes);
router.get("/reports/daily", authMiddleware, laboratoryReportController.getDaily);
router.get("/reports/daily-loading", authMiddleware, laboratoryReportController.getDailyLoading);
router.get("/reports/fortnight", authMiddleware, laboratoryReportController.getFortnight);
router.get("/reports/taluk", authMiddleware, laboratoryReportController.getTaluk);
router.get("/reports/extra", authMiddleware, laboratoryReportController.getExtra);

// Taluk master (reads for any authenticated user; writes for any Laboratory
// department user or Admin/Management, so the lab can maintain taluk→route maps).
router.get("/taluks", authMiddleware, talukController.list);
router.post("/taluks", authMiddleware, canAccess(["laboratory", "laboratory1"]), talukController.create);
router.put("/taluks/:id", authMiddleware, canAccess(["laboratory", "laboratory1"]), talukController.update);
router.delete("/taluks/:id", authMiddleware, canAccess(["laboratory", "laboratory1"]), talukController.remove);
router.get("/taluks/:talukName/routes", authMiddleware, talukController.getRoutes);
router.put("/taluks/:talukName/routes", authMiddleware, canAccess(["laboratory", "laboratory1"]), talukController.assignRoutes);

module.exports = router;
