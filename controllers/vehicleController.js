const Vehicle = require("../models/vehicleModel");

exports.lookupVehicle = async (req, res) => {
    try {
        const { vehicleNumber } = req.params;
        if (!vehicleNumber || vehicleNumber.trim().length < 2) {
            return res.status(400).json({ success: false, message: "Vehicle number too short." });
        }
        const vehicle = await Vehicle.findByNumber(vehicleNumber.trim().toUpperCase());
        if (!vehicle) {
            return res.status(404).json({ success: false, message: "Vehicle not registered.", data: null });
        }
        res.json({ success: true, data: vehicle });
    } catch (err) {
        console.error("Vehicle Lookup Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.registerVehicle = async (req, res) => {
    try {
        if (!req.body.vehicleNumber || !req.body.vehicleNumber.trim()) {
            return res.status(400).json({ success: false, message: "Vehicle number is required." });
        }
        const user = req.session?.user || req.body?.createdBy || null;
        const result = await Vehicle.register({ ...req.body, createdBy: user });
        const message = result.action === "updated"
            ? "Vehicle details updated for the selected date."
            : "Vehicle registered successfully.";
        res.status(201).json({ success: true, message, data: result });
    } catch (err) {
        console.error("Vehicle Register Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.getAllVehicles = async (req, res) => {
    try {
        const data = await Vehicle.getAll();
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("Vehicle List Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.checkDuplicates = async (req, res) => {
    try {
        const { vehicleNumber, routeName, serialNumbers, allocationDate, excludeId } = req.query;

        let parsedSerials = [];
        if (serialNumbers) {
            try {
                parsedSerials = JSON.parse(serialNumbers);
            } catch {
                parsedSerials = serialNumbers.split(",").map(s => s.trim());
            }
        }

        const result = await Vehicle.checkDuplicates({
            vehicleNumber,
            routeName,
            serialNumbers: parsedSerials,
            allocationDate,
            excludeId
        });

        const hasAnyDuplicate = result.duplicateVehicle || result.duplicateRoute || result.duplicateSerials.length > 0;

        res.status(200).json({
            success: true,
            hasDuplicate: hasAnyDuplicate,
            data: result
        });
    } catch (err) {
        console.error("Vehicle Check Duplicates Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.deleteVehicle = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ success: false, message: "Vehicle record id is required." });
        }
        const user = req.session?.user || req.body?.user || null;
        const result = await Vehicle.remove(id, user);
        res.json({ success: true, message: "Vehicle record deleted successfully.", data: result });
    } catch (err) {
        console.error("Vehicle Delete Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};
