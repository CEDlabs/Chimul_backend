const { validationResult } = require("express-validator");
const LaboratoryTest = require("../models/laboratoryTestModel");

exports.create = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ success: false, errors: errors.array() });
    try {
        const vehicleNumber = String(req.body.vehicleNumber || "").toUpperCase().trim();
        const routeNo = String(req.body.routeNo || "").trim();
        const testDate = req.body.testedAt ? new Date(req.body.testedAt).toISOString().slice(0, 10) : new Date().toISOString().slice(0, 10);

        const existing = await LaboratoryTest.findByDateVehicleRoute({
            date: testDate,
            vehicleNumber,
            routeNo,
        });
        if (existing) {
            return res.status(409).json({
                success: false,
                message: `A lab test record already exists for vehicle ${vehicleNumber} on ${testDate}. Delete the existing record first before adding a new one.`,
                existingRecord: existing,
            });
        }

        const result = await LaboratoryTest.create({
            ...req.body,
            testedByName: req.session?.user?.employeeName || req.body.testedByName,
            testedByEmpId: req.session?.user?.employeeId || req.body.testedByEmpId,
        });
        res.status(201).json({ success: true, message: "Laboratory test saved successfully.", data: result });
    } catch (error) {
        const status = error.number === 2627 || error.number === 2601 ? 409 : 500;
        res.status(status).json({ success: false, message: status === 409 ? "Lab Test ID already exists." : error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        if (!["admin", "management"].includes(department)) {
            return res.status(403).json({ success: false, message: "Only admin/management can update lab test records." });
        }
        const result = await LaboratoryTest.update(req.params.id, req.body);
        res.json({ success: true, message: "Lab test record updated successfully.", data: result });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        if (!["admin", "management"].includes(department)) {
            return res.status(403).json({ success: false, message: "Only admin/management can delete lab test records." });
        }
        const ipAddress = req.ip || req.connection?.remoteAddress || null;
        await LaboratoryTest.delete(req.params.id, user, ipAddress);
        res.json({ success: true, message: "Lab test record deleted successfully." });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.findExisting = async (req, res) => {
    try {
        const { date, vehicleNumber, routeNo } = req.query;
        const existing = await LaboratoryTest.findByDateVehicleRoute({ date, vehicleNumber, routeNo });
        res.json({
            success: true,
            found: !!existing,
            data: existing || null,
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.findPreviousByVehicle = async (req, res) => {
    try {
        const { vehicleNumber } = req.query;
        const existing = await LaboratoryTest.findByVehicleAnyDate({ vehicleNumber, excludeToday: true });
        res.json({
            success: true,
            found: !!existing,
            data: existing || null,
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getAll = async (req, res) => {
    try {
        const data = await LaboratoryTest.getAll({
            vehicleNumber: req.query.vehicleNumber,
            routeNo: req.query.routeNo,
            startDate: req.query.startDate,
            endDate: req.query.endDate,
        });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getVehicleData = async (req, res) => {
    try {
        const date = req.query.date ? String(req.query.date).slice(0, 10) : null;
        const data = await LaboratoryTest.getVehicleData(req.params.vehicleNumber, date);
        const found = Boolean(data.gate || data.weighbridge || data.sampleCollection || (data.sealNumbers && data.sealNumbers.length > 0));
        res.json({ success: true, data, found });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getDataByRoute = async (req, res) => {
    try {
        const date = req.query.date ? String(req.query.date).slice(0, 10) : null;
        const data = await LaboratoryTest.getDataByRoute(req.query.routeNo, date);
        const found = Boolean(data.weighbridge || data.gate || data.sampleCollection || (data.vehicles && data.vehicles.length > 0) || (data.sealNumbers && data.sealNumbers.length > 0));
        res.json({ success: true, data, found });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};
