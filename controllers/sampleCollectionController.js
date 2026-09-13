const { validationResult } = require("express-validator");
const SampleCollection = require("../models/sampleCollectionModel");
const Vehicle = require("../models/vehicleModel");
const VehicleCatalog = require("../models/vehicleCatalogModel");
const AlternativeVehicle = require("../models/alternativeVehicleModel");
const { notifyWeighbridgeForSampleCollection } = require("../utils/notifications");

const getTodayISO = () => new Date().toISOString().slice(0, 10);

const toDateStr = (v) => {
    if (!v) return null;
    if (v instanceof Date) {
        if (isNaN(v.getTime())) return null;
        const y = v.getFullYear();
        const m = String(v.getMonth() + 1).padStart(2, "0");
        const d = String(v.getDate()).padStart(2, "0");
        return `${y}-${m}-${d}`;
    }
    return String(v).slice(0, 10);
};

exports.create = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const errorMsg = errors.array().map((e) => e.msg || `${e.path}: invalid`).join(", ");
        return res.status(400).json({ success: false, message: `Validation error: ${errorMsg}`, errors: errors.array() });
    }
    try {
        const result = await SampleCollection.create({
            ...req.body,
            sampleCollectedBy: req.session?.user?.employeeName || req.body.sampleCollectedBy,
            sampleCollectedByEmpId: req.session?.user?.employeeId || req.body.sampleCollectedByEmpId,
        });

        // Notify weighbridge team about sample collection completion
        try {
            await notifyWeighbridgeForSampleCollection({ ...req.body, id: result.id, compartments: req.body.compartments });
        } catch (notifyErr) {
            console.error("Failed to send sample collection notification:", notifyErr);
        }

        res.status(201).json({ success: true, message: "Sample collection saved successfully.", data: result });
    } catch (error) {
        const isDuplicate = error.message && error.message.includes("already exists");
        const status = isDuplicate || error.number === 2627 || error.number === 2601 ? 409 : 500;
        res.status(status).json({ success: false, message: status === 409 ? error.message : error.message });
    }
};

exports.getAll = async (req, res) => {
    try {
        const { vehicleNumber, routeNo, startDate, endDate, search, utcOffsetMinutes } = req.query;
        const data = await SampleCollection.getAll({ vehicleNumber, routeNo, startDate, endDate, search, utcOffsetMinutes });
        res.json({ success: true, count: data.length, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getCompartments = async (req, res) => {
    try {
        const rows = await SampleCollection.getCompartments(req.params.sampleId);
        res.json({ success: true, data: rows });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getByVehicleAndDate = async (req, res) => {
    try {
        const data = await SampleCollection.getByVehicleAndDate(
            req.params.vehicleNumber,
            req.query.date,
            req.query.utcOffsetMinutes
        );
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.getVehicleData = async (req, res) => {
    try {
        const data = await SampleCollection.getVehicleData(req.params.vehicleNumber);

        // Attach Lab allocation data (date-aware for today) + alternative vehicle
        // + replaced seals, so Sample Collection can show the same details as the
        // other departments.
        let allocation = null;
        try {
            const vNum = String(req.params.vehicleNumber || "").trim().toUpperCase();
            const today = getTodayISO();
            const todayVehicle = await Vehicle.findByNumberAndDate(vNum, today);
            const latestVehicle = todayVehicle ? null : await Vehicle.findByNumber(vNum);
            const alt = await AlternativeVehicle.findActiveForVehicle(vNum, today);

            // Active alternative window → resolve the effective (alternative)
            // vehicle's seals/details while keeping the searched plate as the
            // vehicle number so the actual truck is preserved.
            if (alt) {
                const altRec = await Vehicle.findByNumberAndDate(alt.alternativeVehicleNumber, today)
                    || await Vehicle.findByNumber(alt.alternativeVehicleNumber);
                const primRec = await Vehicle.findByNumberAndDate(alt.primaryVehicleNumber, today)
                    || await Vehicle.findByNumber(alt.primaryVehicleNumber);
                const altCatalog = await VehicleCatalog.findByNumber(alt.primaryVehicleNumber)
                    || await VehicleCatalog.findByNumber(alt.alternativeVehicleNumber);
                const activeSerials = (altRec && altRec.serialNumbers) || [];
                const retiredSerials = Array.from(new Set([
                    ...((altRec && altRec.retiredSerials) || []),
                    ...((primRec && primRec.retiredSerials) || []),
                ]));
                const activeDate = toDateStr(altRec && altRec.allocationDate) || today;

                allocation = {
                    id: altRec?.id || null,
                    vehicleNumber: vNum,
                    primaryVehicleNumber: alt.primaryVehicleNumber,
                    alternativeVehicleNumber: alt.alternativeVehicleNumber,
                    vehicleType: (altCatalog && altCatalog.vehicleType) || "Tanker",
                    routeName: alt.routeName,
                    allocationDate: activeDate,
                    allocatedOnDate: activeDate,
                    searchedDate: today,
                    serialNumbers: activeSerials,
                    alternativeVehicleSerials: (primRec && primRec.serialNumbers) || [],
                    retiredSerials,
                    isAlternative: true,
                    alternativeValidFrom: alt.fromDate,
                    alternativeValidTo: alt.toDate,
                    notAllocatedOnDate: activeDate !== today,
                };
            } else if (todayVehicle || latestVehicle) {
                const base = todayVehicle || latestVehicle || {};
                if (!todayVehicle && latestVehicle) {
                    allocation = {
                        ...base,
                        notAllocatedOnDate: true,
                        searchedDate: today,
                        allocatedOnDate: toDateStr(latestVehicle.allocationDate),
                    };
                } else if (todayVehicle) {
                    allocation = { ...base, notAllocatedOnDate: false, searchedDate: today };
                } else {
                    allocation = base;
                }
            }
        } catch (err) {
            console.warn("[SampleCollection] allocation lookup failed:", err.message);
        }

        res.json({ success: true, data: { ...data, allocation }, found: Boolean(data.gate || data.weighbridge) });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

exports.deleteEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || null;
        const ipAddress = req.ip;
        await SampleCollection.remove(id, user, ipAddress);
        res.json({ success: true, message: "Sample collection entry deleted successfully." });
    } catch (err) {
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};

exports.updateEntry = async (req, res) => {
    try {
        const { id } = req.params;
        const result = await SampleCollection.update(id, req.body);
        res.json({ success: true, message: "Sample collection entry updated successfully.", data: result });
    } catch (err) {
        const code = err.message.includes("not found") ? 404 : 500;
        res.status(code).json({ success: false, message: err.message });
    }
};
