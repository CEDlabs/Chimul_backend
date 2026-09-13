const BMC = require("../models/bmcModel");

exports.getAll = async (req, res) => {
    try {
        const data = await BMC.getAll({ routeName: req.query.route });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("BMCs list error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByRoute = async (req, res) => {
    try {
        const data = await BMC.getByRoute(req.params.routeName);
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("BMCs by-route error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.create = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await BMC.create(req.body, user);
        res.status(201).json({ success: true, message: "BMC added to route successfully.", data: result });
    } catch (error) {
        console.error("BMCs create error:", error);
        const code = error.status || (error.message.includes("already") ? 409 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await BMC.update(req.params.id, req.body, user);
        res.json({ success: true, message: "BMC updated successfully.", data: result });
    } catch (error) {
        console.error("BMCs update error:", error);
        const code = error.status || (error.message.includes("not found") ? 404 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;
        await BMC.remove(req.params.id, user, ipAddress);
        res.json({ success: true, message: "BMC removed from route successfully." });
    } catch (error) {
        console.error("BMCs delete error:", error);
        const code = error.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: error.message });
    }
};