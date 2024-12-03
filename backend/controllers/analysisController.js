const Analysis = require("../models/analysisModel");
const fs = require("fs");
const path = require("path");
const { processImageAndPredict } = require("../services/tensorFlowService");
const { sendPrompt } = require("../services/open_ai_service");
const DiseaseCategoryMapper = require("../mapper/diseaseCategoryMapper");

const createAnalysis = async (req, res) => {
  console.log("File:", req.file);

  if (!req.file) {
    return res.status(400).json({ message: "Arquivo de imagem é obrigatório" });
  }

  try {
    const filePath = req.file.path;

    const fileBuffer = fs.readFileSync(filePath);
    const imageBase64 = fileBuffer.toString("base64");

    const result = await processImageAndPredict(filePath);
    if (result.predictedClass === null) {
      res.status(500).json({
        message: "Não foi possível identificar o problema",
      });
      return;
    }

    const analysis = new Analysis({
      user: req.user.id,
      image: imageBase64,
      predictedClass: result.predictedClass,
      confidence: result.confidence,
    });

    await analysis.save();

    req.user.monthlyAnalyses -= 1;
    await req.user.save();

    fs.unlinkSync(filePath);

    const responseAnalysis = analysis.toObject();
    delete responseAnalysis.image;

    res.status(201).json({
      message: "Análise criada com sucesso",
      analysis: responseAnalysis,
      remainingAnalyses: req.user.monthlyAnalyses,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao criar análise", error });
  }
};

const getAnalyses = async (req, res) => {
  try {
    const analyses = await Analysis.find({ user: req.user.id });
    const response = analyses.map((analysis) => ({
      predict: analysis.predictedClass,
      confidence: analysis.confidence,
      id: analysis._id,
      date: analysis.createdAt,
    }));
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ message: "Erro ao buscar análises" });
  }
};

const getAnalysisById = async (req, res) => {
  try {
    const { id } = req.params;

    const analysis = await Analysis.findById(id);

    if (!analysis) {
      return res.status(404).json({ message: "Análise não encontrada" });
    }

    const diseasePredicted =
      DiseaseCategoryMapper.fromJson(analysis.predictedClass) ||
      analysis.predictedClass;

    const prompt = `
Com base nos resultados da análise de imagem:
- Classe prevista: ${diseasePredicted} (traduza para o português)

Gere um conteúdo explicativo em HTML, incluindo as seguintes informações:
1. O que é ${diseasePredicted} (traduzido para o português) e como se desenvolve.
2. Quais os riscos e complicações associados a ${diseasePredicted} (traduzido).
3. Como tratar ${diseasePredicted} (traduzido) de forma eficaz.
4. O que evitar para prevenir a propagação ou agravamento da infecção.

Responda **inteiramente em português**, incluindo o nome da predição traduzido
`;

    const responsePrompt = await sendPrompt(prompt);

    res.status(200).json({ analysis, prompt: responsePrompt });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao buscar análise", error });
  }
};

const getRecentAnalyses = async (req, res) => {
  try {
    const recentAnalyses = await Analysis.find({ user: req.user.id })
      .sort({ createdAt: -1 })
      .limit(5);

    const response = recentAnalyses.map((analysis) => ({
      predict: analysis.predictedClass,
      confidence: analysis.confidence,
      id: analysis._id,
      date: analysis.createdAt,
    }));

    res.status(200).json(response);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ message: "Erro ao buscar as análises recentes", error });
  }
};

module.exports = {
  createAnalysis,
  getAnalyses,
  getAnalysisById,
  getRecentAnalyses,
};
