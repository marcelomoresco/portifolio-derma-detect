const request = require("supertest");
const app = require("../app");
const User = require("../models/userModel");

jest.mock("../middlewares/authMiddleware", () => ({
  protect: (req, res, next) => {
    req.user = { id: "12345" }; // Simula um usuário autenticado
    next();
  },
}));

jest.mock("bcryptjs", () => ({
  compare: jest.fn(() => true), // Mocka a validação de senha
}));

// Mock do jsonwebtoken para ignorar a validação do token
jest.mock("jsonwebtoken", () => ({
  sign: jest.fn(() => "mocked-token"), // Retorna um token simulado
  verify: jest.fn(() => ({ id: "12345" })), // Simula a verificação de token bem-sucedida
}));

User.create = jest.fn();
User.findOne = jest.fn();
User.findById = jest.fn();

describe("User API", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  afterAll(() => {
    jest.clearAllMocks();
    jest.restoreAllMocks();
  });

  it("should login a user", async () => {
    User.findOne.mockResolvedValue({
      _id: "12345",
      email: "testuser@example.com",
      password: "hashedpassword",
    });

    const res = await request(app).post("/api/users/login").send({
      email: "testuser@example.com",
      password: "password123",
    });

    expect(res.statusCode).toEqual(200);
    expect(User.findOne).toHaveBeenCalledTimes(1);
    expect(res.body).toHaveProperty("token");
    expect(res.body.user.email).toBe("testuser@example.com");
  });
});
