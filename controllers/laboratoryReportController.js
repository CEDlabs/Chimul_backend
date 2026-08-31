const LaboratoryReport = require("../models/laboratoryReportModel");

exports.getDaily = async (req, res) => {
    try {
        const data = await LaboratoryReport.getDailyReport(req.query.dates, req.query.routes);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getRoutes = async (req, res) => {
    try {
        const data = await LaboratoryReport.getRoutesForDate(req.query.date);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getFortnight = async (req, res) => {
    try {
        const data = await LaboratoryReport.getFortnightReport(req.query.startDate, req.query.endDate);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};
