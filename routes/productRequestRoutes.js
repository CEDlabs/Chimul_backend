const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canAccess, canManage } = require("../middleware/authorizeMiddleware");
const controller = require("../controllers/productRequestController");

const router = express.Router();
const productsAccess = canAccess(["products", "production", "storage", "stores"]);
router.use(authMiddleware, productsAccess);
router.get("/", controller.list);
router.post("/", controller.create);
router.put("/:id/cancel", controller.cancel);
router.get("/products", controller.listProducts);
router.post("/products", canManage(["products", "production"]), controller.createProduct);
router.put("/products/:id", canManage(["products", "production"]), controller.updateProduct);

module.exports = router;
