const User = require("../models/userModel");

const resetUserLimits = async () => {
  try {
    await User.resetUserLimits();
    console.log("Limites mensais redefinidos com sucesso.");
  } catch (error) {
    console.error("Erro ao redefinir limites mensais:", error.message);
  }
};

module.exports = {
  resetUserLimits,
};
