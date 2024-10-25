const request = require("supertest");
const app = require("../server"); // O arquivo principal onde seu app Express está configurado
const mongoose = require("mongoose");
const User = require("../models/userModel"); // O modelo de usuário

let token; // Para armazenar o token JWT entre os testes

// Limpa o banco de dados antes de cada teste
beforeEach(async () => {
  await User.deleteMany();
});

// Fecha a conexão com o MongoDB após os testes
afterAll(async () => {
  await mongoose.connection.close();
});

describe("User API", () => {
  it("should register a user", async () => {
    const res = await request(app).post("/api/users/register").send({
      name: "Test User",
      email: "testuser@example.com",
      password: "password123",
    });

    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty("token");
    expect(res.body.user).toHaveProperty("id");
    expect(res.body.user.email).toBe("testuser@example.com");
  });

  it("should login a user", async () => {
    // Primeiro, criamos o usuário
    await request(app).post("/api/users/register").send({
      name: "Test User",
      email: "testuser@example.com",
      password: "password123",
    });

    // Agora fazemos o login
    const res = await request(app).post("/api/users/login").send({
      email: "testuser@example.com",
      password: "password123",
    });

    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty("token");
    expect(res.body.user.email).toBe("testuser@example.com");

    // Armazena o token para testes subsequentes
    token = res.body.token;
  });

  it("should get the user profile", async () => {
    // Fazemos o login primeiro para obter o token
    await request(app).post("/api/users/register").send({
      name: "Test User",
      email: "testuser@example.com",
      password: "password123",
    });

    const loginRes = await request(app).post("/api/users/login").send({
      email: "testuser@example.com",
      password: "password123",
    });

    token = loginRes.body.token;

    // Testa o acesso ao perfil do usuário autenticado
    const res = await request(app)
      .get("/api/users/profile")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toEqual(200);
    expect(res.body.user.email).toBe("testuser@example.com");
  });
});
