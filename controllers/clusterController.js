const Cluster = require("../models/clusterModel");

exports.getAll = async (req, res) => {
    try {
        const data = await Cluster.getAll({ bmcId: req.query.bmcId, routeName: req.query.route });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("Clusters list error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByBMC = async (req, res) => {
    try {
        const data = await Cluster.getByBMC(req.params.bmcId);
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("Clusters by-BMC error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByRoute = async (req, res) => {
    try {
        const data = await Cluster.getByRoute(req.params.routeName);
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("Clusters by-route error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.create = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await Cluster.create(req.body, user);
        res.status(201).json({ success: true, message: "Cluster created successfully.", data: result });
    } catch (error) {
        console.error("Clusters create error:", error);
        const code = error.status || (error.message.includes("already") ? 409 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await Cluster.update(req.params.id, req.body, user);
        res.json({ success: true, message: "Cluster updated successfully.", data: result });
    } catch (error) {
        console.error("Clusters update error:", error);
        const code = error.status || (error.message.includes("not found") ? 404 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;
        await Cluster.remove(req.params.id, user, ipAddress);
        res.json({ success: true, message: "Cluster removed successfully." });
    } catch (error) {
        console.error("Clusters delete error:", error);
        const code = error.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: error.message });
    }
};