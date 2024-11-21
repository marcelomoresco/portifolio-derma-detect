const { OpenAI } = require("openai");

// Inicializar o cliente OpenAI
const openai = new OpenAI({
  apiKey:
    process.env.OPENAI_API_KEY ||
    "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",
});

// Função para enviar o prompt
const sendPrompt = async (prompt) => {
  if (!prompt) {
    throw new Error("O campo 'prompt' é obrigatório.");
  }

  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-4",
      messages: [
        {
          role: "user",
          content: prompt,
        },
      ],
      temperature: 1,
      max_tokens: 2048,
      top_p: 1,
      presence_penalty: 0,
    });

    return completion.choices[0].message.content;
  } catch (error) {
    console.error("Erro ao gerar texto:", error);
    throw error;
  }
};

module.exports = {
  sendPrompt,
};
