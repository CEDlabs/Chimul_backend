const Notifications = require("../models/notificationModel");

exports.list = async (req, res) => {
    try {
        const { department, unreadOnly, limit } = req.query;
        const userId = req.session.user.id || req.session.user.employeeId;
        const data = await Notifications.list(userId, { department, unreadOnly, limit });
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.listByDepartment = async (req, res) => {
    try {
        const { department } = req.params;
        const userId = req.session.user.id || req.session.user.employeeId;
        const data = await Notifications.listByDepartment(userId, department);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.markRead = async (req, res) => {
    try {
        const userId = req.session.user.id || req.session.user.employeeId;
        await Notifications.markRead(req.params.id, userId);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};
