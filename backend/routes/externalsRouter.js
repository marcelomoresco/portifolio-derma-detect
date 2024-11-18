const express = require("express");
const { protect } = require("../middlewares/authMiddleware");

const { sendPrompt } = require("../controllers/externalsController");

const router = express.Router();

router.route("/send-prompt").post(protect, sendPrompt);

module.exports = router;
