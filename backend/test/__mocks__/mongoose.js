const mongoose = jest.createMockFromModule("mongoose");

const mockSchema = function (definition) {
  return {
    definition,
    index: jest.fn(), // Mock do método index
    statics: {}, // Para métodos estáticos
  };
};

mongoose.Schema = mockSchema;

// Adicione o mock para Types.ObjectId
mongoose.Schema.Types = {
  ObjectId: jest.fn(), // Simula o ObjectId
};

mongoose.model = jest.fn().mockImplementation((modelName, schema) => {
  return { modelName, schema }; // Retorna um modelo simulado
});

module.exports = mongoose;
