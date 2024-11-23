const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true, index: true },
  password: { type: String, required: true },
  monthlyAnalyses: {
    type: Number,
    default: 20,
  },
  lastReset: {
    type: Date,
    default: Date.now,
  },
});

userSchema.index({ email: 1 });

module.exports = mongoose.model("User", userSchema);

userSchema.statics.resetMonthlyLimits = async function () {
  const now = new Date();
  const firstDayOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);

  await this.updateMany(
    { lastReset: { $lt: firstDayOfMonth } },
    { $set: { monthlyAnalyses: 20, lastReset: now } }
  );
};
