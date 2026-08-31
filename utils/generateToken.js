const jwt = require("jsonwebtoken");
const { getJwtSecret } = require("../config/security");

const generateToken = (user) => {
    return jwt.sign(
        {
            id: user.id,
            employeeId: user.employeeId || user.employee_id,
            email: user.email,
            department: user.department,
            // Single-active-session marker: incremented on every login so
            // superseded tokens can be rejected server-side.
            sessionVersion: user.sessionVersion,
        },
        getJwtSecret(),
        {
            expiresIn: process.env.JWT_EXPIRE || "12h",
        }
    );
};

module.exports = generateToken;
