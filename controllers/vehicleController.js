const Vehicle = require("../models/vehicleModel");
const AlternativeVehicle = require("../models/alternativeVehicleModel");
const VehicleCatalog = require("../models/vehicleCatalogModel");

const getTodayISO = () => new Date().toISOString().slice(0, 10);

// Safely convert a DB date value (JS Date object or string) to YYYY-MM-DD.
// mysql2 returns DATE columns as local JS Date objects; String(date).slice(0,10)
// would yield "Fri Sep 04" instead of "2026-09-04", breaking date comparisons.
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

exports.lookupVehicle = async (req, res) => {
    try {
        const { vehicleNumber } = req.params;
        if (!vehicleNumber || String(vehicleNumber).trim().length < 2) {
            return res.status(400).json({ success: false, message: "Vehicle number too short." });
        }
        const vNum = vehicleNumber.trim().toUpperCase();
        const searchDate = String(req.query.date || getTodayISO()).slice(0, 10);

        // Date-aware: first look for a Lab allocation on the search date.
        let vehicle = await Vehicle.findByNumberAndDate(vNum, searchDate);
        let latestVehicle = vehicle ? null : await Vehicle.findByNumber(vNum);

        if (!vehicle && latestVehicle) {
            const latestDate = toDateStr(latestVehicle.allocationDate);
            // No allocation on the search date → surface the latest record so the
            // frontend can show its data but warn it is not for the searched date.
            vehicle = {
                ...latestVehicle,
                notAllocatedOnDate: true,
                searchedDate: searchDate,
                allocationDate: latestDate,
                allocatedOnDate: latestDate,
            };
        }

        // Resolve alternative-vehicle window (as primary OR alternative).
        const alt = await AlternativeVehicle.findActiveForVehicle(vNum, searchDate);

        // Resolve alternative-vehicle window (as primary OR alternative). When an
        // active window exists the searched number is a member of it; surface the
        // effective (alternative) vehicle's seals/details while keeping the searched
        // plate as vehicleNumber so the actual truck number is preserved.
        if (alt) {
            const altRec = await Vehicle.findByNumberAndDate(alt.alternativeVehicleNumber, searchDate)
                || await Vehicle.findByNumber(alt.alternativeVehicleNumber);
            const primRec = await Vehicle.findByNumberAndDate(alt.primaryVehicleNumber, searchDate)
                || await Vehicle.findByNumber(alt.primaryVehicleNumber);
            const altCatalog = await VehicleCatalog.findByNumber(alt.primaryVehicleNumber)
                || await VehicleCatalog.findByNumber(alt.alternativeVehicleNumber);
            const activeSerials = (altRec && altRec.serialNumbers) || [];
            const retiredSerials = Array.from(new Set([
                ...((altRec && altRec.retiredSerials) || []),
                ...((primRec && primRec.retiredSerials) || []),
            ]));
            const sealChangeHistory = [
                ...((altRec && altRec.sealChangeHistory) || []),
                ...((primRec && primRec.sealChangeHistory) || []),
            ];
            const activeDate = toDateStr(altRec && altRec.allocationDate) || searchDate;

            vehicle = {
                id: altRec?.id || null,
                vehicleNumber: vNum,
                primaryVehicleNumber: alt.primaryVehicleNumber,
                alternativeVehicleNumber: alt.alternativeVehicleNumber,
                vehicleType: (altCatalog && altCatalog.vehicleType) || "Tanker",
                routeName: alt.routeName,
                allocationDate: activeDate,
                allocatedOnDate: activeDate,
                searchedDate: searchDate,
                serialNumbers: activeSerials,
                alternativeVehicleSerials: (primRec && primRec.serialNumbers) || [],
                retiredSerials,
                sealChangeHistory,
                isAlternative: true,
                alternativeValidFrom: alt.fromDate,
                alternativeValidTo: alt.toDate,
                notAllocatedOnDate: activeDate !== searchDate,
            };
        }

        if (!vehicle) {
            return res.status(404).json({ success: false, message: "Vehicle not registered.", data: null });
        }
        res.json({ success: true, data: vehicle });
    } catch (err) {
        console.error("Vehicle Lookup Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// ── Master vehicle list (catalog). Read for everyone, write for admin/dept-admin ──
exports.getVehicleCatalog = async (req, res) => {
    try {
        const data = await VehicleCatalog.getAll();
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("List Vehicle Catalog Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// Distinct routes (with primary vehicle) from the master vehicle list.
// Shared source of truth for the route dropdowns in every department.
exports.getRoutes = async (req, res) => {
    try {
        const data = await VehicleCatalog.getAllRoutes();
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("List Routes Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.createVehicleCatalog = async (req, res) => {
    try {
        const user = req.session?.user || req.body?.createdBy || null;
        const vehicleNumber = String(req.body.vehicleNumber || "").trim().toUpperCase();
        const routeName = String(req.body.routeName || "").trim();

        // Cross-table check: a vehicle already in an active Route Alternative
        // window (primary or alternative) cannot be added to the Master List
        // unless that window was deleted.
        if (vehicleNumber) {
            const altRef = await AlternativeVehicle.findByVehicleNumber(vehicleNumber);
            if (altRef) {
                const err = new Error(
                    `Vehicle ${vehicleNumber} is already used in the Route Alternative Vehicle list on route ${altRef.routeName} (${altRef.alternativeVehicleNumber}, ${(altRef.fromDate || "").slice(0, 10)} to ${(altRef.toDate || "").slice(0, 10)}). ` +
                    `Delete the alternative window first (or it may have been deleted) before adding it to the Master Vehicle List.`
                );
                err.status = 409;
                throw err;
            }
        }

        const data = await VehicleCatalog.create({ ...req.body, createdBy: user }, user);
        res.status(201).json({
            success: true,
            message: "Vehicle added to the master vehicle list.",
            data,
        });
    } catch (err) {
        console.error("Create Vehicle Catalog Error:", err);
        res.status(err.status || 500).json({ success: false, message: err.message });
    }
};

exports.checkCatalogVehicle = async (req, res) => {
    try {
        const { vehicleNumber } = req.query;
        const vNum = String(vehicleNumber || "").trim().toUpperCase();
        if (!vNum) {
            return res.status(400).json({ success: false, message: "Vehicle number is required." });
        }
        const entry = await VehicleCatalog.findByNumber(vNum);
        res.json({
            success: true,
            data: entry
                ? { vehicleNumber: entry.vehicleNumber, routeName: entry.routeName, vehicleType: entry.vehicleType, inMasterList: true }
                : { inMasterList: false },
        });
    } catch (err) {
        console.error("Check Catalog Vehicle Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.deleteVehicleCatalog = async (req, res) => {
    try {
        const { id } = req.params;
        const user = req.session?.user || req.body?.user || null;
        const data = await VehicleCatalog.remove(id, user);
        res.json({ success: true, message: "Vehicle removed from the master vehicle list.", data });
    } catch (err) {
        console.error("Delete Vehicle Catalog Error:", err);
        res.status(err.status || 500).json({ success: false, message: err.message });
    }
};

exports.registerVehicle = async (req, res) => {
    try {
        if (!req.body.vehicleNumber || !req.body.vehicleNumber.trim()) {
            return res.status(400).json({ success: false, message: "Vehicle number is required." });
        }
        if (req.body.serialNumbers) {
            const serials = Array.isArray(req.body.serialNumbers)
                ? req.body.serialNumbers
                : [req.body.serialNumbers];
            const invalid = serials.map(s => String(s).trim()).filter(s => s && !/^\d{6}$/.test(s));
            if (invalid.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: `Seal numbers must be exactly 6 digits: ${invalid.join(", ")}`,
                    invalidSerials: invalid,
                });
            }
        }
        const user = req.session?.user || req.body?.createdBy || null;
        const result = await Vehicle.register({ ...req.body, createdBy: user });
        const message = result.action === "updated"
            ? "Vehicle details updated for the selected date."
            : "Vehicle registered successfully.";
        res.status(201).json({ success: true, message, data: result });
    } catch (err) {
        console.error("Vehicle Register Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.getAllVehicles = async (req, res) => {
    try {
        const data = await Vehicle.getAll();
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("Vehicle List Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.checkDuplicates = async (req, res) => {
    try {
        const { vehicleNumber, routeName, serialNumbers, allocationDate, excludeId, checkOnlyNew } = req.query;

        let parsedSerials = [];
        if (serialNumbers) {
            try {
                parsedSerials = JSON.parse(serialNumbers);
            } catch {
                parsedSerials = serialNumbers.split(",").map(s => s.trim());
            }
        }

        const result = await Vehicle.checkDuplicates({
            vehicleNumber,
            routeName,
            serialNumbers: parsedSerials,
            allocationDate,
            excludeId,
            checkOnlyNew: checkOnlyNew === true || checkOnlyNew === "true"
        });

        const hasAnyDuplicate = Boolean(
            result.duplicateVehicle || result.duplicateRoute ||
            result.duplicateSerials.length > 0 || result.invalidSerials.length > 0
        );

        res.status(200).json({
            success: true,
            hasDuplicate: hasAnyDuplicate,
            data: result
        });
    } catch (err) {
        console.error("Vehicle Check Duplicates Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.deleteVehicle = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ success: false, message: "Vehicle record id is required." });
        }
        const user = req.session?.user || req.body?.user || null;
        const result = await Vehicle.remove(id, user);
        res.json({ success: true, message: "Vehicle record deleted successfully.", data: result });
    } catch (err) {
        console.error("Vehicle Delete Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// ── Routes with an allocated vehicle on a given date (with alt-window resolution) ──
exports.getAllocatedRoutes = async (req, res) => {
    try {
        const date = req.query.date || getTodayISO();
        const vehicles = await Vehicle.listAllocatedRoutes(date);
        const activeWindows = await AlternativeVehicle.getActiveForDate(date);
        const activeMap = {};
        for (const w of activeWindows) activeMap[w.routeName] = w;

        const data = vehicles.map((v) => {
            const alt = activeMap[v.routeName];
            if (alt) {
                return {
                    routeName: v.routeName,
                    vehicleNumber: alt.alternativeVehicleNumber,
                    primaryVehicleNumber: v.vehicleNumber,
                    vehicleType: v.vehicleType,
                    allocationDate: v.allocationDate,
                    serialNumbers: v.serialNumbers,
                    isAlternative: true,
                    alternativeValidFrom: alt.fromDate,
                    alternativeValidTo: alt.toDate,
                };
            }
            return {
                routeName: v.routeName,
                vehicleNumber: v.vehicleNumber,
                vehicleType: v.vehicleType,
                allocationDate: v.allocationDate,
                serialNumbers: v.serialNumbers,
                isAlternative: false,
            };
        });

        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("Allocated Routes Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.getByRoute = async (req, res) => {
    try {
        const { routeName } = req.params;
        const date = String(req.query.date || getTodayISO()).slice(0, 10);
        if (!routeName || !routeName.trim()) {
            return res.status(400).json({ success: false, message: "Route name is required." });
        }

        const alt = await AlternativeVehicle.findActiveForRoute(routeName.trim(), date);
        const meta = { mode: "primary" };

        // 1. Resolve the effective vehicle number for this route on the search date.
        let vehicleNumber = null;
        let isAlternative = false;
        let primaryVehicleNumber = null;
        let vehicleType = "Tanker";
        let routeResolved = routeName.trim();

        if (alt) {
            vehicleNumber = alt.alternativeVehicleNumber;
            primaryVehicleNumber = alt.primaryVehicleNumber;
            isAlternative = true;
            meta.mode = "alternative";
            meta.alternativeValidFrom = alt.fromDate;
            meta.alternativeValidTo = alt.toDate;
            meta.primaryVehicleNumber = alt.primaryVehicleNumber;
            meta.remarks = alt.remarks;
            // Resolve the vehicle type from the route's master-list entry (primary
            // vehicle), falling back to a lookup by either vehicle number.
            const routeCatalog = await VehicleCatalog.getByRoute(routeName.trim())
                || await VehicleCatalog.findByNumber(alt.primaryVehicleNumber)
                || await VehicleCatalog.findByNumber(alt.alternativeVehicleNumber);
            vehicleType = (routeCatalog && routeCatalog.vehicleType) || "Tanker";
        } else {
            const allocated = await Vehicle.findPrimaryByRoute(routeName.trim(), date);
            if (allocated) {
                vehicleNumber = allocated.vehicleNumber;
                vehicleType = allocated.vehicleType || "Tanker";
            } else {
                // Fall back to the Master Vehicle List for this route.
                const catalogEntry = await VehicleCatalog.getByRoute(routeName.trim());
                if (catalogEntry) {
                    vehicleNumber = catalogEntry.vehicleNumber;
                    vehicleType = catalogEntry.vehicleType || "Tanker";
                    routeResolved = catalogEntry.routeName || routeName.trim();
                }
            }
        }

        if (!vehicleNumber) {
            return res.status(404).json({ success: false, message: "No vehicle allocated for this route on the selected date or in the master vehicle list.", data: null });
        }

        // 2. Fetch seals from the Vehicles table for the exact search date.
        let allocated = await Vehicle.findByNumberAndDate(vehicleNumber, date);
        let notAllocatedOnDate = false;
        let allocationDate = date;
        if (!allocated) {
            // No allocation for the exact date → use the latest record (if any)
            // and flag it so the user knows it is not for the searched date.
            const latest = await Vehicle.findByNumber(vehicleNumber);
            if (latest) {
                allocated = latest;
                allocationDate = toDateStr(latest.allocationDate);
                notAllocatedOnDate = allocationDate !== date;
            }
        }

        let serialNumbers = (allocated && allocated.serialNumbers) || [];
        let retiredSerials = (allocated && allocated.retiredSerials) || [];
        let sealChangeHistory = (allocated && allocated.sealChangeHistory) || [];
        let alternativeVehicleSerials = [];

        // When an active alternative window exists, also merge the primary
        // vehicle's record so both the alternative seal numbers and the
        // primary (replaced) seal numbers are available.
        if (alt) {
            const primAlloc = await Vehicle.findByNumberAndDate(alt.primaryVehicleNumber, date)
                || await Vehicle.findByNumber(alt.primaryVehicleNumber);
            if (primAlloc) {
                alternativeVehicleSerials = (primAlloc.serialNumbers || []).slice();
                retiredSerials = Array.from(new Set([
                    ...retiredSerials,
                    ...((primAlloc.retiredSerials) || []),
                ]));
                sealChangeHistory = [
                    ...(sealChangeHistory || []),
                    ...(primAlloc.sealChangeHistory || []),
                ];
            }
        }

        const vehicle = {
            id: allocated?.id || null,
            vehicleNumber,
            primaryVehicleNumber,
            alternativeVehicleNumber: alt ? alt.alternativeVehicleNumber : null,
            vehicleType,
            routeName: routeResolved,
            allocationDate: allocationDate,
            allocatedOnDate: allocationDate,
            searchedDate: date,
            serialNumbers,
            alternativeVehicleSerials,
            retiredSerials,
            sealChangeHistory,
            isAlternative,
            fromMasterList: !allocated ? true : undefined,
            notAllocatedOnDate,
            ...(alt ? { alternativeValidFrom: alt.fromDate, alternativeValidTo: alt.toDate } : {}),
        };

        res.json({ success: true, data: { ...vehicle, alternative: meta } });
    } catch (err) {
        console.error("Vehicle By Route Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

// ── Route Alternative Vehicle windows (admin/dept-admin only for write) ──
exports.getAlternativeWindows = async (req, res) => {
    try {
        const data = await AlternativeVehicle.getAll();
        res.json({ success: true, count: data.length, data });
    } catch (err) {
        console.error("List Route Alternatives Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};

exports.createAlternativeWindow = async (req, res) => {
    try {
        const user = req.session?.user || req.body?.createdBy || null;

        // Cross-table check: the alternative vehicle number cannot already be in
        // the (non-deleted) Master Vehicle List.
        const altVehicle = String(req.body.alternativeVehicleNumber || "").trim().toUpperCase();
        if (altVehicle) {
            const catEntry = await VehicleCatalog.findByNumber(altVehicle);
            if (catEntry) {
                const err = new Error(
                    `Alternative vehicle ${altVehicle} is already in the Master Vehicle List and allocated to route ${catEntry.routeName || "—"}. ` +
                    `Delete it from the Master List first (or it may have been deleted) before scheduling it as an alternative vehicle.`
                );
                err.status = 409;
                throw err;
            }
        }

        const data = await AlternativeVehicle.create({ ...req.body, createdBy: user });
        res.status(201).json({
            success: true,
            message: "Alternative vehicle window created successfully.",
            data,
        });
    } catch (err) {
        console.error("Create Route Alternative Error:", err);
        res.status(err.status || 500).json({ success: false, message: err.message });
    }
};

exports.deleteAlternativeWindow = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ success: false, message: "Window id is required." });
        }
        const user = req.session?.user || req.body?.user || null;
        const data = await AlternativeVehicle.remove(id, user);
        res.json({ success: true, message: "Alternative vehicle window deleted successfully.", data });
    } catch (err) {
        console.error("Delete Route Alternative Error:", err);
        res.status(500).json({ success: false, message: err.message });
    }
};
