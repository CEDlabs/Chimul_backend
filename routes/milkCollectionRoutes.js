const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");
const milkCollectionController = require("../controllers/milkCollectionController");
const routeMemberController = require("../controllers/routeMemberController");
const bmcController = require("../controllers/bmcController");
const clusterController = require("../controllers/clusterController");

const router = express.Router();

router.post("/report", authMiddleware, milkCollectionController.saveReport);
// Only Admin/Management or the TruckSheet/Laboratory department admin may
// edit or delete an already-saved report.
router.put("/report", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), milkCollectionController.updateReport);
router.get("/report", authMiddleware, milkCollectionController.getByReport);
router.delete("/report", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), milkCollectionController.deleteReport);
router.get("/dates", authMiddleware, milkCollectionController.getDates);
router.get("/vehicle/:vehicleNumber", authMiddleware, milkCollectionController.getVehicleAndPrevious);
router.get("/member/:memberCode", authMiddleware, milkCollectionController.getMemberByCode);
router.get("/check-member", authMiddleware, milkCollectionController.checkMemberExists);

// Route Members master list (default member rows per route).
router.get("/route-members", authMiddleware, routeMemberController.getAll);
router.get("/route-members/route/:routeName", authMiddleware, routeMemberController.getByRoute);
router.post("/route-members", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), routeMemberController.create);
router.put("/route-members/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), routeMemberController.update);
router.delete("/route-members/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), routeMemberController.remove);

// BMCs master list (BMCs allocated to routes).
router.get("/bmcs", authMiddleware, bmcController.getAll);
router.get("/bmcs/route/:routeName", authMiddleware, bmcController.getByRoute);
router.post("/bmcs", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), bmcController.create);
router.put("/bmcs/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), bmcController.update);
router.delete("/bmcs/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), bmcController.remove);

// Clusters (per BMC with Morning/Evening batch allocation).
router.get("/clusters", authMiddleware, clusterController.getAll);
router.get("/clusters/bmc/:bmcId", authMiddleware, clusterController.getByBMC);
router.get("/clusters/route/:routeName", authMiddleware, clusterController.getByRoute);
router.post("/clusters", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), clusterController.create);
router.put("/clusters/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), clusterController.update);
router.delete("/clusters/:id", authMiddleware, canManage(["trucksheet", "laboratory", "laboratory1"]), clusterController.remove);

module.exports = router;
