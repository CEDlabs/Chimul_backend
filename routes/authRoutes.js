const express = require("express");
const authMiddleware = require("../middleware/authMiddleware");
const { canManage } = require("../middleware/authorizeMiddleware");

const router = express.Router();

const {
  register, login, logout, profile
} = require("../controllers/authController");

const {
    createGateEntry,
    getGateEntries,
    getGateStats,
    getRecentGateEntries,
    deleteGateEntry,
    checkDuplicates,
    findByVehicleToday
} = require("../controllers/gateEntryController");

const {
  body,
  validationResult,
} = require("express-validator");

const rateLimit = require("express-rate-limit");

// Stricter limiter for login to slow brute-force attempts.
const loginLimiter = rateLimit({
    windowMs: parseInt(process.env.LOGIN_RATE_WINDOW_MS, 10) || 15 * 60 * 1000,
    max: parseInt(process.env.LOGIN_RATE_MAX, 10) || 10,
    standardHeaders: true,
    legacyHeaders: false,
    message: { success: false, message: "Too many login attempts. Please try again later." }
});



// Enforces the validator middleware declared via body(...). Without this,
// validation errors are silently ignored (the password policy is a no-op).
const handleValidationErrors = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ success: false, message: errors.array()[0].msg });
    }
    next();
};

// Input validation for the register endpoint (enumeration-safe generic errors,
// but friendly field messages for form feedback).
const registerValidators = [
    body("employeeId").notEmpty().withMessage("Employee ID is required"),
    body("employeeName").notEmpty().withMessage("Employee name is required"),
    body("email").isEmail().withMessage("A valid email is required"),
    body("phone").isLength({ min: 10 }).withMessage("Phone must be at least 10 characters"),
    body("department").notEmpty().withMessage("Department is required"),
    body("password")
        .isStrongPassword({
            minLength: 8,
            minUppercase: 1,
            minLowercase: 1,
            minNumbers: 1,
            minSymbols: 1,
        })
        .withMessage("Password must be at least 8 characters and include an uppercase letter, a lowercase letter, a number, and a symbol"),
];

// Input shape validation for the login endpoint (avoids processing junk payloads).
const loginValidators = [
    body("email").isEmail().withMessage("A valid email is required"),
    body("password").notEmpty().withMessage("Password is required"),
];

router.post(
  "/register",

  registerValidators,

  handleValidationErrors,

  register
);

router.get("/profile", authMiddleware, profile);

// login (rate-limited to slow brute-force, input-shape validated)
router.post("/login", loginLimiter, loginValidators, handleValidationErrors, login);

router.post("/logout", logout);

router.post(
    "/gate-entry",

    authMiddleware,

    body("gateEntryId").notEmpty(),

    body("vehicleNumber").notEmpty(),

    body("vehicleType").notEmpty(),

    body("driverName").notEmpty(),

    createGateEntry
);

router.get("/gate-entry/check-duplicates", authMiddleware, checkDuplicates);
router.get("/gate-entry/by-vehicle-today/:vehicleNumber", authMiddleware, findByVehicleToday);

const vehicleController = require("../controllers/vehicleController");
const weighBridgeController = require("../controllers/weighBridgeController");

router.get("/waybridge/vehicle/:vehicleNumber", vehicleController.lookupVehicle);
router.post("/waybridge/vehicle", vehicleController.registerVehicle);
router.post("/waybridge/entry", weighBridgeController.createEntry);
router.put("/waybridge/intermediate/:wbEntryId", weighBridgeController.saveIntermediate);
router.put("/waybridge/tare/:wbEntryId", weighBridgeController.saveTare);
router.get("/waybridge/active/:vehicleNumber", weighBridgeController.findActive);
router.get("/waybridge/today-completed/:vehicleNumber", weighBridgeController.findTodayCompleted);
router.get("/waybridge/records", weighBridgeController.getRecords);
router.delete("/waybridge/:id", authMiddleware, canManage(["weighmenttracker"]), weighBridgeController.deleteEntry);
router.put("/waybridge/:id", authMiddleware, canManage(["weighmenttracker"]), weighBridgeController.updateEntry);

module.exports = router;