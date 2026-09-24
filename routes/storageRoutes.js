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

/* Rinse Tanks */
router.get("/rinse-tanks", controller.listRinseTanks);
router.post("/rinse-tanks", storageAdmin, body("label").trim().notEmpty(), body("capacity").isFloat({ gt: 0 }), controller.validateDump, controller.createRinseTank);
router.put("/rinse-tanks/:id", storageAdmin, controller.updateRinseTank);
router.delete("/rinse-tanks/:id", storageAdmin, controller.deactivateRinseTank);

/* Department Milk Allotment & Return */
router.post(
    "/department-allotments",
    canAccess(["products", "production", "storage", "stores", "stores_silo", "storessilo", "admin", "management"]),
    body("department").trim().notEmpty(),
    body("productName").trim().notEmpty(),
    body("sourceSiloId").notEmpty(),
    body("quantity").isFloat({ gt: 0 }),
    controller.validateDump,
    controller.allotMilkToDepartment
);
router.post(
    "/department-returns",
    canAccess(["products", "production", "storage", "stores", "stores_silo", "storessilo", "admin", "management"]),
    body("allotmentId").notEmpty(),
    body("usedQuantity").isFloat({ min: 0 }),
    body("returnedQuantity").isFloat({ min: 0 }),
    controller.validateDump,
    controller.returnDepartmentMilk
);
router.get("/department-allotments", controller.listDepartmentAllotments);

/* Rinse Tank Push to Tanks or Silos */
router.post(
    "/rinse-push",
    canAccess(["products", "production", "storage", "stores", "stores_silo", "storessilo", "admin", "management"]),
    body("rinseTankId").notEmpty(),
    body("destinationType").trim().notEmpty(),
    body("destinationId").notEmpty(),
    body("quantity").isFloat({ gt: 0 }),
    controller.validateDump,
    controller.pushRinseTankMilk
);
router.get("/rinse-transfers", controller.listRinseTransfers);

/* Tanker Outbound Loading (After CIP Cleaned Only) */
router.post(
    "/tanker-load",
    storageStaff,
    body("vehicleNumber").trim().notEmpty(),
    body("sourceId").notEmpty(),
    body("quantity").isFloat({ gt: 0 }),
    controller.validateDump,
    controller.loadMilkToTanker
);
router.get("/tanker-loads", controller.listTankerLoadings);
router.get("/cleaned-tankers", controller.listCleanedTankers);

/* Tank to Silo Loads (with timing) */
router.get("/tank-to-silo-loads", controller.listTankToSiloLoads);

module.exports = router;
