const CIP = require("../models/cipModel");

exports.create = async (req, res) => {
    try {
        const data = await CIP.create(req.body);
        res.status(201).json({ success: true, message: "CIP cleaning recorded successfully.", data });
    } catch (error) {
        const status = /required|already|helper/i.test(error.message) ? 400 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.getByWBEntry = async (req, res) => {
    try {
        const data = await CIP.findByWBEntryId(req.params.wbEntryId);
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.pending = async (_req, res) => {
    try { res.json({ success: true, data: await CIP.listPending() }); }
    catch (error) { res.status(500).json({ success: false, message: error.message }); }
};

exports.list = async (req, res) => {
    try {
        const data = await CIP.list(req.query);
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};
