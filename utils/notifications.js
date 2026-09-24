const { connectDB, sql } = require("../config/db");
const NotificationModel = require("../models/notificationModel");

// Target departments use the REAL employee department values stored by the
// app (Management dropdown / Register form): weighmenttracker, samplecollector,
// laboratory, laboratory1. getUsersByDepartments() matches them case/space-insensitively.
const DEPARTMENT_ROUTES = {
    // A new gate entry notifies the weighbridge operators.
    gate: ["weighmenttracker"],
    // A completed weighment notifies sample collection + laboratory.
    weighbridge: ["samplecollector", "laboratory", "laboratory1"],
    // Completed sample collection / laboratory tests notify the weighbridge.
    "sample collection": ["weighmenttracker"],
    laboratory: ["weighmenttracker"],
};

async function getUsersByDepartments(departments) {
    const pool = await connectDB();
    const placeholders = departments.map(() => "?").join(",");
    const rows = await pool.execute(
        `SELECT id, employee_id, employee_name, email, department, role, is_department_admin 
         FROM employees 
         WHERE LOWER(TRIM(department)) IN (${placeholders})
         AND account_status = 'active'`,
        departments.map(d => d.toLowerCase().trim())
    );
    return rows;
}

async function createNotificationsForDepartments(departments, notification) {
    const users = await getUsersByDepartments(departments);
    for (const user of users) {
        await NotificationModel.create({
            recipientId: String(user.id),
            recipientDepartment: user.department,
            type: notification.type,
            title: notification.title,
            message: notification.message,
            relatedRequestId: notification.relatedRequestId || null,
        });
    }
    return users.length;
}

async function notifyWeighbridgeForGateEntry(gateEntry) {
    const parts = [`Vehicle ${gateEntry.vehicleNumber || "N/A"}`];
    if (gateEntry.vehicleType) parts.push(`Type: ${gateEntry.vehicleType}`);
    if (gateEntry.routeName || gateEntry.routeNo) parts.push(`Route: ${gateEntry.routeName || gateEntry.routeNo}`);
    if (gateEntry.entryDateTime) parts.push(`Entry: ${gateEntry.entryDateTime}`);
    if (gateEntry.allocationDate) parts.push(`Allocated: ${gateEntry.allocationDate}`);
    if (gateEntry.driverName) parts.push(`Driver: ${gateEntry.driverName}`);
    if (gateEntry.driverMobile) parts.push(`Mobile: ${gateEntry.driverMobile}`);
    if (gateEntry.supplierName) parts.push(`Supplier: ${gateEntry.supplierName}`);
    if (gateEntry.materialType) parts.push(`Material: ${gateEntry.materialType}`);
    if (gateEntry.sealNumbers && gateEntry.sealNumbers.length) parts.push(`Seals: ${Array.isArray(gateEntry.sealNumbers) ? gateEntry.sealNumbers.join(", ") : gateEntry.sealNumbers}`);
    if (gateEntry.gateEntryId) parts.push(`GateID: ${gateEntry.gateEntryId}`);

    const notification = {
        type: "GATE_ENTRY_CREATED",
        title: "New Gate Entry - Vehicle Arrived",
        message: parts.join(" | "),
        relatedRequestId: gateEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES.gate, notification);
}

