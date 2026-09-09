const Fulfillment = require("../models/fulfillmentModel");

exports.create = async (req, res) => {
    try {
        const data = await Fulfillment.fulfill(req.body, req.session.user);
        res.status(201).json({ success: true, data });
    } catch (error) {
        const status = /required|exceed|not found|not active|enough|between|open|additive/i.test(error.message) ? 400 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.list = async (req, res) => {
    try { res.json({ success: true, data: await Fulfillment.list(req.params.requestId) }); }
    catch (error) { res.status(500).json({ success: false, message: error.message }); }
};
