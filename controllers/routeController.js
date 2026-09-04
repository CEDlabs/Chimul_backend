const Route = require("../models/routeModel");

exports.getAll = async (req, res) => {
    try {
        const routes = await Route.getAll();
        res.json({ success: true, count: routes.length, data: routes });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.create = async (req, res) => {
    try {
        const { routeName, taluk, description } = req.body;
        if (!routeName || !routeName.trim()) {
            return res.status(400).json({ success: false, message: "Route name is required." });
        }
        const user = req.session?.user || null;
        const result = await Route.create({ routeName, taluk, description }, user);
        res.status(201).json({ success: true, message: "Route created successfully.", data: result });
    } catch (error) {
        const status = error.message.includes("already exists") ? 409 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || null;
        const result = await Route.update(id, req.body, user);
        res.json({ success: true, message: "Route updated successfully.", data: result });
    } catch (error) {
        const status = error.message.includes("not found") ? 404 : error.message.includes("already exists") ? 409 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || null;
        const ipAddress = req.ip;
        await Route.remove(id, user, ipAddress);
        res.json({ success: true, message: "Route deleted successfully." });
    } catch (error) {
        const status = error.message.includes("not found") ? 404 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};
