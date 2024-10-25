const Analysis = require("../models/analysisModel");

// Criar nova análise
const createAnalysis = async (req, res) => {
  const { imageUrl, description } = req.body;

  try {
    const analysis = new Analysis({
      user: req.user.id,
      imageUrl,
      description,
    });

    await analysis.save();

    res.status(201).json(analysis);
  } catch (error) {
    res.status(500).json({ message: "Erro ao criar análise" });
  }
};

// Obter todas as análises do usuário autenticado
const getAnalyses = async (req, res) => {
  try {
    const analyses = await Analysis.find({ user: req.user.id });
    res.status(200).json(analyses);
  } catch (error) {
    res.status(500).json({ message: "Erro ao buscar análises" });
  }
};

// Atualizar análise existente
const updateAnalysis = async (req, res) => {
  const { id } = req.params;
  const { imageUrl, description } = req.body;

  try {
    const analysis = await Analysis.findById(id);

    if (!analysis) {
      return res.status(404).json({ message: "Análise não encontrada" });
    }

    // Verifica se a análise pertence ao usuário
    if (analysis.user.toString() !== req.user.id) {
      return res.status(401).json({ message: "Não autorizado" });
    }

    analysis.imageUrl = imageUrl || analysis.imageUrl;
    analysis.description = description || analysis.description;

    await analysis.save();

    res.status(200).json(analysis);
  } catch (error) {
    res.status(500).json({ message: "Erro ao atualizar análise" });
  }
};

// Deletar uma análise
const deleteAnalysis = async (req, res) => {
  const { id } = req.params;

  try {
    const analysis = await Analysis.findById(id);

    if (!analysis) {
      return res.status(404).json({ message: "Análise não encontrada" });
    }

    // Verifica se a análise pertence ao usuário
    if (analysis.user.toString() !== req.user.id) {
      return res.status(401).json({ message: "Não autorizado" });
    }

    await analysis.remove();

    res.status(200).json({ message: "Análise deletada" });
  } catch (error) {
    res.status(500).json({ message: "Erro ao deletar análise" });
  }
};

module.exports = {
  createAnalysis,
  getAnalyses,
  updateAnalysis,
  deleteAnalysis,
};
