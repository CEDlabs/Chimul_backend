const Department = require("../models/departmentModel");

// Get all departments
exports.getDepartments = async (req, res) => {
  try {
    let departments = await Department.list();
    
    if (req.query.category) {
      departments = departments.filter(d => d.category === req.query.category);
    }
    
    // Map id to _id for frontend compatibility since frontend might expect _id from mongoose
    const formattedDepts = departments.map(d => ({
        ...d,
        _id: d.id
    }));

    res.status(200).json({ success: true, data: formattedDepts });
  } catch (error) {
    console.error("Error fetching departments:", error);
    res.status(500).json({ success: false, message: "Server Error" });
  }
};

// Create new department
exports.createDepartment = async (req, res) => {
  try {
    const { name, category, description } = req.body;

    if (!name || !category) {
      return res.status(400).json({ success: false, message: "Please provide department name and category." });
    }

    const newDept = await Department.create({ name, category, description });
    newDept._id = newDept.id;
    res.status(201).json({ success: true, data: newDept });
  } catch (error) {
    console.error("Error creating department:", error);
    if (error.message === "Department name already exists.") {
      return res.status(400).json({ success: false, message: "Department name already exists." });
    }
    res.status(500).json({ success: false, message: "Server Error" });
  }
};

// Update department
exports.updateDepartment = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, category, description } = req.body;

    const dept = await Department.update(id, { name, category, description });
    dept._id = dept.id;

    res.status(200).json({ success: true, data: dept });
  } catch (error) {
    console.error("Error updating department:", error);
    if (error.message === "Department name already exists.") {
      return res.status(400).json({ success: false, message: "Department name already exists." });
    }
    res.status(500).json({ success: false, message: "Server Error" });
  }
};

// Delete department
exports.deleteDepartment = async (req, res) => {
  try {
    const { id } = req.params;
    await Department.remove(id);

    res.status(200).json({ success: true, message: "Department deleted successfully." });
  } catch (error) {
    console.error("Error deleting department:", error);
    res.status(500).json({ success: false, message: "Server Error" });
  }
};
