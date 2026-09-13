const WB = require("../models/weighBridgeModel");
const { notifySampleAndLabForWeighbridge } = require("../utils/notifications");

const getUserInfo = (req) => ({
    createdByName: req.session?.user?.employeeName || req.body.createdByName || "",
    createdByEmpId: req.session?.user?.employeeId || req.body.createdByEmpId || ""
});

// POST /api/waybridge/entry  — Step 1: Save gross weight
exports.createEntry = async (req, res) => {
    try {
        const { vehicleNumber, grossWeight } = req.body;
        if (!vehicleNumber || !grossWeight) {
            return res.status(400).json({ success: false, message: "vehicleNumber and grossWeight are required." });
        }
        const data = { ...req.body, ...getUserInfo(req) };
        const result = await WB.create(data);
        res.status(201).json({ success: true, message: "Gross weight saved. Proceed to dump.", data: result });
    } catch (err) {
        console.error("WB Create Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// PUT /api/waybridge/intermediate/:wbEntryId  — Step 2: Add intermediate weight
exports.saveIntermediate = async (req, res) => {
    try {
        const { wbEntryId } = req.params;
        const { weight, dumpPosition, captureMode } = req.body;
        if (!weight) return res.status(400).json({ success: false, message: "weight is required." });
        const result = await WB.saveIntermediate(wbEntryId, { weight, dumpPosition, mode: captureMode });
        res.json({ success: true, message: `Intermediate weight ${result.intermediateCount} saved.`, data: result });
    } catch (err) {
        console.error("WB Intermediate Error:", err);
        const code = err.message.includes("not found") ? 404 : err.message.includes("Maximum") ? 400 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};

// PUT /api/waybridge/tare/:wbEntryId  — Step 3: Save tare weight, calculate net
exports.saveTare = async (req, res) => {
    try {
        const { wbEntryId } = req.params;
        const { tareWeight, captureMode } = req.body;
        if (!tareWeight) return res.status(400).json({ success: false, message: "tareWeight is required." });
        const result = await WB.saveTare(wbEntryId, tareWeight, captureMode);

        // Notify sample collection and laboratory teams
        try {
            await notifySampleAndLabForWeighbridge(result);
        } catch (notifyErr) {
            console.error("Failed to send weighbridge notification:", notifyErr);
        }

        res.json({ success: true, message: "Tare weight saved. Entry completed.", data: result });
    } catch (err) {
        console.error("WB Tare Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// GET /api/waybridge/active/:vehicleNumber  — Check active session
exports.findActive = async (req, res) => {
    try {
        const result = await WB.findActive(req.params.vehicleNumber);
        res.json({ success: true, data: result });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
};

// GET /api/waybridge/today-completed/:vehicleNumber  — Check if vehicle already completed today
exports.findTodayCompleted = async (req, res) => {
    try {
        const result = await WB.findTodayCompleted(req.params.vehicleNumber);
        res.json({ success: true, data: result });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
};

// GET /api/waybridge/records
exports.getRecords = async (req, res) => {
    try {
        const { startDate, endDate, date, search } = req.query;
        const data = await WB.getAll({ startDate: startDate || date, endDate: endDate || date, search });
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("WB Records Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// DELETE /api/waybridge/:id
exports.deleteEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || null;
        const ipAddress = req.ip;
        await WB.remove(id, user, ipAddress);
        res.json({ success: true, message: "WeighBridge entry deleted successfully." });
    } catch (err) {
        console.error("WB Delete Error:", err);
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};

// PUT /api/waybridge/:id
exports.updateEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const result = await WB.update(id, req.body);
        res.json({ success: true, message: "WeighBridge entry updated successfully.", data: result });
    } catch (err) {
        console.error("WB Update Error:", err);
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};
