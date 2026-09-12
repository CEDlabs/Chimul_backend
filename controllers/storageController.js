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

exports.validateDump = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ success: false, message: errors.array().map((e) => e.msg).join(", ") });
    next();
};
