const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage, canAccess } = require("../middleware/authorizeMiddleware");
const controller = require("../controllers/storageController");

const router = express.Router();
const storageAdmin = canManage(["storage", "stores"]);
const storageStaff = canAccess(["storage", "stores"]);

router.use(authMiddleware);
router.get("/tanks", controller.listTanks);
router.post("/tanks", storageAdmin, body("label").trim().notEmpty(), body("capacity").isFloat({ gt: 0 }), controller.validateDump, controller.createTank);
router.put("/tanks/:id", storageAdmin, controller.updateTank);
router.delete("/tanks/:id", storageAdmin, controller.deactivateTank);
router.get("/silos", controller.listSilos);
router.post("/silos", storageAdmin, body("label").trim().notEmpty(), body("capacity").isFloat({ gt: 0 }), controller.validateDump, controller.createSilo);
router.put("/silos/:id", storageAdmin, controller.updateSilo);
router.delete("/silos/:id", storageAdmin, controller.deactivateSilo);
router.post(
    "/tank-dumps",
    storageStaff,
    body("vehicleNumber").trim().notEmpty(),
    body("sampleTestReportId").trim().notEmpty(),
    body("tankId").notEmpty(),
    body("quantity").isFloat({ gt: 0 }),
    controller.validateDump,
    controller.dumpToTank
);
router.post("/rejections", storageStaff, body("vehicleNumber").trim().notEmpty(), body("sampleTestReportId").trim().notEmpty(), controller.validateDump, controller.rejectVehicle);
router.get("/tank-dumps", controller.dumpHistory);

module.exports = router;
