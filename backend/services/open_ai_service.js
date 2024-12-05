const { OpenAI } = require("openai");

// inicialize o cliente OpenAI
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

// enviar o prompt
const sendPrompt = async (prompt) => {
  if (!prompt) {
    throw new Error("O campo 'prompt' é obrigatório.");
  }

  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-3.5-turbo",
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
