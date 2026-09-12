const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage, canAccess } = require("../middleware/authorizeMiddleware");
const controller = require("../controllers/storageController");

const router = express.Router();
const STORAGE_DEPTS = ["storage", "stores", "stores_tanker", "storestanker", "stores_silo", "storessilo", "products", "production"];
const storageAdmin = canManage(STORAGE_DEPTS);
const storageStaff = canAccess(STORAGE_DEPTS);

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
    "/silo-consumption",
    canAccess(["products", "production", "storage", "stores", "stores_silo", "storessilo"]),
    body("siloId").notEmpty(),
    body("quantity").isFloat({ gt: 0 }),
    controller.validateDump,
    controller.consumeSilo
);
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
router.get("/tested-vehicles", controller.listTestedVehicles);

module.exports = router;
