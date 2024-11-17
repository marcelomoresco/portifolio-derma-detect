const { OpenAI } = require("openai");
const fs = require("fs");
const { Readable } = require("stream");

class OpenAIService {
  constructor() {
    this.openai = new OpenAI({
      apiKey: process.env.OPENAI_API_KEY,
    });
  }

  async sendPrompt(prompt) {
    try {
      const completion = await this.openai.chat.completions.create({
        model: "gpt-4o",
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
  }
}

module.exports = OpenAIService;
