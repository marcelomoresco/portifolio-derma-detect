const express = require("express");
const { protect } = require("../middlewares/authMiddleware");

const {
  createAnalysis,
  getAnalyses,
  updateAnalysis,
  deleteAnalysis,
} = require("../controllers/analysisController");

const router = express.Router();

router.route("/").get(protect, getAnalyses).post(protect, createAnalysis);

router
  .route("/:id")
  .put(protect, updateAnalysis)
  .delete(protect, deleteAnalysis);

module.exports = router;
