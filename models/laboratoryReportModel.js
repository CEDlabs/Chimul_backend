const { connectDB, sql } = require("../config/db");

const toDate = (value) => {
    if (!value) return null;
    const d = new Date(value);
    return Number.isNaN(d.getTime()) ? null : d;
};

const toNum = (value) => {
    if (value === "" || value === null || value === undefined) return null;
    const n = parseFloat(value);
    return Number.isNaN(n) ? null : n;
};

const dayString = (value) => {
    const d = toDate(value);
    return d ? d.toISOString().slice(0, 10) : "";
};

const avgOf = (arr) => {
    const vals = arr.map(toNum).filter((n) => n !== null);
    return vals.length ? vals.reduce((a, b) => a + b, 0) / vals.length : 0;
};

const avgNullable = (arr) => {
    const vals = arr.map(toNum).filter((n) => n !== null);
    return vals.length ? vals.reduce((a, b) => a + b, 0) / vals.length : null;
};

const round2 = (n) => (n === null || n === undefined ? null : Math.round(n * 100) / 100);

const sum = (arr) => arr.reduce((a, b) => a + (b || 0), 0);

const CO_PACKING_TYPE = "Load Tanker (Co-Packing)";

const isCoPackingRow = (row) =>
    String(row?.vehicleType || "").trim() === CO_PACKING_TYPE ||
    String(row?.entryCategory || "").trim() === "BMC Loading" &&
        String(row?.vehicleType || "").trim() === CO_PACKING_TYPE;

// Exclude Co-Packing from BMC route-based reports (Daily / Fortnight / Extra / routes list).
const excludeCoPacking = (sqlExpr = "vehicleType") =>
    `(${sqlExpr} IS NULL OR UPPER(TRIM(${sqlExpr})) <> UPPER(?))`;

const computeTotals = (rows) => {
    const t = {
        tankerQuantity: round2(sum(rows.map((r) => r.tankerQuantity))),
        truckSheetQuantity: round2(sum(rows.map((r) => r.truckSheetQuantity))),
        difference: round2(sum(rows.map((r) => r.difference))),
        afterDeduction: round2(sum(rows.map((r) => r.afterDeduction))),
        differenceAfterDeduction: round2(sum(rows.map((r) => r.differenceAfterDeduction))),
        tankerKgFat: round2(sum(rows.map((r) => r.tankerKgFat))),
        tankerKgSnf: round2(sum(rows.map((r) => r.tankerKgSnf))),
        truckKgFat: round2(sum(rows.map((r) => r.truckKgFat))),
        truckKgSnf: round2(sum(rows.map((r) => r.truckKgSnf))),
        differenceKgFat: round2(sum(rows.map((r) => r.differenceKgFat))),
        differenceKgSnf: round2(sum(rows.map((r) => r.differenceKgSnf))),
    };
    t.tankerFat = t.tankerQuantity > 0 ? round2((t.tankerKgFat / t.tankerQuantity) * 100) : 0;
    t.tankerSnf = t.tankerQuantity > 0 ? round2((t.tankerKgSnf / t.tankerQuantity) * 100) : 0;
    t.truckFat = t.truckSheetQuantity > 0 ? round2((t.truckKgFat / t.truckSheetQuantity) * 100) : 0;
    t.truckSnf = t.truckSheetQuantity > 0 ? round2((t.truckKgSnf / t.truckSheetQuantity) * 100) : 0;
    t.alcohol = avgNullable(rows.map((r) => r.alcohol));
    t.vehicleCount = rows.length;
    return t;
};

const TALUK_BY_ROUTE = {
    "7B": "Sidlaghatta", "8B": "Sidlaghatta", "9B": "Sidlaghatta", "10B": "Sidlaghatta",
    "11B": "Sidlaghatta", "12B": "Chintamani", "14B": "Chintamani", "18B": "Gauribidanur",
    "20B": "Chintamani", "22B": "Bagepalli", "25B": "Chintamani", "30B": "Sidlaghatta",
    "35B": "Chikkaballapura", "37B": "Chikkaballapura", "38B": "Sidlaghatta",
    "40B": "Sidlaghatta", "46B": "Chikkaballapura", "47B": "Chikkaballapura",
    "49B": "Bagepalli", "50B": "Gauribidanur", "55B": "Gudibande", "57B": "Gauribidanur",
    "58B": "Gauribidanur", "62B": "Sidlaghatta", "63B": "Gauribidanur", "67B": "Gauribidanur",
    "68B": "Gauribidanur", "72B": "Chikkaballapura", "77B": "Chintamani", "86B": "Gauribidanur",
    "93B": "Gauribidanur", "94B": "Bagepalli", "95B": "Gudibande", "96B": "Gauribidanur",
};

const ROUTES = [
    "7B", "8B", "9B", "10B", "11B", "12B", "14B", "18B", "20B",
    "22B", "25B", "30B", "35B", "37B", "38B", "40B", "46B", "47B",
    "49B", "50B", "55B", "57B", "58B", "62B", "63B", "67B",
    "68B", "72B", "77B", "86B", "93B", "94B", "95B", "96B",
];

