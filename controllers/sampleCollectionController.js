const { validationResult } = require("express-validator");
const SampleCollection = require("../models/sampleCollectionModel");

exports.create = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ success: false, errors: errors.array() });
    try {
        const result = await SampleCollection.create({
            ...req.body,
            sampleCollectedBy: req.session?.user?.employeeName || req.body.sampleCollectedBy,
            sampleCollectedByEmpId: req.session?.user?.employeeId || req.body.sampleCollectedByEmpId,
        });
        res.status(201).json({ success: true, message: "Sample collection saved successfully.", data: result });
    } catch (error) {
        const isDuplicate = error.message && error.message.includes("already exists");
        const status = isDuplicate || error.number === 2627 || error.number === 2601 ? 409 : 500;
        res.status(status).json({ success: false, message: status === 409 ? error.message : error.message });
    }
};

exports.getAll = async (req, res) => {
    try {
        const { vehicleNumber, startDate, endDate, search } = req.query;
        const data = await SampleCollection.getAll({ vehicleNumber, startDate, endDate, search });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getVehicleData = async (req, res) => {
    try {
        const data = await SampleCollection.getVehicleData(req.params.vehicleNumber);
        res.json({ success: true, data, found: Boolean(data.gate || data.weighbridge) });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.deleteEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || null;
        const ipAddress = req.ip;
        await SampleCollection.remove(id, user, ipAddress);
        res.json({ success: true, message: "Sample collection entry deleted successfully." });
    } catch (err) {
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};

exports.updateEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const result = await SampleCollection.update(id, req.body);
        res.json({ success: true, message: "Sample collection entry updated successfully.", data: result });
    } catch (err) {
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};
