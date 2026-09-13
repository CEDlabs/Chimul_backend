const Taluk = require("../models/talukModel");

exports.list = async (req, res) => {
    try {
        const data = await Taluk.getAll();
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getRoutes = async (req, res) => {
    try {
        const data = await Taluk.getRoutesByTaluk(req.params.talukName);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.create = async (req, res) => {
    try {
        const data = await Taluk.create(req.body, req.user);
        res.json({ success: true, data });
    } catch (error) {
        res.status(400).json({ success: false, message: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const data = await Taluk.update(req.params.id, req.body, req.user);
        res.json({ success: true, data });
    } catch (error) {
        res.status(400).json({ success: false, message: error.message });
    }
};

exports.assignRoutes = async (req, res) => {
    try {
        const data = await Taluk.assignRoutes(req.params.talukName, req.body.routes, req.user);
        res.json({ success: true, data });
    } catch (error) {
        res.status(400).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        await Taluk.remove(req.params.id, req.user, req.ip);
        res.json({ success: true, message: "Taluk deleted." });
    } catch (error) {
        res.status(400).json({ success: false, message: error.message });
    }
};