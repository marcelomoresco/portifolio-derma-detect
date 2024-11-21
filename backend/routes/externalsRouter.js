const express = require("express");
const { protect } = require("../middlewares/authMiddleware");

const { sendChatPrompt } = require("../controllers/externalsController");

const router = express.Router();

router.route("/send-prompt").post(protect, sendChatPrompt);

module.exports = router;