async function notifySampleAndLabForWeighbridge(wbEntry) {
    const parts = [`Vehicle ${wbEntry.vehicleNumber || "N/A"}`];
    if (wbEntry.routeName) parts.push(`Route: ${wbEntry.routeName}`);
    if (wbEntry.driverName) parts.push(`Driver: ${wbEntry.driverName}`);
    if (wbEntry.conductorName) parts.push(`Conductor: ${wbEntry.conductorName}`);
    if (wbEntry.supplierCode) parts.push(`Supplier: ${wbEntry.supplierCode}`);
    parts.push(`Gross: ${wbEntry.grossWeight || 0}kg`);
    parts.push(`Tare: ${wbEntry.tareWeight || 0}kg`);
    parts.push(`Net: ${wbEntry.netWeight || 0}kg`);

    const compCount = parseInt(wbEntry.compartments, 10) || 0;
    if (compCount > 0) parts.push(`Compartments: ${compCount}`);

    // Build compartment-wise weight breakdown from intermediate dump data
    const gross = parseFloat(wbEntry.grossWeight) || 0;
    const tare = parseFloat(wbEntry.tareWeight) || 0;
    const dumps = [];
    if (wbEntry.dumpPosition1 && wbEntry.intermediateWeight1) {
        dumps.push({ pos: wbEntry.dumpPosition1, weight: parseFloat(wbEntry.intermediateWeight1) || 0 });
    }
    if (wbEntry.dumpPosition2 && wbEntry.intermediateWeight2) {
        dumps.push({ pos: wbEntry.dumpPosition2, weight: parseFloat(wbEntry.intermediateWeight2) || 0 });
    }
    if (wbEntry.dumpPosition3 && wbEntry.intermediateWeight3) {
        dumps.push({ pos: wbEntry.dumpPosition3, weight: parseFloat(wbEntry.intermediateWeight3) || 0 });
    }

    if (dumps.length > 0 && gross > 0) {
        const allPositions = compCount === 2 ? ["Front Load", "Back Load"] : ["Front Load", "Middle Load", "Back Load"];
        const capturedPositions = dumps.map(d => d.pos);
        const remainingPos = allPositions.find(p => !capturedPositions.includes(p)) || `Compartment ${compCount}`;

        const compWeights = {};
        let prev = gross;
        for (const d of dumps) {
            const wt = Math.max(0, prev - d.weight);
            if (wt > 0) compWeights[d.pos] = Math.round(wt * 100) / 100;
            prev = d.weight;
        }
        const lastWt = Math.max(0, prev - tare);
        if (lastWt > 0) compWeights[remainingPos] = Math.round(lastWt * 100) / 100;

        const compDetails = Object.entries(compWeights).map(([pos, wt]) => `${pos}: ${wt}kg`);
        if (compDetails.length > 0) parts.push(compDetails.join(", "));
    }

    const notification = {
        type: "WEIGHBRIDGE_COMPLETED",
        title: "Weighbridge Completed - Sample Collection & Lab Required",
        message: parts.join(" | "),
        relatedRequestId: wbEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES.weighbridge, notification);
}

async function notifyWeighbridgeForSampleCollection(sampleEntry) {
    const parts = [`Vehicle ${sampleEntry.vehicleNumber || "N/A"}`];
    if (sampleEntry.routeNo) parts.push(`Route: ${sampleEntry.routeNo}`);
    if (sampleEntry.taluk) parts.push(`Taluk: ${sampleEntry.taluk}`);
    if (sampleEntry.quantity) parts.push(`Qty: ${sampleEntry.quantity}L`);
    if (sampleEntry.temperature) parts.push(`Temp: ${sampleEntry.temperature}°C`);
    if (sampleEntry.sealNumbers && sampleEntry.sealNumbers.length) {
        const seals = Array.isArray(sampleEntry.sealNumbers) ? sampleEntry.sealNumbers.join(", ") : sampleEntry.sealNumbers;
        parts.push(`Seals: ${seals}`);
    }

    // Compartment-wise quality details
    if (sampleEntry.compartments && sampleEntry.compartments.length > 0) {
        for (const comp of sampleEntry.compartments) {
            if (comp.skipped) continue;
            const cParts = [`${comp.compartment}:`];
            if (comp.fat != null) cParts.push(`Fat ${comp.fat}%`);
            if (comp.clr != null) cParts.push(`CLR ${comp.clr}%`);
            if (comp.snf != null) cParts.push(`SNF ${comp.snf}%`);
            if (comp.temperature != null) cParts.push(`Temp ${comp.temperature}°C`);
            if (comp.cob) cParts.push(`COB: ${comp.cob}`);

            // Adulteration tests (only show positive results)
            const adulterants = [];
            const adulterationTests = [
                "ammoniumSulphate", "detergent", "glucose", "melamine", "salt",
                "sodiumCarbonate", "sodiumCitrate", "sorbitol", "starch", "sucrose",
                "urea", "vegetableOils", "formaldehyde", "maltodextrin"
            ];
            for (const test of adulterationTests) {
                if (comp[test] && String(comp[test]).toLowerCase() === "positive") {
                    adulterants.push(test.replace(/([A-Z])/g, " $1").trim());
                }
            }
            if (comp.sodiumIonPPM && parseFloat(comp.sodiumIonPPM) > 0) {
                adulterants.push(`Sodium Ion ${comp.sodiumIonPPM}PPM`);
            }
            if (adulterants.length > 0) cParts.push(`Adulteration: ${adulterants.join(", ")}`);

            if (cParts.length > 1) parts.push(cParts.join(" "));
        }
    }

    const notification = {
        type: "SAMPLE_COLLECTION_COMPLETED",
        title: "Sample Collection Completed - Weighbridge Update",
        message: parts.join(" | "),
        relatedRequestId: sampleEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES["sample collection"], notification);
}

