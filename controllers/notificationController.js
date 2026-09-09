const Notifications = require("../models/notificationModel");

exports.list = async (req, res) => {
    try { res.json({ success: true, data: await Notifications.list(req.session.user.id || req.session.user.employeeId) }); }
    catch (error) { res.status(500).json({ success: false, message: error.message }); }
};

exports.markRead = async (req, res) => {
    try { await Notifications.markRead(req.params.id, req.session.user.id || req.session.user.employeeId); res.json({ success: true }); }
    catch (error) { res.status(500).json({ success: false, message: error.message }); }
};
