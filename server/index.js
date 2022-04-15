// Import Libraries
const express = require("express");
require("dotenv").config();
const cors = require("cors");

const path = require("path");

// Development Supports
const populate = require("./src/utils/populate"); // eslint-disable-line

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const teams = require("./src/routes/team.routes");
const players = require("./src/routes/players.routes");
const eplStatsRouter = require("./src/routes/eplStats.routes");
const fantasyStatsRouter = require("./src/routes/fantasyStat.routes");
const userRouter = require("./src/routes/user.routes");
const fixtures = require("./src/routes/fixtures.routes");
const gameWeekRoutes = require("./src/routes/gameWeek.routes");
const adminAuthRouter = require("./src/routes/adminAuth.routes");
const backupRouter = require("./src/routes/backup.routes");

// Import Middleware
const errorMiddleware = require("./src/middleware/error.middleware");

// Add Node Features
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Rate Limit
const rateLimiter = require("./src/config/rate_config");
app.use(rateLimiter);

// Serve static files
app.use("/uploads/", express.static(path.join(__dirname, "/uploads")));

// Add Routes to app
app.use("/teams", teams);
app.use("/players", players);
app.use("/fixtures", fixtures);
app.use("/gameWeek", gameWeekRoutes);
app.use("/eplStats", eplStatsRouter);
app.use("/fantasyStats", fantasyStatsRouter);
app.use("/user", userRouter);
app.use("/admin", adminAuthRouter);
app.use("/backup", backupRouter);

// Run populate scripts
// populate.addTestPlayer();
// populate.addTestUser();
// populate.addTestGameweek();

populate.addTestAdmin();

populate.populateTeams();
populate.populatePlayers();
populate.populateFixture();

// Add Middleware
app.use(errorMiddleware);

// Run Node app
module.exports = app;
