const OpenAIService = require("../services/open_ai_service");

const sendChatPrompt = async (req, res) => {
  const { prompt } = req.body;

  if (!prompt) {
    return res.status(400).json({ error: "O campo 'prompt' é obrigatório." });
  }

  try {
    const response = await OpenAIService.sendPrompt(prompt);
    return res.status(200).json({ response });
  } catch (error) {
    console.error("Erro ao processar o prompt:", error);
    return res.status(500).json({
      message:
        "Ocorreu um erro ao processar o prompt. Tente novamente mais tarde.",
    });
  }
};

module.exports = {
  sendChatPrompt,
};
