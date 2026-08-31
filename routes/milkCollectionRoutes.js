const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const milkCollectionController = require("../controllers/milkCollectionController");

const router = express.Router();

router.post("/report", authMiddleware, milkCollectionController.saveReport);
router.put("/report", authMiddleware, milkCollectionController.updateReport);
router.get("/report", authMiddleware, milkCollectionController.getByReport);
router.delete("/report", authMiddleware, milkCollectionController.deleteReport);
router.get("/dates", authMiddleware, milkCollectionController.getDates);
router.get("/vehicle/:vehicleNumber", authMiddleware, milkCollectionController.getVehicleAndPrevious);
router.get("/member/:memberCode", authMiddleware, milkCollectionController.getMemberByCode);
router.get("/check-member", authMiddleware, milkCollectionController.checkMemberExists);

module.exports = router;
