// test/processImageAndPredict.test.js

const fs = require("fs");
const sharp = require("sharp");
const tf = require("@tensorflow/tfjs-node");
const path = require("path");
const { processImageAndPredict } = require("../services/tensorFlowService");

// Mocks
jest.mock("fs");
jest.mock("sharp");
jest.mock("@tensorflow/tfjs-node", () => ({
  loadGraphModel: jest.fn(),
  tensor: jest.fn(),
}));

describe("processImageAndPredict Service", () => {
  const modelMock = {
    predict: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
    tf.loadGraphModel.mockResolvedValue(modelMock);
  });

  it("deve processar a imagem e retornar uma predição válida", async () => {
    fs.existsSync.mockReturnValue(true);

    const mockTensor = {
      div: jest.fn(() => mockTensor),
    };

    // Simula uma predição válida
    const predictionResult = [[0.2, 0.5, 0.3]];
    mockTensor.arraySync = jest.fn(() => predictionResult);
    tf.tensor.mockReturnValue(mockTensor);

    sharp.mockImplementation(() => ({
      resize: jest.fn().mockReturnThis(),
      raw: jest.fn().mockReturnThis(),
      toBuffer: jest.fn().mockResolvedValue(new Uint8Array(224 * 224 * 3)),
    }));

    modelMock.predict.mockReturnValue({
      argMax: jest.fn(() => ({
        arraySync: jest.fn(() => [1]),
      })),
      arraySync: jest.fn(() => predictionResult),
    });

    const result = await processImageAndPredict("dummy_path");

    expect(sharp).toHaveBeenCalledWith("dummy_path");
    expect(result).toEqual({
      predictedClass:
        "Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesions",
      confidence: 0.5,
    });
  });

  it("deve retornar null para classe quando confiança é baixa", async () => {
    fs.existsSync.mockReturnValue(true);

    const mockTensor = {
      div: jest.fn(() => mockTensor),
    };

    // Simula uma predição de baixa confiança
    const predictionResult = [[0.2, 0.1, 0.05]];
    mockTensor.arraySync = jest.fn(() => predictionResult);
    tf.tensor.mockReturnValue(mockTensor);

    sharp.mockImplementation(() => ({
      resize: jest.fn().mockReturnThis(),
      raw: jest.fn().mockReturnThis(),
      toBuffer: jest.fn().mockResolvedValue(new Uint8Array(224 * 224 * 3)),
    }));

    modelMock.predict.mockReturnValue({
      argMax: jest.fn(() => ({
        arraySync: jest.fn(() => [0]),
      })),
      arraySync: jest.fn(() => predictionResult),
    });

    const result = await processImageAndPredict("dummy_path");

    expect(result).toEqual({
      predictedClass: null,
      confidence: 0.2,
    });
  });

  it("deve lançar um erro se o processamento falhar", async () => {
    fs.existsSync.mockReturnValue(true);

    sharp.mockImplementation(() => {
      throw new Error("Erro ao processar imagem");
    });

    await expect(processImageAndPredict("dummy_path")).rejects.toThrow(
      "Erro ao processar imagem e fazer previsão: Erro ao processar imagem"
    );
  });
});
