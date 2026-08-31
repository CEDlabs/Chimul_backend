const MilkCollection = require("../models/milkCollectionModel");

exports.saveReport = async (req, res) => {
    try {
        const result = await MilkCollection.saveReport({
            ...req.body,
            enteredBy: req.session?.user?.employeeName || req.body.enteredBy,
            enteredByEmpId: req.session?.user?.employeeId || req.body.enteredByEmpId,
        });
        res.status(201).json({ success: true, message: "Milk collection report saved successfully.", data: result });
    } catch (error) {
        console.error("MilkCollection save error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByReport = async (req, res) => {
    try {
        const data = await MilkCollection.getByReport({
            reportDate: req.query.date,
            vehicleNumber: req.query.vehicleNumber,
        });
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        const isAdmin = ["admin", "management"].includes(department);
        res.json({ success: true, count: data.length, data, isLocked: data.length > 0 && !isAdmin });
    } catch (error) {
        console.error("MilkCollection get error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getDates = async (req, res) => {
    try {
        const data = await MilkCollection.getDates(req.query.vehicleNumber);
        res.json({ success: true, data });
    } catch (error) {
        console.error("MilkCollection dates error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getVehicleAndPrevious = async (req, res) => {
    try {
        const data = await MilkCollection.getVehicleAndPrevious(
            req.params.vehicleNumber,
            req.query.reportDate || req.query.date
        );
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        const isAdmin = ["admin", "management"].includes(department);
        res.json({
            success: true,
            data: {
                ...data,
                isLocked: !!data.reportId && !isAdmin,
            },
        });
    } catch (error) {
        console.error("MilkCollection vehicle lookup error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getMemberByCode = async (req, res) => {
    try {
        const member = await MilkCollection.getMemberByCode(req.params.memberCode);
        if (!member) {
            return res.status(404).json({ success: false, message: "Member not found." });
        }
        res.json({ success: true, data: member });
    } catch (error) {
        console.error("MilkCollection member lookup error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.checkMemberExists = async (req, res) => {
    try {
        const exists = await MilkCollection.memberExistsForVehicleDate({
            vehicleNumber: req.query.vehicleNumber,
            reportDate: req.query.date,
            memberCode: req.query.memberCode,
        });
        res.json({ success: true, exists });
    } catch (error) {
        console.error("MilkCollection member exists error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.updateReport = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        if (!["admin", "management"].includes(department)) {
            return res.status(403).json({ success: false, message: "Only admin/management can update a saved report." });
        }
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;
        const result = await MilkCollection.updateReport(
            {
                ...req.body,
                enteredBy: req.session?.user?.employeeName || req.body.enteredBy,
                enteredByEmpId: req.session?.user?.employeeId || req.body.enteredByEmpId,
            },
            user,
            ipAddress
        );
        res.json({ success: true, message: "Milk collection report updated successfully.", data: result });
    } catch (error) {
        console.error("MilkCollection update error:", error);
        const code = error.message.includes("not found") ? 404 : error.message.includes("Only admin") ? 403 : 500;
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.deleteReport = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const department = (user?.department || "").trim().toLowerCase();
        if (!["admin", "management"].includes(department)) {
            return res.status(403).json({ success: false, message: "Only admin/management can delete a saved report." });
        }
        const { reportId } = req.query;
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;
        await MilkCollection.deleteReport(reportId, user, ipAddress);
        res.json({ success: true, message: "Milk collection report deleted successfully." });
    } catch (error) {
        const code = error.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: error.message });
    }
};
