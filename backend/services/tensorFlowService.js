const tf = require("@tensorflow/tfjs-node");
const sharp = require("sharp");
const path = require("path");
const fs = require("fs");

let model;
const classNames = [
  "Acne and Rosacea Photos",
  "Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesions",
  "Atopic Dermatitis Photos",
  "Cellulitis Impetigo and other Bacterial Infections",
  "Eczema Photos",
  "Exanthems and Drug Eruptions",
  "Herpes HPV and other STDs Photos",
  "Light Diseases and Disorders of Pigmentation",
  "Lupus and other Connective Tissue diseases",
  "Melanoma Skin Cancer Nevi and Moles",
  "Poison Ivy Photos and other Contact Dermatitis",
  "Psoriasis pictures Lichen Planus and related diseases",
  "Seborrheic Keratoses and other Benign Tumors",
  "Systemic Disease",
  "Tinea Ringworm Candidiasis and other Fungal Infections",
  "Urticaria Hives",
  "Vascular Tumors",
  "Vasculitis Photos",
  "Warts Molluscum and other Viral Infections",
];

const CONFIDENCE_THRESHOLD = 0.3;

const loadModel = async () => {
  if (!model) {
    const modelDir = path.join(__dirname, "../derma_check_model");
    const modelPath = path.join(modelDir, "model.json");

    if (!fs.existsSync(modelPath)) {
      throw new Error(`Modelo não encontrado em: ${modelPath}`);
    }

    console.log(`Carregando modelo de: ${modelPath}`);
    model = await tf.loadGraphModel(`file://${modelPath}`);
    console.log("Modelo carregado com sucesso.");
  }
};

const processImageAndPredict = async (filePath) => {
  try {
    await loadModel();

    const processedImage = await sharp(filePath)
      .resize({ width: 192, height: 192 })
      .removeAlpha()
      .toColourspace("sRGB")
      .raw()
      .toBuffer();

    const inputTensor = tf.tensor(
      new Uint8Array(processedImage),
      [1, 192, 192, 3],
      "float32"
    );

    const prediction = model.predict(inputTensor);

    const predictedIndex = prediction.argMax(-1).arraySync()[0];
    const confidence = prediction.arraySync()[0][predictedIndex];

    if (confidence < CONFIDENCE_THRESHOLD) {
      console.log("Predição: Não identificado");
      console.log(`Confiança: ${confidence.toFixed(2)}`);
      return {
        predictedClass: null,
        confidence: confidence,
      };
    }

    console.log(`Predição: ${classNames[predictedIndex]}`);
    console.log(`Confiança: ${confidence.toFixed(2)}`);

    return {
      predictedClass: classNames[predictedIndex],
      confidence: confidence,
    };
  } catch (error) {
    throw new Error(
      `Erro ao processar imagem e fazer previsão: ${error.message}`
    );
  }
};

module.exports = {
  processImageAndPredict,
};
