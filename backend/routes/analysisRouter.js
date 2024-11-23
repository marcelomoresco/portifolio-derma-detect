const express = require("express");
const { protect } = require("../middlewares/authMiddleware");
const { upload } = require("../middlewares/multerMiddleware");

const {
  createAnalysis,
  getAnalyses,
  getAnalysisById,
  getRecentAnalyses,
} = require("../controllers/analysisController");

const router = express.Router();

router
  .route("/")
  .get(protect, getAnalyses)
  .post(protect, upload.single("image"), createAnalysis);

router.route("/recents").get(protect, getRecentAnalyses);

router.route("/:id").get(protect, getAnalysisById);

module.exports = router;
