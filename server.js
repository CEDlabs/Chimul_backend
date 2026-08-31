// require("dotenv").config();

// const express = require("express");
// const helmet = require("helmet");
// const rateLimit = require("express-rate-limit");
// const cors = require("cors");
// const cookieParser = require("cookie-parser");
// const morgan = require("morgan");
// const session = require("express-session");

// const { connectDB } = require("./config/db");

// const app = express();

// connectDB();

// app.use(helmet());
// //app.use(cors());
// app.use(express.json());
// app.use(cookieParser());
// app.use(morgan("dev"));

// const limiter = rateLimit({
//     windowMs: 15 * 60 * 1000,
//     max: 100,
// });

// app.use(limiter);

// app.use("/api/auth", require("./routes/authRoutes"));

// app.use(cors({
//     origin: "http://localhost:5173",
//     credentials: true
// }));
// // app.use(cors({
// //     origin: "*"
// // }));

// app.use(
//   session({
//     secret: process.env.SESSION_SECRET,
//     resave: false,
//     saveUninitialized: false,

//     cookie: {
//       httpOnly: true,
//       secure: false, // true if using HTTPS
//        sameSite: "lax",
//       maxAge: 30 * 60 * 1000 // 30 minutes
//     }
//   })
// );

// const PORT = process.env.PORT || 5000;

// app.listen(PORT, () => {
//     console.log(`Server running on ${PORT}`);
// });



// require("dotenv").config();

// const express = require("express");
// const helmet = require("helmet");
// const rateLimit = require("express-rate-limit");
// const cors = require("cors");
// const cookieParser = require("cookie-parser");
// const morgan = require("morgan");
// const session = require("express-session");

// const { connectDB } = require("./config/db");

// const app = express();

// // Connect Database
// connectDB();

// // Security
// app.use(helmet());

// // CORS (ONLY ONCE)
// app.use(cors({
//     origin: "http://localhost:5173",
//     credentials: true
// }));

// // Body Parser
// app.use(express.json());

// // Cookie Parser
// app.use(cookieParser());

// // Logger
// app.use(morgan("dev"));

// // Rate Limiter
// app.use(rateLimit({
//     windowMs: 15 * 60 * 1000,
//     max: 100
// }));

// // Session Middleware (BEFORE ROUTES)
// app.use(session({
//     secret: process.env.SESSION_SECRET,
//     resave: false,
//     saveUninitialized: false,

//     cookie: {
//         httpOnly: true,
//         secure: false,          // true only when using HTTPS
//         sameSite: "lax",
//         maxAge: 30 * 60 * 1000
//     }
// }));

// app.use((req, res, next) => {
//     console.log(req.method, req.url);
//     next();
// });

// // Routes (AFTER session)
// console.log("Mounting WayBridge routes...");
// app.use("/api/auth", require("./routes/authRoutes"));
// app.use("/api/gate-entry", require("./routes/gateEntryRoutes"));
// app.use("/api/waybridge", require("./routes/weighBridgeRoutes"));
// app.use("/api/auth/waybridge", require("./routes/weighBridgeRoutes"));
// app.use("/api/sample-collection", require("./routes/sampleCollectionRoutes"));
// app.use("/api/milk-collection", require("./routes/milkCollectionRoutes"));
// app.use("/api/laboratory", require("./routes/laboratoryTestRoutes"));

// const PORT = process.env.PORT || 5000;

// app.listen(PORT, () => {
//     console.log(`Server running on port ${PORT}`);
// });


require("dotenv").config();

const express = require("express");
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const morgan = require("morgan");

const { connectDB } = require("./config/db");
const { initSecuritySchema } = require("./models/sessionModel");

const app = express();

/* =========================================================
   CONNECT DATABASE
========================================================= */

connectDB()
    .then(() => initSecuritySchema())
    .catch((err) => console.error("Security schema init error:", err.message));

/* =========================================================
   SECURITY
========================================================= */

app.use(helmet());

/* =========================================================
   CORS
========================================================= */

const allowedOrigins = [
    "http://localhost:5173",
    "http://127.0.0.1:5173",
    "http://192.168.29.18:5173"
];

app.use(
    cors({
        origin: function (origin, callback) {
            if (!origin) {
                return callback(null, true);
            }
            if (allowedOrigins.includes(origin)) {
                return callback(null, true);
            }
            console.log("CORS blocked:", origin);
            return callback(new Error("Not allowed by CORS"));
        },
        credentials: true
    })
);

/* =========================================================
   BODY PARSER
========================================================= */

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* =========================================================
   COOKIE PARSER
========================================================= */

app.use(cookieParser());

/* =========================================================
   LOGGER
========================================================= */

app.use(morgan("dev"));

/* =========================================================
   RATE LIMITER
========================================================= */

app.use(
    rateLimit({
        windowMs: 15 * 60 * 1000,
        max: 500,
        standardHeaders: true,
        legacyHeaders: false
    })
);

/* =========================================================
   REQUEST LOGGER
========================================================= */

app.use((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    next();
});

/* =========================================================
   ROUTES
========================================================= */

console.log("Mounting API routes...");

app.use("/api/auth", require("./routes/authRoutes"));
app.use("/api/gate-entry", require("./routes/gateEntryRoutes"));
app.use("/api/waybridge", require("./routes/weighBridgeRoutes"));
app.use("/api/sample-collection", require("./routes/sampleCollectionRoutes"));
app.use("/api/milk-collection", require("./routes/milkCollectionRoutes"));
app.use("/api/laboratory", require("./routes/laboratoryTestRoutes"));
app.use("/api/vehicles", require("./routes/vehicleRoutes"));

/* =========================================================
   HEALTH CHECK
========================================================= */

app.get("/api/health", (req, res) => {
    res.status(200).json({
        success: true,
        message: "Backend is running",
        serverTime: new Date()
    });
});

/* =========================================================
   404 HANDLER
========================================================= */

app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: "API route not found"
    });
});

/* =========================================================
   ERROR HANDLER
========================================================= */

app.use((err, req, res, next) => {
    console.error("Server Error:", err.message);
    if (err.message === "Not allowed by CORS") {
        return res.status(403).json({
            success: false,
            message: "CORS blocked this request"
        });
    }
    res.status(500).json({
        success: false,
        message: "Internal server error"
    });
});

/* =========================================================
   START SERVER
========================================================= */

const PORT = process.env.PORT || 5000;

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
    console.log(`Local: http://localhost:${PORT}`);
    console.log(`Network: http://YOUR_SERVER_IP:${PORT}`);
});