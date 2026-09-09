const ProductRequest = require("../models/productRequestModel");

const execute = (operation) => async (req, res) => {
    try {
        const data = await operation(req);
        res.json({ success: true, data });
    } catch (error) {
        const status = /required|greater|cancelled|not found/i.test(error.message) ? 400 : 500;
        res.status(status).json({ success: false, message: error.message });
    }
};

exports.list = execute(() => ProductRequest.list());
exports.create = execute((req) => ProductRequest.create(req.body, req.session.user));
exports.cancel = execute((req) => ProductRequest.cancel(req.params.id));
exports.listProducts = execute(() => ProductRequest.listProducts());
exports.createProduct = execute((req) => ProductRequest.createProduct(req.body, req.session.user));
exports.updateProduct = execute((req) => ProductRequest.updateProduct(req.params.id, req.body, req.session.user));
