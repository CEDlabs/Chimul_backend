const express = require("express");
const router = express.Router();
const { body } = require("express-validator");
const vehicleController = require("../controllers/vehicleController");
const weighBridgeController = require("../controllers/weighBridgeController");

// Vehicle master routes
router.get("/vehicle/:vehicleNumber", vehicleController.lookupVehicle);
router.post("/vehicle", body("vehicleNumber").notEmpty(), vehicleController.registerVehicle);

// WeighBridge step routes
router.post("/entry",
    body("vehicleNumber").notEmpty(),
    body("grossWeight").notEmpty(),
    weighBridgeController.createEntry
);
router.put("/intermediate/:wbEntryId",
    body("weight").notEmpty(),
    weighBridgeController.saveIntermediate
);
router.put("/tare/:wbEntryId",
    body("tareWeight").notEmpty(),
    weighBridgeController.saveTare
);
router.get("/active/:vehicleNumber", weighBridgeController.findActive);
router.get("/today-completed/:vehicleNumber", weighBridgeController.findTodayCompleted);
router.get("/records", weighBridgeController.getRecords);
router.delete("/:id", weighBridgeController.deleteEntry);
router.put("/:id", weighBridgeController.updateEntry);

module.exports = router;
