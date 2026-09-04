const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const sampleCollectionController = require("../controllers/sampleCollectionController");

const router = express.Router();

router.post(
    "/",
    authMiddleware,
    body("sampleId").trim().notEmpty().withMessage("Sample ID is required"),
    body("vehicleNumber").trim().notEmpty().withMessage("Vehicle number is required"),
    body("temperature").optional({ checkFalsy: true }).trim(),
    body("remarks").optional({ checkFalsy: true }).trim(),
    body("quantity").trim().notEmpty().withMessage("Quantity is required"),
    sampleCollectionController.create
);
router.get("/vehicle/:vehicleNumber", authMiddleware, sampleCollectionController.getVehicleData);
router.get("/for-vehicle/:vehicleNumber", authMiddleware, sampleCollectionController.getByVehicleAndDate);
router.get("/compartments/:sampleId", authMiddleware, sampleCollectionController.getCompartments);
router.get("/", authMiddleware, sampleCollectionController.getAll);
// Only Admin/Management or the Sample Collection department admin may edit/delete.
router.put("/:id", authMiddleware, canManage(["samplecollector", "laboratory", "laboratory1"]), sampleCollectionController.updateEntry);
router.delete("/:id", authMiddleware, canManage(["samplecollector", "laboratory", "laboratory1"]), sampleCollectionController.deleteEntry);

module.exports = router;
