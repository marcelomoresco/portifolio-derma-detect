const express = require("express");
const mongoSanitize = require("express-mongo-sanitize");
const morgan = require("morgan");
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");
const prometheusClient = require("prom-client");
const fs = require("fs");
const path = require("path");
const cron = require("node-cron");
const dotenv = require("dotenv");
const connectDB = require("./config/db");

const userRoutes = require("./routes/authRouter");
const analysisRoutes = require("./routes/analysisRouter");
const externalRoutes = require("./routes/externalsRouter");
const resetUserLimits = require("./services/resetAnalysisMonthly");

dotenv.config();

connectDB();

const ensureUploadsDirExists = () => {
  const uploadsDir = path.join(__dirname, "uploads");
  if (!fs.existsSync(uploadsDir)) {
    fs.mkdirSync(uploadsDir);
    console.log("Diretório 'uploads/' criado com sucesso.");
  }
};

if (process.env.NODE_ENV !== "test") {
  cron.schedule("0 0 1 * *", () => {
    console.log("Executando tarefa de redefinição mensal...");
    resetUserLimits();
  });
}

const app = express();

const collectDefaultMetrics = prometheusClient.collectDefaultMetrics;
collectDefaultMetrics();
ensureUploadsDirExists();

// Middlewares
app.use(express.json());
app.use(mongoSanitize());
app.use(morgan("dev"));
app.use(helmet());

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message:
    "Muitas requisições feitas pelo mesmo IP, por favor tente novamente mais tarde",
});

app.get("/metrics", async (req, res) => {
  res.set("Content-Type", prometheusClient.register.contentType);
  res.end(await prometheusClient.register.metrics());
});

app.use(limiter);

app.use("/api/users", userRoutes);
app.use("/api/analyses", analysisRoutes);
app.use("/api/externals", externalRoutes);

module.exports = app;
