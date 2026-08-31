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
            `SELECT vehicleNumber, routeName, netWeight, ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} IN (${placeholders})
               AND netWeight IS NOT NULL`,
            dateList
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
            `SELECT vehicleNumber, routeNo, taluk, temperature, clr, fat, snf, alcohol,
                    ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} IN (${placeholders})`,
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
            const entry = labByRoute.get(key) || { taluk: "", temps: [], fats: [], snfs: [], alcohols: [] };
            if (l.taluk && !entry.taluk) entry.taluk = l.taluk;
            entry.temps.push(toNum(l.temperature));
            entry.fats.push(toNum(l.fat));
            entry.snfs.push(toNum(l.snf));
            entry.alcohols.push(toNum(l.alcohol));
            labByRoute.set(key, entry);
        }

        return allKeys.map((route, index) => {
            const wb = wbByRoute.get(route) || { netTotal: 0, count: 0 };
            const mc = mcByRoute.get(route) || { kg: 0, kgFat: 0, kgSnf: 0, count: 0 };
            const lab = labByRoute.get(route) || { taluk: "", temps: [], fats: [], snfs: [], alcohols: [] };

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
            const tankerKgFat = round2((tankerQuantity || 0) * (tankerFat || 0) / 100);
            const tankerKgSnf = round2((tankerQuantity || 0) * (tankerSnf || 0) / 100);

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

    const buildDayTotals = (rows) => {
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
               AND routeName IS NOT NULL AND ${sql.trim("routeName")} != ''`,
            [day]
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
               AND routeNo IS NOT NULL AND ${sql.trim("routeNo")} != ''`,
            [day]
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
            `SELECT ${sql.dateFormat("testedAt", "%Y-%m-%d")} AS day, routeNo, vehicleNumber, clr, fat, snf
             FROM LaboratoryTests
             WHERE ${sql.dateFormat("testedAt", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("testedAt", "%Y-%m-%d")} <= ?`,
            [start, end]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("createdAt", "%Y-%m-%d")} AS day, routeName, vehicleNumber, netWeight
             FROM WeighBridgeEntries
             WHERE ${sql.dateFormat("createdAt", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("createdAt", "%Y-%m-%d")} <= ?`,
            [start, end]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("reportDate", "%Y-%m-%d")} AS day, routeNo, vehicleNumber, eveningKg, morningKg
             FROM MilkCollections
             WHERE ${sql.dateFormat("reportDate", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("reportDate", "%Y-%m-%d")} <= ?`,
            [start, end]
        ),
        pool.execute(
            `SELECT ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} AS day, vehicleNumber
             FROM GateEntries
             WHERE ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} >= ? AND ${sql.dateFormat("entryDateTime", "%Y-%m-%d")} <= ?`,
            [start, end]
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
            routes: [],
        };

        const routeMap = new Map();
        const vehicleSeen = new Set();
        const ensureRoute = (route) => {
            const key = route || "Unknown";
            if (!routeMap.has(key)) {
                routeMap.set(key, { route: key, vehicleCount: 0, netTotalKg: 0, milkTotalKg: 0, clrs: [], fats: [], snfs: [] });
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
    };

    return { startDate: start, endDate: end, days, grandTotals };
};
