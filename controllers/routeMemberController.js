const RouteMember = require("../models/routeMemberModel");

exports.getAll = async (req, res) => {
    try {
        const data = await RouteMember.getAll({ routeName: req.query.route });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("RouteMembers list error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByRoute = async (req, res) => {
    try {
        const data = await RouteMember.getByRoute(req.params.routeName);
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        console.error("RouteMembers by-route error:", error);
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.create = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await RouteMember.create(req.body, user);
        res.status(201).json({ success: true, message: "Member added to route successfully.", data: result });
    } catch (error) {
        console.error("RouteMembers create error:", error);
        const code = error.status || (error.message.includes("already") ? 409 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const result = await RouteMember.update(req.params.id, req.body, user);
        res.json({ success: true, message: "Member updated successfully.", data: result });
    } catch (error) {
        console.error("RouteMembers update error:", error);
        const code = error.status || (error.message.includes("not found") ? 404 : 500);
        res.status(code).json({ success: false, message: error.message });
    }
};

exports.remove = async (req, res) => {
    try {
        const user = req.session?.user || null;
        const ipAddress = req.headers["x-forwarded-for"] || req.socket?.remoteAddress || null;
        await RouteMember.remove(req.params.id, user, ipAddress);
        res.json({ success: true, message: "Member removed from route successfully." });
    } catch (error) {
        console.error("RouteMembers delete error:", error);
        const code = error.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: error.message });
    }
};