exports.getDailyReport = async (dates, routes) => {
    const pool = await connectDB();

    const dateList = (dates || "").split(",").map((d) => dayString(d)).filter(Boolean);
    if (dateList.length === 0) throw new Error("Valid date(s) required.");

    const selectedRoutes = (routes || "").split(",").map((r) => String(r || "").trim().toUpperCase()).filter(Boolean);
    const hasRouteFilter = selectedRoutes.length > 0;

    const placeholders = dateList.map(() => "?").join(",");

    const [wbResult, mcResult, labResult] = await Promise.all([
        pool.execute(
            `SELECT vehicleNumber, routeName, netWeight, vehicleType, entryCategory,
                    ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} IN (${placeholders})
               AND netWeight IS NOT NULL
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [...dateList, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT vehicleNumber, routeNo, eveningKg, morningKg,
                    eveningFat, eveningSNF, morningFat, morningSNF,
                    ${sql.dateFormat("reportDate", "%Y-%m-%d")} AS day
             FROM MilkCollections
             WHERE ${sql.dateFormat("reportDate", "%Y-%m-%d")} IN (${placeholders})`,
            dateList
        ),
        pool.execute(
            `SELECT vehicleNumber, routeNo, taluk, temperature, clr, fat, snf, alcohol, kgFat, kgSnf, totalKgFat, totalKgSNF,
                    vehicleType, entryCategory,
                    ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} IN (${placeholders})
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [...dateList, CO_PACKING_TYPE]
        ),
    ]);

    const routeKey = (value) => String(value || "").trim().toUpperCase();
    const isSelected = (key) => !hasRouteFilter || selectedRoutes.includes(key);

    const groupByDay = (records) => {
        const map = new Map();
        for (const r of records) {
            if (!r.day) continue;
            if (!map.has(r.day)) map.set(r.day, []);
            map.get(r.day).push(r);
        }
        return map;
    };

    const wbByDay = groupByDay(wbResult);
    const mcByDay = groupByDay(mcResult);
    const labByDay = groupByDay(labResult);

    const allKeys = (hasRouteFilter ? selectedRoutes : ROUTES)
        .slice()
        .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));

    const buildDayRows = (day) => {
        const wbs = wbByDay.get(day) || [];
        const mcs = mcByDay.get(day) || [];
        const labs = labByDay.get(day) || [];

        const wbByRoute = new Map();
        for (const w of wbs) {
            const key = routeKey(w.routeName);
            if (!key || !isSelected(key)) continue;
            const entry = wbByRoute.get(key) || { netTotal: 0, count: 0 };
            entry.netTotal += toNum(w.netWeight) || 0;
            entry.count += 1;
            wbByRoute.set(key, entry);
        }

        const mcByRoute = new Map();
        for (const m of mcs) {
            const key = routeKey(m.routeNo);
            if (!key || !isSelected(key)) continue;
            const entry = mcByRoute.get(key) || { kg: 0, kgFat: 0, kgSnf: 0, count: 0 };
            const evKg = toNum(m.eveningKg) || 0;
            const moKg = toNum(m.morningKg) || 0;
            entry.kg += evKg + moKg;
            entry.kgFat += (toNum(m.eveningFat) || 0) * evKg;
            entry.kgFat += (toNum(m.morningFat) || 0) * moKg;
            entry.kgSnf += (toNum(m.eveningSNF) || 0) * evKg;
            entry.kgSnf += (toNum(m.morningSNF) || 0) * moKg;
            entry.count += 1;
            mcByRoute.set(key, entry);
        }

        const labByRoute = new Map();
        for (const l of labs) {
            const key = routeKey(l.routeNo);
            if (!key || !isSelected(key)) continue;
            const entry = labByRoute.get(key) || { taluk: "", temps: [], fats: [], snfs: [], alcohols: [], kgFats: [], kgSnfs: [] };
            if (l.taluk && !entry.taluk) entry.taluk = l.taluk;
            entry.temps.push(toNum(l.temperature));
            entry.fats.push(toNum(l.fat));
            entry.snfs.push(toNum(l.snf));
            entry.alcohols.push(toNum(l.alcohol));
            entry.kgFats.push(toNum(l.totalKgFat || l.kgFat));
            entry.kgSnfs.push(toNum(l.totalKgSNF || l.kgSnf));
            labByRoute.set(key, entry);
        }

        return allKeys.map((route, index) => {
            const wb = wbByRoute.get(route) || { netTotal: 0, count: 0 };
            const mc = mcByRoute.get(route) || { kg: 0, kgFat: 0, kgSnf: 0, count: 0 };
            const lab = labByRoute.get(route) || { taluk: "", temps: [], fats: [], snfs: [], alcohols: [], kgFats: [], kgSnfs: [] };

            const taluk = TALUK_BY_ROUTE[route] || lab.taluk || "";

            const hasData =
                wb.count > 0 || mc.count > 0 ||
                lab.temps.length > 0 || lab.fats.length > 0 ||
                lab.snfs.length > 0 || lab.alcohols.length > 0;

            if (!hasData) {
                return {
                    slNo: index + 1, route, taluk, talukCode: taluk,
                    tankerQuantity: null, truckSheetQuantity: null,
                    difference: null, afterDeduction: null, differenceAfterDeduction: null,
                    temperature: null, tankerFat: null, tankerSnf: null,
                    tankerKgFat: null, tankerKgSnf: null,
                    truckFat: null, truckSnf: null,
                    truckKgFat: null, truckKgSnf: null,
                    differenceKgFat: null, differenceKgSnf: null, alcohol: null,
                };
            }

            const tankerQuantity = round2(wb.netTotal);
            const truckQuantity = round2(mc.kg);
            const difference = round2((wb.netTotal || 0) - (mc.kg || 0));
            const afterDeduction = difference < 0 ? truckQuantity : tankerQuantity;
            const differenceAfterDeduction = difference;

            const temperature = avgNullable(lab.temps);
            const tankerFat = avgNullable(lab.fats);
            const tankerSnf = avgNullable(lab.snfs);
            const storedKgFat = sum(lab.kgFats.filter(Boolean));
            const storedKgSnf = sum(lab.kgSnfs.filter(Boolean));

            const tankerKgFat = storedKgFat > 0 ? round2(storedKgFat) : round2((tankerQuantity || 0) * (tankerFat || 0) / 100);
            const tankerKgSnf = storedKgSnf > 0 ? round2(storedKgSnf) : round2((tankerQuantity || 0) * (tankerSnf || 0) / 100);

            const truckFat = mc.kg > 0 ? mc.kgFat / mc.kg : null;
            const truckSnf = mc.kg > 0 ? mc.kgSnf / mc.kg : null;
            const truckKgFat = round2(mc.kgFat / 100);
            const truckKgSnf = round2(mc.kgSnf / 100);

            const alcohol = avgNullable(lab.alcohols);

            return {
                slNo: index + 1, route, taluk, talukCode: taluk,
                tankerQuantity, truckSheetQuantity: truckQuantity,
                difference, afterDeduction, differenceAfterDeduction,
                temperature,
                tankerFat: tankerFat === null ? null : round2(tankerFat),
                tankerSnf: tankerSnf === null ? null : round2(tankerSnf),
                tankerKgFat, tankerKgSnf,
                truckFat: truckFat === null ? null : round2(truckFat),
                truckSnf: truckSnf === null ? null : round2(truckSnf),
                truckKgFat, truckKgSnf,
                differenceKgFat: round2((tankerKgFat || 0) - (truckKgFat || 0)),
                differenceKgSnf: round2((tankerKgSnf || 0) - (truckKgSnf || 0)),
                alcohol: alcohol === null ? null : round2(alcohol),
            };
        });
    };

    const buildDayTotals = (rows) => computeTotals(rows);

    const days = dateList.map((day) => {
        const rows = buildDayRows(day);
        const totals = buildDayTotals(rows);
        return { date: day, rows, totals, routeCount: rows.length };
    });

    return { dates: dateList, days, routeCount: allKeys.length };
};

exports.getRoutesForDate = async (date) => {
    const pool = await connectDB();
    const day = dayString(date);
    if (!day) throw new Error("Valid date is required.");

    const [wb, mc, lab] = await Promise.all([
        pool.execute(
            `SELECT DISTINCT UPPER(${sql.trim("routeName")}) AS route
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} = ?
               AND routeName IS NOT NULL AND ${sql.trim("routeName")} != ''
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [day, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT DISTINCT UPPER(${sql.trim("routeNo")}) AS route
             FROM MilkCollections
             WHERE ${sql.dateFormat("reportDate", "%Y-%m-%d")} = ?
               AND routeNo IS NOT NULL AND ${sql.trim("routeNo")} != ''`,
            [day]
        ),
        pool.execute(
            `SELECT DISTINCT UPPER(${sql.trim("routeNo")}) AS route
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} = ?
               AND routeNo IS NOT NULL AND ${sql.trim("routeNo")} != ''
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [day, CO_PACKING_TYPE]
        ),
    ]);

    const set = new Set();
    [...wb, ...mc, ...lab].forEach((r) => {
        if (r.route) set.add(r.route);
    });

    return Array.from(set).sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));
};

