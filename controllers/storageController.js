const { validationResult } = require("express-validator");
const Storage = require("../models/storageModel");

const handle = (fn) => async (req, res) => {
    try {
        const data = await fn(req);
        res.json({ success: true, data });
    } catch (error) {
        const isClientError = /not found|required|capacity|active|passed|match|positive|below|exceed|cannot dump/i.test(error.message);
        const status = isClientError ? 400 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.listTanks = handle(() => Storage.listTanks());
exports.createTank = handle((req) => Storage.createTank(req.body, req.session.user));
exports.updateTank = handle((req) => Storage.updateTank(req.params.id, req.body, req.session.user));
exports.deactivateTank = handle((req) => Storage.deactivateTank(req.params.id, req.session.user));
exports.listSilos = handle(() => Storage.listSilos());
exports.createSilo = handle((req) => Storage.createSilo(req.body, req.session.user));
exports.updateSilo = handle((req) => Storage.updateSilo(req.params.id, req.body, req.session.user));
exports.deactivateSilo = handle((req) => Storage.deactivateSilo(req.params.id, req.session.user));
exports.consumeSilo = handle((req) => Storage.consumeSilo(req.body, req.session.user));
exports.dumpToTank = handle((req) => Storage.dumpToTank(req.body, req.session.user));
exports.rejectVehicle = handle((req) => Storage.rejectVehicle(req.body, req.session.user));
exports.dumpHistory = handle((req) => Storage.dumpHistory(req.query));
exports.listTestedVehicles = handle(() => Storage.listTestedVehicles());

/* Rinse Tanks */
exports.listRinseTanks = handle(() => Storage.listRinseTanks());
exports.createRinseTank = handle((req) => Storage.createRinseTank(req.body, req.session.user));
exports.updateRinseTank = handle((req) => Storage.updateRinseTank(req.params.id, req.body, req.session.user));
exports.deactivateRinseTank = handle((req) => Storage.deactivateRinseTank(req.params.id, req.session.user));

/* Department Allotment & Return */
exports.allotMilkToDepartment = handle((req) => Storage.allotMilkToDepartment(req.body, req.session.user));
exports.returnDepartmentMilk = handle((req) => Storage.returnDepartmentMilk(req.body, req.session.user));
exports.listDepartmentAllotments = handle((req) => Storage.listDepartmentAllotments(req.query));

/* Rinse Tank Push */
exports.pushRinseTankMilk = handle((req) => Storage.pushRinseTankMilk(req.body, req.session.user));
exports.listRinseTransfers = handle((req) => Storage.listRinseTransfers(req.query));

/* Tanker Loading */
exports.loadMilkToTanker = handle((req) => Storage.loadMilkToTanker(req.body, req.session.user));
exports.listTankerLoadings = handle((req) => Storage.listTankerLoadings(req.query));
exports.listCleanedTankers = handle(() => Storage.listCleanedTankers());

/* Tank to Silo Loads */
exports.listTankToSiloLoads = handle(() => Storage.listTankToSiloLoads());

exports.validateDump = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ success: false, message: errors.array().map((e) => e.msg).join(", ") });
    next();
};
