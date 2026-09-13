const { validationResult } = require("express-validator");
const GateEntry = require("../models/gateEntryModel");
const AuditLog = require("../models/auditLogModel");
const { notifyWeighbridgeForGateEntry } = require("../utils/notifications");

exports.createGateEntry = async (req, res) => {
    try {
        const errors = validationResult(req);

        if (!errors.isEmpty()) {
            return res.status(400).json({
                success: false,
                errors: errors.array(),
            });
        }

        if (Array.isArray(req.body.sealNumbers) && req.body.sealNumbers.length > 0) {
            const invalid = req.body.sealNumbers
                .map(s => String(s).trim())
                .filter(s => s && !/^\d{6}$/.test(s));
            if (invalid.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: `Seal numbers must be exactly 6 digits: ${invalid.join(", ")}`,
                    invalidSeals: invalid,
                });
            }
        }

        const result = await GateEntry.create(req.body);

        // Notify weighbridge team about new gate entry
        try {
            await notifyWeighbridgeForGateEntry({ ...req.body, id: result.id });
        } catch (notifyErr) {
            console.error("Failed to send gate entry notification:", notifyErr);
        }

        res.status(201).json({
            success: true,
            message: "Gate Entry Saved Successfully",
            data: result,
        });

    } catch (err) {
        console.error("Create Gate Entry Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};

exports.getGateEntries = async (req, res) => {
    try {
        const { startDate, endDate, date, search } = req.query;
        const sDate = startDate || date;
        const eDate = endDate || date;

        const data = await GateEntry.getAll({ startDate: sDate, endDate: eDate, search });

        res.status(200).json({
            success: true,
            count: data.length,
            data,
        });
    } catch (err) {
        console.error("Get Gate Entries Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};

exports.getGateStats = async (req, res) => {
    try {
        const { startDate, endDate, date } = req.query;
        const sDate = startDate || date;
        const eDate = endDate || date;

        const stats = await GateEntry.getStats({ startDate: sDate, endDate: eDate });

        res.status(200).json({
            success: true,
            data: stats,
        });
    } catch (err) {
        console.error("Get Gate Stats Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};

exports.getRecentGateEntries = async (req, res) => {
    try {
        const { startDate, endDate, date, limit } = req.query;
        const sDate = startDate || date;
        const eDate = endDate || date;

        const entries = await GateEntry.getRecent({ startDate: sDate, endDate: eDate, limit });

        res.status(200).json({
            success: true,
            data: entries,
        });
    } catch (err) {
        console.error("Get Recent Gate Entries Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};

exports.updateGateEntry = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ success: false, message: "Gate entry ID is required." });
        }
        if (Array.isArray(req.body.sealNumbers) && req.body.sealNumbers.length > 0) {
            const invalid = req.body.sealNumbers
                .map(s => String(s).trim())
                .filter(s => s && !/^\d{6}$/.test(s));
            if (invalid.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: `Seal numbers must be exactly 6 digits: ${invalid.join(", ")}`,
                    invalidSeals: invalid,
                });
            }
        }
        const result = await GateEntry.update(id, req.body);
        res.json({ success: true, message: "Gate entry updated successfully.", data: result });
    } catch (err) {
        console.error("Update Gate Entry Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.deleteGateEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || req.body?.user || null;
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;

        await GateEntry.delete(id, user, ipAddress);

        res.status(200).json({
            success: true,
            message: "Gate entry deleted successfully",
        });
    } catch (err) {
        console.error("Delete Gate Entry Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};

exports.findByVehicleToday = async (req, res) => {
    try {
        const { vehicleNumber } = req.params;
        console.log(`[GateEntry] findByVehicleToday called for: ${vehicleNumber}`);
        if (!vehicleNumber) {
            return res.status(400).json({ success: false, message: "Vehicle number is required." });
        }
        const entry = await GateEntry.findTodayByVehicle(vehicleNumber);
        console.log(`[GateEntry] findByVehicleToday result:`, entry ? `found ${entry.driverName}` : "null");
        res.status(200).json({ success: true, data: entry });
    } catch (err) {
        console.error("Find Gate Entry By Vehicle Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.checkDuplicates = async (req, res) => {
    try {
        const { vehicleNumber, routeName, sealNumbers, date } = req.query;

        let parsedSeals = [];
        if (sealNumbers) {
            try {
                parsedSeals = JSON.parse(sealNumbers);
            } catch {
                parsedSeals = sealNumbers.split(",").map(s => s.trim());
            }
        }

        const result = await GateEntry.checkDuplicates({
            vehicleNumber,
            routeName,
            sealNumbers: parsedSeals,
            date
        });

        const hasAnyDuplicate = Boolean(
            result.duplicateVehicle || result.duplicateRouteVehicle ||
            result.duplicateSeals.length > 0 || result.invalidSeals.length > 0
        );

        res.status(200).json({
            success: true,
            hasDuplicate: hasAnyDuplicate,
            data: result
        });
    } catch (err) {
        console.error("Check Duplicates Error:", err);
        res.status(500).json({
            success: false,
            message: err.message
        });
    }
};

exports.getAuditLogs = async (req, res) => {
    try {
        const { module, action, startDate, endDate, search, page, limit } = req.query;

        const logs = await AuditLog.getAll({ module, action, startDate, endDate, search, page, limit });

        res.status(200).json({
            success: true,
            count: logs.length,
            data: logs,
        });
    } catch (err) {
        console.error("Get Audit Logs Error:", err);
        res.status(500).json({
            success: false,
            message: err.message,
        });
    }
};