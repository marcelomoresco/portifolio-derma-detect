const express = require("express");
const {
  registerUser,
  loginUser,
  getUserProfile,
  deleteUser,
} = require("../controllers/authController");
const { protect } = require("../middlewares/authMiddleware");
const router = express.Router();

router.post("/register", registerUser);
router.post("/login", loginUser);
router.get("/profile", protect, getUserProfile);
router.delete("/delete", protect, deleteUser);

module.exports = router;
