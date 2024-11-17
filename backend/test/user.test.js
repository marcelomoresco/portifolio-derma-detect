const request = require("supertest");
const app = require("../server");
const mongoose = require("mongoose");
const User = require("../models/userModel");

let token;

beforeEach(async () => {
  await User.deleteMany();
});

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
    await request(app).post("/api/users/register").send({
      name: "Test User",
      email: "testuser@example.com",
      password: "password123",
    });

    const res = await request(app).post("/api/users/login").send({
      email: "testuser@example.com",
      password: "password123",
    });

    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty("token");
    expect(res.body.user.email).toBe("testuser@example.com");

    token = res.body.token;
  });

  it("should get the user profile", async () => {
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

    const res = await request(app)
      .get("/api/users/profile")
      .set("Authorization", `Bearer ${token}`);

    expect(res.statusCode).toEqual(200);
    expect(res.body.user.email).toBe("testuser@example.com");
  });
});
