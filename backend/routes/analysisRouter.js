const express = require("express");
const { protect } = require("../middlewares/authMiddleware");
const { upload } = require("../middlewares/multerMiddleware");

const {
  createAnalysis,
  getAnalyses,
  getAnalysisById,
} = require("../controllers/analysisController");

const router = express.Router();

router
  .route("/")
  .get(protect, getAnalyses)
  .post(protect, upload.single("image"), createAnalysis);

router.route("/:id").get(protect, getAnalysisById);

module.exports = router;