exports.getFortnightReport = async (startDate, endDate) => {
    const pool = await connectDB();
    const start = dayString(startDate);
    const end = dayString(endDate);
    if (!start || !end) throw new Error("Valid start and end dates are required.");
    if (start > end) throw new Error("Start date must be before end date.");

    const [labResult, wbResult, mcResult, gateResult] = await Promise.all([
        pool.execute(
            `SELECT ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day, routeNo, vehicleNumber, clr, fat, snf, kgFat, kgSnf, totalKgFat, totalKgSNF,
                    vehicleType, entryCategory
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("testedAt", "%Y-%m-%d")} <= ?
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [start, end, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day, routeName, vehicleNumber, netWeight,
                    vehicleType, entryCategory
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("createdAt", "%Y-%m-%d")} <= ?
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [start, end, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("reportDate", "%Y-%m-%d")} AS day, routeNo, vehicleNumber, eveningKg, morningKg
             FROM MilkCollections
             WHERE ${sql.dateFormat("reportDate", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("reportDate", "%Y-%m-%d")} <= ?`,
            [start, end]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} AS day, vehicleNumber, vehicleType, entryCategory
             FROM GateEntries
             WHERE ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} <= ?
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [start, end, CO_PACKING_TYPE]
        ),
    ]);

    const groupByDay = (records) => {
        const map = new Map();
        for (const r of records) {
            if (!r.day) continue;
            if (!map.has(r.day)) map.set(r.day, []);
            map.get(r.day).push(r);
        }
        return map;
    };

    const labByDay = groupByDay(labResult);
    const wbByDay = groupByDay(wbResult);
    const mcByDay = groupByDay(mcResult);
    const gateByDay = groupByDay(gateResult);

    const days = [];
    const cursor = new Date(`${start}T00:00:00`);
    const endObj = new Date(`${end}T00:00:00`);

    while (cursor <= endObj) {
        const day = cursor.toISOString().slice(0, 10);
        const labs = labByDay.get(day) || [];
        const wbs = wbByDay.get(day) || [];
        const mcs = mcByDay.get(day) || [];
        const gates = gateByDay.get(day) || [];

        const vehicles = new Set();
        [...labs, ...wbs, ...mcs, ...gates].forEach((r) => {
            if (r.vehicleNumber) vehicles.add(String(r.vehicleNumber).toUpperCase().trim());
        });

        const dayRecord = {
            date: day,
            vehicleCount: vehicles.size,
            testCount: labs.length,
            totalNetKg: wbs.reduce((a, r) => a + (toNum(r.netWeight) || 0), 0),
            milkTotalKg: mcs.reduce((a, r) => a + (toNum(r.eveningKg) || 0) + (toNum(r.morningKg) || 0), 0),
            avgClr: avgOf(labs.map((r) => r.clr)),
            avgFat: avgOf(labs.map((r) => r.fat)),
            avgSnf: avgOf(labs.map((r) => r.snf)),
            totalKgFat: labs.reduce((a, r) => a + (toNum(r.totalKgFat || r.kgFat) || 0), 0),
            totalKgSNF: labs.reduce((a, r) => a + (toNum(r.totalKgSNF || r.kgSnf) || 0), 0),
            routes: [],
        };

        const routeMap = new Map();
        const vehicleSeen = new Set();
        const ensureRoute = (route) => {
            const key = route || "Unknown";
            if (!routeMap.has(key)) {
                routeMap.set(key, { route: key, vehicleCount: 0, netTotalKg: 0, milkTotalKg: 0, clrs: [], fats: [], snfs: [], kgFats: [], kgSnfs: [] });
            }
            return routeMap.get(key);
        };

        for (const w of wbs) {
            const rt = ensureRoute(w.routeName);
            rt.netTotalKg += toNum(w.netWeight) || 0;
            if (w.vehicleNumber) vehicleSeen.add(`${rt.route}__${w.vehicleNumber}`);
        }
        for (const m of mcs) {
            const rt = ensureRoute(m.routeNo);
            rt.milkTotalKg += (toNum(m.eveningKg) || 0) + (toNum(m.morningKg) || 0);
            if (m.vehicleNumber) vehicleSeen.add(`${rt.route}__${m.vehicleNumber}`);
        }
        for (const l of labs) {
            const rt = ensureRoute(l.routeNo);
            rt.clrs.push(l.clr);
            rt.fats.push(l.fat);
            rt.snfs.push(l.snf);
            rt.kgFats.push(toNum(l.totalKgFat || l.kgFat));
            rt.kgSnfs.push(toNum(l.totalKgSNF || l.kgSnf));
            if (l.vehicleNumber) vehicleSeen.add(`${rt.route}__${l.vehicleNumber}`);
        }

        dayRecord.routes = Array.from(routeMap.values())
            .map((rt) => ({
                route: rt.route,
                vehicleCount: Array.from(vehicleSeen).filter((k) => k.startsWith(`${rt.route}__`)).length,
                netTotalKg: rt.netTotalKg,
                milkTotalKg: rt.milkTotalKg,
                avgClr: avgOf(rt.clrs),
                avgFat: avgOf(rt.fats),
                avgSnf: avgOf(rt.snfs),
                totalKgFat: rt.kgFats.reduce((a, b) => a + (b || 0), 0),
                totalKgSNF: rt.kgSnfs.reduce((a, b) => a + (b || 0), 0),
            }))
            .sort((a, b) => a.route.localeCompare(b.route, undefined, { numeric: true }));

        days.push(dayRecord);
        cursor.setDate(cursor.getDate() + 1);
    }

    const grandTotals = {
        dayCount: days.length,
        vehicleDays: days.reduce((a, d) => a + d.vehicleCount, 0),
        testCount: days.reduce((a, d) => a + d.testCount, 0),
        totalNetKg: days.reduce((a, d) => a + d.totalNetKg, 0),
        milkTotalKg: days.reduce((a, d) => a + d.milkTotalKg, 0),
        avgClr: avgOf(days.map((d) => d.avgClr)),
        avgFat: avgOf(days.map((d) => d.avgFat)),
        avgSnf: avgOf(days.map((d) => d.avgSnf)),
        totalKgFat: days.reduce((a, d) => a + d.totalKgFat, 0),
        totalKgSNF: days.reduce((a, d) => a + d.totalKgSNF, 0),
    };

    return { startDate: start, endDate: end, days, grandTotals };
};

