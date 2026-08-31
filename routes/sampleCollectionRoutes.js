const express = require("express");
const { body } = require("express-validator");
const authMiddleware = require("../middleware/authMiddleware");
const sampleCollectionController = require("../controllers/sampleCollectionController");

const router = express.Router();

router.post(
    "/",
    authMiddleware,
    body("sampleId").trim().notEmpty(),
    body("vehicleNumber").trim().notEmpty(),
    body("temperature").trim().notEmpty(),
    body("remarks").optional({ checkFalsy: true }).trim(),
    body("quantity").trim().notEmpty(),
    sampleCollectionController.create
);
router.get("/vehicle/:vehicleNumber", authMiddleware, sampleCollectionController.getVehicleData);
router.get("/", authMiddleware, sampleCollectionController.getAll);
router.put("/:id", authMiddleware, sampleCollectionController.updateEntry);
router.delete("/:id", authMiddleware, sampleCollectionController.deleteEntry);

module.exports = router;
