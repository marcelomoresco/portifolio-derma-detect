const express = require("express");
const mongoSanitize = require("express-mongo-sanitize");
const morgan = require("morgan");
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");

const dotenv = require("dotenv");
const connectDB = require("./config/db");

const userRoutes = require("./routes/userRoutes");
const analysisRoutes = require("./routes/analysisRoutes");

dotenv.config();
connectDB();

const app = express();

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

app.use(limiter);
app.use("/api/users", userRoutes);
app.use("/api/analyses", analysisRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
