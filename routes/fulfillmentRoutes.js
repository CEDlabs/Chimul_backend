const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canAccess } = require("../middleware/authorizeMiddleware");
const controller = require("../controllers/fulfillmentController");

const router = express.Router();
router.use(authMiddleware, canAccess(["storage", "stores", "stores_tanker", "storestanker", "stores_silo", "storessilo"]));
router.post("/", controller.create);
router.get("/request/:requestId", controller.list);
module.exports = router;