exports.getTalukReport = async (dates, taluks) => {
    const pool = await connectDB();

    const dateList = (dates || "").split(",").map((d) => dayString(d)).filter(Boolean);
    if (dateList.length === 0) throw new Error("Valid date(s) required.");

    const normalizeTaluk = (s) => String(s || "").trim().toLowerCase();
    const routeKey = (r) => String(r || "").trim().toUpperCase();
    const stripZeros = (r) => routeKey(r).replace(/^0+/, "");

    // Selected taluks (keep original casing for display).
    const selected = (taluks || "").split(",").map((s) => String(s || "").trim()).filter(Boolean);
    const selectedNorm = selected.map(normalizeTaluk);
    if (selectedNorm.length === 0) throw new Error("Select at least one taluk.");

    // Taluk-wise route links maintained in the Laboratory taluk master.
    const linkRows = await pool.execute(
        "SELECT routeName, talukName FROM TalukRoutes"
    ).catch(() => []);
    const linkMap = {};
    for (const r of linkRows || []) {
        if (r.routeName && String(r.talukName || "").trim()) {
            linkMap[routeKey(r.routeName)] = String(r.talukName).trim();
        }
    }

    // Live route→taluk mapping from the Routes master (user managed).
    const dbRows = await pool.execute(
        "SELECT routeName, taluk FROM Routes WHERE (isDeleted IS NULL OR isDeleted = 0)"
    ).catch(() => []);
    const dbMap = {};
    for (const r of dbRows || []) {
        if (r.routeName && String(r.taluk || "").trim()) {
            dbMap[routeKey(r.routeName)] = String(r.taluk).trim();
        }
    }

    const resolveTaluk = (route) => {
        const key = routeKey(route);
        if (!key) return "";
        if (linkMap[key]) return linkMap[key];
        if (dbMap[key]) return dbMap[key];
        return TALUK_BY_ROUTE[key] || TALUK_BY_ROUTE[stripZeros(key)] || "";
    };

    // Collect the route set per selected taluk.
    const routeSources = new Set([
        ...(linkRows || []).map((r) => routeKey(r.routeName)).filter(Boolean),
        ...(dbRows || []).map((r) => routeKey(r.routeName)).filter(Boolean),
        ...Object.keys(TALUK_BY_ROUTE),
    ]);
    const talukDefs = new Map(); // normalized → { name(display), routes: Set }
    for (const norm of selectedNorm) {
        if (!talukDefs.has(norm)) {
            talukDefs.set(norm, { key: norm, name: norm, routes: new Set() });
        }
    }

    const allRouteSet = new Set();
    for (const route of routeSources) {
        const taluk = resolveTaluk(route);
        const norm = normalizeTaluk(taluk);
        if (selectedNorm.includes(norm) && route) {
            const def = talukDefs.get(norm);
            if (def) {
                def.name = taluk || def.name;
                def.routes.add(route);
                allRouteSet.add(route);
            }
        }
    }

    const defList = Array.from(talukDefs.values());

    // Per-route rows (each route in the selected taluk is its own row).
    const routeRows = (dailyRows) =>
        (dailyRows || []).map((r) => ({
            ...r,
            taluk: resolveTaluk(r.route) || r.taluk || "",
            talukCode: resolveTaluk(r.route) || r.talukCode || r.taluk || "",
        }));

    if (allRouteSet.size === 0) {
        const days = dateList.map((day) => ({
            date: day,
            rows: [],
            totals: computeTotals([]),
            routeCount: 0,
        }));
        return { dates: dateList, days, routeCount: 0, taluks: defList.map((d) => d.name), empty: true };
    }

    const routesCsv = Array.from(allRouteSet).sort((a, b) => a.localeCompare(b, undefined, { numeric: true })).join(",");
    const daily = await exports.getDailyReport(dateList.join(","), routesCsv);

    const days = (daily.days || []).map((day) => ({
        date: day.date,
        rows: routeRows(day.rows),
        totals: day.totals || computeTotals(day.rows || []),
        routeCount: (day.rows || []).length,
    }));

    return { dates: dateList, days, routeCount: allRouteSet.size, taluks: defList.map((d) => d.name) };
};

