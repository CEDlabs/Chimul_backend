const VehicleExit = require("../models/vehicleExitModel");

/**
 * POST /api/gate-entry/exit
 * Record a vehicle exit, update GateEntries status
 */
exports.recordVehicleExit = async (req, res) => {
    try {
        const { vehicleNumber, exitRemarks, exitCheckedBy, exitCheckedById, exitCheckedByEmail } = req.body;

        if (!vehicleNumber || !vehicleNumber.trim()) {
            return res.status(400).json({
                success: false,
                message: "Vehicle number is required."
            });
        }

        const sessionUser = req.session?.user || null;

        const exitUser = {
            employeeName: exitCheckedBy || sessionUser?.employeeName || "",
            employeeId: exitCheckedById || sessionUser?.employeeId || "",
            email: exitCheckedByEmail || sessionUser?.email || ""
        };

        const result = await VehicleExit.recordExit({
            vehicleNumber: vehicleNumber.trim().toUpperCase(),
            exitRemarks: exitRemarks || "",
            exitCheckedBy: exitUser.employeeName,
            exitCheckedById: exitUser.employeeId,
            exitCheckedByEmail: exitUser.email
        });

        res.status(201).json({
            success: true,
            message: `Vehicle ${result.vehicleNumber} exit recorded successfully.`,
            data: result
        });

    } catch (err) {
        console.error("Record Vehicle Exit Error:", err);

        const statusCode = err.message && err.message.startsWith("No active gate entry") ? 404 : 500;

        res.status(statusCode).json({
            success: false,
            message: err.message || "Failed to record vehicle exit."
        });
    }
};

/**
 * GET /api/gate-entry/exit/search?vehicleNumber=XX
 * Search for active (inside plant) vehicles
 */
exports.searchActiveVehicle = async (req, res) => {
    try {
        const { vehicleNumber } = req.query;

        if (!vehicleNumber || vehicleNumber.trim().length < 2) {
            return res.status(400).json({
                success: false,
                message: "Please provide at least 2 characters to search."
            });
        }

        const results = await VehicleExit.searchActive(vehicleNumber.trim().toUpperCase());

        res.status(200).json({
            success: true,
            count: results.length,
            data: results
        });

    } catch (err) {
        console.error("Search Active Vehicle Error:", err);
        res.status(500).json({
            success: false,
            message: err.message || "Search failed."
        });
    }
};

/**
 * GET /api/gate-entry/exit/records
 * Get all exit records with date filter
 */
exports.getExitRecords = async (req, res) => {
    try {
        const { startDate, endDate, date, search } = req.query;
        const sDate = startDate || date;
        const eDate = endDate || date;

        const records = await VehicleExit.getExitRecords({ startDate: sDate, endDate: eDate, search });

        res.status(200).json({
            success: true,
            count: records.length,
            data: records
        });

    } catch (err) {
        console.error("Get Exit Records Error:", err);
        res.status(500).json({
            success: false,
            message: err.message || "Failed to retrieve exit records."
        });
    }
};
