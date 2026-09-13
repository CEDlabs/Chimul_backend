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
    const notification = {
        type: "GATE_ENTRY_CREATED",
        title: "New Gate Entry - Vehicle Arrived",
        message: `Vehicle ${gateEntry.vehicleNumber} arrived at ${gateEntry.entryDateTime || new Date().toLocaleString()} for Route ${gateEntry.routeName || gateEntry.routeNo || "N/A"}. ${gateEntry.driverName ? `Driver: ${gateEntry.driverName}.` : ""} ${gateEntry.sealNumbers && gateEntry.sealNumbers.length ? `Seals: ${gateEntry.sealNumbers.join(", ")}.` : ""}`,
        relatedRequestId: gateEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES.gate, notification);
}

async function notifySampleAndLabForWeighbridge(wbEntry) {
    const compartmentDetails = [];
    if (wbEntry.dumpPosition1 && wbEntry.intermediateWeight1) {
        compartmentDetails.push(`${wbEntry.dumpPosition1}: ${wbEntry.intermediateWeight1}kg`);
    }
    if (wbEntry.dumpPosition2 && wbEntry.intermediateWeight2) {
        compartmentDetails.push(`${wbEntry.dumpPosition2}: ${wbEntry.intermediateWeight2}kg`);
    }
    if (wbEntry.dumpPosition3 && wbEntry.intermediateWeight3) {
        compartmentDetails.push(`${wbEntry.dumpPosition3}: ${wbEntry.intermediateWeight3}kg`);
    }
    
    const compartmentsText = compartmentDetails.length ? ` Compartments: ${compartmentDetails.join(", ")}` : "";
    
    const notification = {
        type: "WEIGHBRIDGE_COMPLETED",
        title: "Weighbridge Completed - Sample Collection & Lab Required",
        message: `Vehicle ${wbEntry.vehicleNumber} (Route ${wbEntry.routeName || "N/A"}) weighbridge completed. Gross: ${wbEntry.grossWeight}kg, Net: ${wbEntry.netWeight}kg.${compartmentsText} Ready for sample collection and lab testing.`,
        relatedRequestId: wbEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES.weighbridge, notification);
}

async function notifyWeighbridgeForSampleCollection(sampleEntry) {
    const compartmentDetails = [];
    if (sampleEntry.compartments && sampleEntry.compartments.length > 0) {
        for (const comp of sampleEntry.compartments) {
            if (!comp.skipped) {
                compartmentDetails.push(`${comp.compartment}: Fat ${comp.fat || "-"}%, CLR ${comp.clr || "-"}%, SNF ${comp.snf || "-"}%`);
            }
        }
    }
    
    const notification = {
        type: "SAMPLE_COLLECTION_COMPLETED",
        title: "Sample Collection Completed - Weighbridge Update",
        message: `Vehicle ${sampleEntry.vehicleNumber} (Route ${sampleEntry.routeNo || "N/A"}) sample collected.${compartmentDetails.length ? ` Compartments: ${compartmentDetails.join("; ")}` : ""}`,
        relatedRequestId: sampleEntry.id,
    };
    return createNotificationsForDepartments(DEPARTMENT_ROUTES["sample collection"], notification);
}

async function notifyWeighbridgeForLaboratory(labEntry) {
    const compartmentDetails = [];
    if (labEntry.compartments && labEntry.compartments.length > 0) {
        for (const comp of labEntry.compartments) {
            if (!comp.skipped) {
                compartmentDetails.push(`${comp.compartment}: Fat ${comp.fat || "-"}%, CLR ${comp.clr || "-"}%, SNF ${comp.snf || "-"}%`);
            }
        }
    }
    
    const notification = {
        type: "LABORATORY_COMPLETED",
        title: "Lab Test Completed - Weighbridge Update",
        message: `Vehicle ${labEntry.vehicleNumber} (Route ${labEntry.routeNo || "N/A"}) lab test completed.${compartmentDetails.length ? ` Compartments: ${compartmentDetails.join("; ")}` : ""}`,
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