async function notifyWeighbridgeForLaboratory(labEntry) {
    const parts = [`Vehicle ${labEntry.vehicleNumber || "N/A"}`];
    if (labEntry.routeNo) parts.push(`Route: ${labEntry.routeNo}`);
    if (labEntry.taluk) parts.push(`Taluk: ${labEntry.taluk}`);
    if (labEntry.driverName) parts.push(`Driver: ${labEntry.driverName}`);
    if (labEntry.supplierName) parts.push(`Supplier: ${labEntry.supplierName}`);
    if (labEntry.temperature != null) parts.push(`Temp: ${labEntry.temperature}°C`);
    if (labEntry.fat != null) parts.push(`Fat: ${labEntry.fat}%`);
    if (labEntry.snf != null) parts.push(`SNF: ${labEntry.snf}%`);
    if (labEntry.clr != null) parts.push(`CLR: ${labEntry.clr}`);
    if (labEntry.alcohol != null) parts.push(`Alcohol: ${labEntry.alcohol}%`);

    // Compartment-wise lab test details
    if (labEntry.compartments && labEntry.compartments.length > 0) {
        for (const comp of labEntry.compartments) {
            if (comp.skipped) continue;
            const cParts = [`${comp.compartment}:`];
            if (comp.fat != null) cParts.push(`Fat ${comp.fat}%`);
            if (comp.clr != null) cParts.push(`CLR ${comp.clr}`);
            if (comp.snf != null) cParts.push(`SNF ${comp.snf}%`);
            if (comp.quantity != null) cParts.push(`Qty ${comp.quantity}L`);
            if (comp.temperature != null) cParts.push(`Temp ${comp.temperature}°C`);
            if (comp.alcohol != null) cParts.push(`Alcohol ${comp.alcohol}%`);
            if (comp.cob) cParts.push(`COB: ${comp.cob}`);
            if (comp.kgFat != null) cParts.push(`KgFat ${comp.kgFat}`);
            if (comp.kgSnf != null) cParts.push(`KgSnf ${comp.kgSnf}`);

            // Adulteration tests (only show positive results)
            const adulterants = [];
            const adulterationTests = [
                "ammoniumSulphate", "detergent", "glucose", "melamine", "salt",
                "sodiumCarbonate", "sodiumCitrate", "sorbitol", "starch", "sucrose",
                "urea", "vegetableOils", "formaldehyde", "maltodextrin"
            ];
            for (const test of adulterationTests) {
                if (comp[test] && String(comp[test]).toLowerCase() === "positive") {
                    adulterants.push(test.replace(/([A-Z])/g, " $1").trim());
                }
            }
            if (comp.sodiumIonPPM && parseFloat(comp.sodiumIonPPM) > 0) {
                adulterants.push(`Sodium Ion ${comp.sodiumIonPPM}PPM`);
            }
            if (adulterants.length > 0) cParts.push(`Adulteration: ${adulterants.join(", ")}`);

            if (cParts.length > 1) parts.push(cParts.join(" "));
        }
    }

    const notification = {
        type: "LABORATORY_COMPLETED",
        title: "Lab Test Completed - Weighbridge Update",
        message: parts.join(" | "),
        relatedRequestId: labEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES.laboratory, notification);
}

module.exports = {
    notifyWeighbridgeForGateEntry,
    notifySampleAndLabForWeighbridge,
    notifyWeighbridgeForSampleCollection,
    notifyWeighbridgeForLaboratory,
    createNotificationsForDepartments,
    getUsersByDepartments,
};