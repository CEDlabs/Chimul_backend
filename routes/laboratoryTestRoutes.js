const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const laboratoryTestController = require("../controllers/laboratoryTestController");
const laboratoryReportController = require("../controllers/laboratoryReportController");

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
router.get("/reports/fortnight", authMiddleware, laboratoryReportController.getFortnight);

module.exports = router;
