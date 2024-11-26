// test/authMiddleware.test.js

const { protect } = require("../middlewares/authMiddleware");
const jwt = require("jsonwebtoken");
const User = require("../models/userModel");

jest.mock("jsonwebtoken");

// Mock manual dos métodos do modelo User
User.findById = jest.fn();
User.findOne = jest.fn();
User.create = jest.fn();

describe("Middleware protect", () => {
  let req, res, next;

  beforeEach(() => {
    req = {
      headers: {},
    };
    res = {
      status: jest.fn(() => res),
      json: jest.fn(),
    };
    next = jest.fn();
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it("Deve retornar 401 se o token é inválido", async () => {
    req.headers.authorization = "Bearer invalidtoken";

    jwt.verify.mockImplementation(() => {
      throw new Error("Token inválido");
    });

    await protect(req, res, next);

    expect(jwt.verify).toHaveBeenCalledWith(
      "invalidtoken",
      process.env.JWT_SECRET
    );
    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith({
      message: "Not authorized, token failed",
    });
    expect(next).not.toHaveBeenCalled();
  });

  it("Deve retornar 401 se nenhum token é fornecido", async () => {
    await protect(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith({
      message: "Not authorized, no token",
    });
    expect(next).not.toHaveBeenCalled();
  });

  it("Deve retornar 401 se o usuário não for encontrado", async () => {
    req.headers.authorization = "Bearer validtoken";

    jwt.verify.mockImplementation(() => ({ id: "userId" }));
    User.findById.mockResolvedValue(null); // Simula usuário não encontrado

    await protect(req, res, next);

    expect(jwt.verify).toHaveBeenCalledWith(
      "validtoken",
      process.env.JWT_SECRET
    );
    expect(User.findById).toHaveBeenCalledWith("userId");
    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith({
      message: "Not authorized, token failed",
    });
    expect(next).not.toHaveBeenCalled();
  });
});
