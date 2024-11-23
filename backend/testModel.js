const tf = require("@tensorflow/tfjs-node");

async function testModel() {
  try {
    const modelPath =
      "file:///Users/marcelomoresco/Documents/Development/Portifolio/portifolio-derma-detect/backend/tfjs_model/model.json"; // Caminho do modelo
    console.log("Tentando carregar o modelo...");
    const model = await tf.loadGraphModel(modelPath);
    console.log("Modelo carregado com sucesso!");

    // Teste uma previsão com dados aleatórios
    const testInput = tf.randomNormal([1, 224, 224, 3]); // Exemplo de entrada 224x224 RGB
    const prediction = model.predict(testInput);
    console.log("Predição bem-sucedida:");
    prediction.print(); // Exibe a predição no console
  } catch (error) {
    console.error("Erro ao carregar ou testar o modelo:", error);
  }
}

testModel();