/* ==========================================================
   EXTRA REPORT — BMC Tankers & Truck Sheet Quality Report
   Per-route: tanker qty (front/back/total), truck sheet qty,
   weight diff, alcohol (front/back), temp, quality fat/snf
   (front/back) pulled from LaboratoryTests + CompartmentTests
   + WeighBridgeEntries + MilkCollections.
========================================================== */

exports.getExtraReport = async (dates, routes) => {
    const pool = await connectDB();

    const dateList = (dates || "").split(",").map((d) => dayString(d)).filter(Boolean);
    if (dateList.length === 0) throw new Error("Valid date(s) required.");

    const selectedRoutes = (routes || "").split(",").map((r) => String(r || "").trim().toUpperCase()).filter(Boolean);
    const hasRouteFilter = selectedRoutes.length > 0;

    const placeholders = dateList.map(() => "?").join(",");

    const [wbResult, mcResult, labResult, lctResult] = await Promise.all([
        pool.execute(
            `SELECT vehicleNumber, routeName, netWeight, grossWeight, tareWeight, compartments,
                    intermediateWeight1, dumpPosition1,
                    intermediateWeight2, dumpPosition2,
                    intermediateWeight3, dumpPosition3,
                    vehicleType, entryCategory, purpose,
                    ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} IN (${placeholders})
               AND netWeight IS NOT NULL
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [...dateList, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT vehicleNumber, routeNo,
                    eveningKg, morningKg, eveningFat, eveningSNF, morningFat, morningSNF,
                    ${sql.dateFormat("reportDate", "%Y-%m-%d")} AS day
             FROM MilkCollections
             WHERE ${sql.dateFormat("reportDate", "%Y-%m-%d")} IN (${placeholders})`,
            dateList
        ),
        pool.execute(
            `SELECT labTestId, vehicleNumber, routeNo, taluk, temperature, clr, fat, snf, alcohol,
                    kgFat, kgSnf, totalKgFat, totalKgSNF, testedByName,
                    vehicleType, entryCategory, sealNumbers,
                    ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} IN (${placeholders})
               AND (vehicleType IS NULL OR UPPER(TRIM(vehicleType)) <> UPPER(?))`,
            [...dateList, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT lct.labTestId, lct.vehicleNumber, lt.routeNo, lct.compartment,
                    lct.temperature, lct.fat, lct.snf, lct.alcohol,
                    ${sql.dateFormat("lt.testedAt", "%Y-%m-%d")} AS day
             FROM LaboratoryCompartmentTests lct
             JOIN LaboratoryTests lt ON lt.labTestId = lct.labTestId
             WHERE ${sql.dateFormat("lt.testedAt", "%Y-%m-%d")} IN (${placeholders})`,
            dateList
        ),
    ]);

    const routeKey = (value) => String(value || "").trim().toUpperCase();
    const isSelected = (key) => !hasRouteFilter || selectedRoutes.includes(key);

    const groupByDay = (records) => {
        const map = new Map();
        for (const r of records) {
            if (!r.day) continue;
            if (!map.has(r.day)) map.set(r.day, []);
            map.get(r.day).push(r);
        }
        return map;
    };

    const wbByDay = groupByDay(wbResult);
    const mcByDay = groupByDay(mcResult);
    const labByDay = groupByDay(labResult);
    const lctByDay = groupByDay(lctResult);

    const allKeys = (hasRouteFilter ? selectedRoutes : ROUTES)
        .slice()
        .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));

    const getPositions = (n) => {
        if (n <= 1) return [];
        if (n === 2) return ["Front Load", "Back Load"];
        return ["Front Load", "Middle Load", "Back Load"];
    };

    const calcCompartmentWeights = (wb) => {
        const gross = toNum(wb.grossWeight) || 0;
        const tare = toNum(wb.tareWeight) || 0;
        const compCount = parseInt(wb.compartments, 10) || 3;
        const records = [
            { weight: toNum(wb.intermediateWeight1) || 0, position: (wb.dumpPosition1 || "").trim() },
            { weight: toNum(wb.intermediateWeight2) || 0, position: (wb.dumpPosition2 || "").trim() },
            { weight: toNum(wb.intermediateWeight3) || 0, position: (wb.dumpPosition3 || "").trim() },
        ].filter((r) => r.weight > 0 && r.position);

        if (gross <= 0) return { weights: {}, compartmentCount: compCount };

        const allPositions = getPositions(compCount);
        const capturedPositions = records.map((r) => r.position);
        const remainingPosition = allPositions.find((p) => !capturedPositions.includes(p)) || `Compartment ${compCount}`;

        const weights = {};
        let prev = gross;
        records.forEach((rec) => {
            const dumpWt = rec.weight;
            const compartmentWt = Math.max(0, prev - dumpWt);
            if (compartmentWt > 0) weights[rec.position] = compartmentWt;
            prev = dumpWt;
        });
        const lastCompWt = Math.max(0, prev - tare);
        if (lastCompWt > 0) weights[remainingPosition] = lastCompWt;
        return { weights, compartmentCount: compCount };
    };

    const mapDumpPositionToCompartment = (position) => {
        const p = String(position || "").toLowerCase();
        if (p.includes("front") || p === "f" || p === "1") return "front";
        if (p.includes("back") || p.includes("rear") || p === "b" || p === "2") return "back";
        if (p.includes("middle") || p === "m" || p === "3") return "middle";
        return null;
    };

    const buildDayRows = (day) => {
        const wbs = wbByDay.get(day) || [];
        const mcs = mcByDay.get(day) || [];
        const labs = labByDay.get(day) || [];
        const lcts = lctByDay.get(day) || [];

        // Weigh bridge: one entry per vehicle/route → tanker total + compartment weights
        const wbByVehicle = new Map();
        for (const w of wbs) {
            const key = routeKey(w.routeName);
            if (!key || !isSelected(key)) continue;
            const entry = wbByVehicle.get(key) || { netTotal: 0, vehicles: [], compWeights: {} };
            entry.netTotal += toNum(w.netWeight) || 0;
            if (w.vehicleNumber && !entry.vehicles.includes(w.vehicleNumber)) entry.vehicles.push(w.vehicleNumber);
            const { weights } = calcCompartmentWeights(w);
            Object.entries(weights).forEach(([pos, wt]) => {
                const comp = mapDumpPositionToCompartment(pos);
                if (comp) entry.compWeights[comp] = wt;
            });
            wbByVehicle.set(key, entry);
        }

        // Milk collections: accumulate per route → truck sheet quantities
        const mcByRoute = new Map();
        for (const m of mcs) {
            const key = routeKey(m.routeNo);
            if (!key || !isSelected(key)) continue;
            const entry = mcByRoute.get(key) || { kg: 0, evFat: [], moFat: [], evSnf: [], moSnf: [], count: 0 };
            const evKg = toNum(m.eveningKg) || 0;
            const moKg = toNum(m.morningKg) || 0;
            entry.kg += evKg + moKg;
            if (toNum(m.eveningFat) !== null && evKg > 0) entry.evFat.push({ val: toNum(m.eveningFat), kg: evKg });
            if (toNum(m.morningFat) !== null && moKg > 0) entry.moFat.push({ val: toNum(m.morningFat), kg: moKg });
            if (toNum(m.eveningSNF) !== null && evKg > 0) entry.evSnf.push({ val: toNum(m.eveningSNF), kg: evKg });
            if (toNum(m.morningSNF) !== null && moKg > 0) entry.moSnf.push({ val: toNum(m.morningSNF), kg: moKg });
            entry.count += 1;
            mcByRoute.set(key, entry);
        }

        // Lab tests: overall per route
        const labByRoute = new Map();
        for (const l of labs) {
            const key = routeKey(l.routeNo);
            if (!key || !isSelected(key)) continue;
            const entry = labByRoute.get(key) || { taluk: "", eoName: "", temps: [], fats: [], snfs: [], alcohols: [] };
            if (l.taluk && !entry.taluk) entry.taluk = l.taluk;
            if (l.testedByName && !entry.eoName) entry.eoName = l.testedByName;
            entry.temps.push(toNum(l.temperature));
            entry.fats.push(toNum(l.fat));
            entry.snfs.push(toNum(l.snf));
            entry.alcohols.push(toNum(l.alcohol));
            labByRoute.set(key, entry);
        }

        // Compartment tests: front/back fat/snf/alcohol/temp — merge with weighbridge compartment weights
        const compByRoute = new Map();
        for (const c of lcts) {
            const key = routeKey(c.routeNo);
            if (!key || !isSelected(key)) continue;
            const entry = compByRoute.get(key) || { front: {}, back: {} };
            const compartment = String(c.compartment || "").toLowerCase();
            const isFront = compartment.includes("front") || compartment === "f" || compartment === "1";
            const isBack = compartment.includes("back") || compartment === "b" || compartment === "2" || compartment === "rear";
            if (isFront) {
                entry.front = {
                    fat: toNum(c.fat),
                    snf: toNum(c.snf),
                    alcohol: toNum(c.alcohol),
                    temp: toNum(c.temperature),
                };
            } else if (isBack) {
                entry.back = {
                    fat: toNum(c.fat),
                    snf: toNum(c.snf),
                    alcohol: toNum(c.alcohol),
                    temp: toNum(c.temperature),
                };
            }
            compByRoute.set(key, entry);
        }
        // Merge weighbridge compartment weights into compByRoute
        for (const [key, wbEntry] of wbByVehicle.entries()) {
            const compEntry = compByRoute.get(key) || { front: {}, back: {} };
            if (wbEntry.compWeights.front != null) compEntry.front.weight = wbEntry.compWeights.front;
            if (wbEntry.compWeights.back != null) compEntry.back.weight = wbEntry.compWeights.back;
            compByRoute.set(key, compEntry);
        }

        return allKeys.map((route, index) => {
            const wb = wbByVehicle.get(route) || { netTotal: 0, vehicles: [] };
            const mc = mcByRoute.get(route) || { kg: 0, evFat: [], moFat: [], evSnf: [], moSnf: [], count: 0 };
            const lab = labByRoute.get(route) || { taluk: "", eoName: "", temps: [], fats: [], snfs: [], alcohols: [] };
            const comp = compByRoute.get(route) || { front: {}, back: {} };

            const taluk = TALUK_BY_ROUTE[route] || lab.taluk || "";

            const hasCompData = Boolean(comp.front.fat != null || comp.front.snf != null || comp.back.fat != null || comp.back.snf != null || comp.front.alcohol != null || comp.back.alcohol != null);
            const hasData = wb.netTotal > 0 || mc.kg > 0 || lab.temps.length > 0 || hasCompData;

            if (!hasData) {
                return {
                    slNo: index + 1, route, taluk, eoName: "",
                    tankerFront: null, tankerBack: null, tankerTotal: null,
                    truckSheetWeight: null, weightDiff: null,
                    alcoholFront: null, alcoholBack: null,
                    temperature: null,
                    frontFat: null, frontSnf: null,
                    backFat: null, backSnf: null,
                };
            }

            const tankerTotal = round2(wb.netTotal);
            const truckSheetWeight = round2(mc.kg);
            const weightDiff = (tankerTotal !== null && truckSheetWeight !== null) ? round2(truckSheetWeight - tankerTotal) : null;

            return {
                slNo: index + 1, route, taluk,
                eoName: lab.eoName || "",
                tankerFront: round2(comp.front.weight ?? null),
                tankerBack: round2(comp.back.weight ?? null),
                tankerTotal,
                truckSheetWeight,
                weightDiff,
                alcoholFront: comp.front.alcohol ?? null,
                alcoholBack: comp.back.alcohol ?? null,
                temperature: avgNullable(lab.temps) ?? comp.front.temp ?? comp.back.temp ?? null,
                frontFat: comp.front.fat ?? null,
                frontSnf: comp.front.snf ?? null,
                backFat: comp.back.fat ?? null,
                backSnf: comp.back.snf ?? null,
            };
        });
    };

    const days = dateList.map((day) => {
        const rows = buildDayRows(day);
        const totals = {
            tankerTotal: round2(sum(rows.map((r) => r.tankerTotal))),
            truckSheetWeight: round2(sum(rows.map((r) => r.truckSheetWeight))),
            weightDiff: round2(sum(rows.map((r) => r.weightDiff))),
            avgTemp: avgNullable(rows.map((r) => r.temperature)),
            avgFrontFat: avgNullable(rows.map((r) => r.frontFat)),
            avgFrontSnf: avgNullable(rows.map((r) => r.frontSnf)),
            avgBackFat: avgNullable(rows.map((r) => r.backFat)),
            avgBackSnf: avgNullable(rows.map((r) => r.backSnf)),
        };
        return { date: day, rows, totals, routeCount: rows.length };
    });

    return { dates: dateList, days, routeCount: allKeys.length };
};

/* ==========================================================
   DAILY LOADING REPORT — BMC Loading weighbridge rows for a
   single date (includes Co-Packing), joined to lab + samples.
========================================================== */
exports.getDailyLoadingReport = async (date) => {
    const pool = await connectDB();
    const day = dayString(date);
    if (!day) throw new Error("Valid date is required.");

    const [wbRows, labRows, sampleRows] = await Promise.all([
        pool.execute(
            `SELECT wbEntryId, vehicleNumber, routeName, purpose, entryCategory, vehicleType,
                    grossWeight AS initialWeight, tareWeight AS finalWeight, netWeight,
                    ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} = ?
               AND (isDeleted IS NULL OR isDeleted = 0)
               AND (netWeight IS NOT NULL OR tareWeight IS NOT NULL)
                 AND (
                     UPPER(COALESCE(NULLIF(entryCategory, ''), '')) = 'BMC LOADING'
                  OR UPPER(COALESCE(NULLIF(purpose, ''), '')) = 'LOADING'
                  OR UPPER(COALESCE(NULLIF(purpose, ''), '')) = UPPER(?)
                  OR UPPER(COALESCE(NULLIF(vehicleType, ''), '')) = UPPER(?)
                )
              ORDER BY createdAt ASC, id ASC`,
            [day, CO_PACKING_TYPE, CO_PACKING_TYPE]
        ),
        pool.execute(
            `SELECT labTestId, vehicleNumber, routeNo, temperature, clr, fat, snf, testResult,
                    vehicleType, entryCategory, sealNumbers,
                    ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} = ?
               AND (isDeleted IS NULL OR isDeleted = 0)`,
            [day]
        ),
        pool.execute(
            `SELECT sampleId, vehicleNumber, routeNo, temperature,
                    ${sql.dateFormat("collectedAt", "%Y-%m-%d")} AS day
             FROM SampleCollections
             WHERE ${sql.dateFormat("collectedAt", "%Y-%m-%d")} = ?
               AND (isDeleted IS NULL OR isDeleted = 0)`,
            [day]
        ).catch(() => []),
    ]);

    const up = (v) => String(v || "").trim().toUpperCase();
    const labByVehicle = new Map();
    for (const l of labRows || []) {
        const key = up(l.vehicleNumber);
        if (key && !labByVehicle.has(key)) labByVehicle.set(key, l);
    }
    const sampleByVehicle = new Map();
    for (const s of sampleRows || []) {
        const key = up(s.vehicleNumber);
        if (key && !sampleByVehicle.has(key)) sampleByVehicle.set(key, s);
    }

    const rows = (wbRows || []).map((w, index) => {
        const lab = labByVehicle.get(up(w.vehicleNumber)) || null;
        const sample = sampleByVehicle.get(up(w.vehicleNumber)) || null;
        const isCoPacking = up(w.vehicleType) === up(CO_PACKING_TYPE);
        const entryType = w.entryCategory
            || (isCoPacking || up(w.purpose) === "LOADING" || up(w.purpose) === up(CO_PACKING_TYPE)
                ? "BMC Loading"
                : "BMC Unloading");
        let status = lab?.testResult || lab?.status || "";
        if (!status) status = w.netWeight != null || w.finalWeight != null ? "Completed" : "Pending";
        return {
            slNo: index + 1,
            date: w.day || day,
            vehicleNumber: w.vehicleNumber,
            entryType,
            isCoPacking,
            route: isCoPacking ? "" : (w.routeName || lab?.routeNo || sample?.routeNo || ""),
            initialWT: toNum(w.initialWeight),
            finalWT: toNum(w.finalWeight),
            netWeight: toNum(w.netWeight),
            sampleId: sample?.sampleId || null,
            temperature: lab?.temperature ?? sample?.temperature ?? null,
            clr: lab?.clr ?? null,
            fat: lab?.fat ?? null,
            status,
        };
    });

    const netVals = rows.map((r) => r.netWeight).filter((n) => n !== null);
    const tempVals = rows.map((r) => r.temperature).map(toNum).filter((n) => n !== null);
    const clrVals = rows.map((r) => r.clr).map(toNum).filter((n) => n !== null);
    const fatVals = rows.map((r) => r.fat).map(toNum).filter((n) => n !== null);
    const avg = (arr) => (arr.length ? arr.reduce((a, b) => a + b, 0) / arr.length : 0);

    return {
        date: day,
        vehicleCount: rows.length,
        rows,
        totals: {
            totalNet: round2(netVals.reduce((a, b) => a + b, 0)),
            vehicleCount: rows.length,
            avgTemp: round2(avg(tempVals), 1),
            avgClr: round2(avg(clrVals)),
            avgFat: round2(avg(fatVals)),
        },
    };
};
