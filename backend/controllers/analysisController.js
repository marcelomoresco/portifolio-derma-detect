const Analysis = require("../models/analysisModel");
const fs = require("fs");
const path = require("path");
const { processImageAndPredict } = require("../services/tensorFlowService");

// Criar nova análise
const createAnalysis = async (req, res) => {
  if (!req.file) {
    return res.status(400).json({ message: "Arquivo de imagem é obrigatório" });
  }

  try {
    console.log("req.file:", req.file); // Log para depuração

    const filePath = req.file.path;

    // Leia o arquivo e converta para Base64
    const fileBuffer = fs.readFileSync(filePath);
    const imageBase64 = fileBuffer.toString("base64");

    const result = await processImageAndPredict(filePath);

    const analysis = new Analysis({
      user: req.user.id,
      image: imageBase64,
      predictedClass: result.predictedClass,
      confidence: result.confidence,
    });

    await analysis.save();

    // Atualizar o limite de análises do usuário
    req.user.monthlyAnalyses -= 1;
    await req.user.save();

    fs.unlinkSync(filePath);

    const responseAnalysis = analysis.toObject(); // Converte para objeto simples
    delete responseAnalysis.image; // Remove o campo `image`

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

    res.status(200).json(analysis);
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
