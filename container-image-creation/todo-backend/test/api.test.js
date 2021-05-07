const request = require("supertest");
const api = require("./api");
const database = require("./database");

describe("Test TODO app", () => {
  beforeAll(async () => {
    try {
      await database.connect();
    } catch (error) {
      console.error(error);
    }
    const todo = { id: "test-one-two-three", text: "test", completed: false };
    await database.client.db("todos").collection("todos").insertOne(todo);
    await database.client.close();
  });

  beforeEach(async () => {
    try {
      await database.connect();
    } catch (error) {
      console.error(error);
    }
  });

  test("post", async () => {
    const res = await request(api).post("/").send({ text: "test" });
    expect(res.status).toBe(201);
    expect(res.body).toHaveProperty("_id");
    expect(res.body).toHaveProperty("id");
    expect(res.body).toHaveProperty("text");
    expect(res.body).toHaveProperty("completed");
  });

  test("post invalid", async () => {
    const res = await request(api).post("/").send({ text: true });
    expect(res.status).toBe(400);
  });

  test("get", async () => {
    const res = await request(api).get("/");
    const body = res.body;
    console.log(body);
    expect(res.status).toBe(200);
    expect(Array.isArray(body)).toBe(true);
  });

  test("put", async () => {
    const res = await request(api).put("/" + "test-one-two-three").send({
      completed: true,
    });
    expect(res.status).toBe(200);
  });

  test("put invalid", async () => {
    const res = await request(api).put("/" + "test-one-two-three").send({
      completed: "test",
    });
    expect(res.status).toBe(400);
  });

  test("delete", async () => {
    const res = await request(api).delete("/" + "test-one-two-three");
    expect(res.status).toBe(203);
  });

  afterEach(() => {
    database.client.close();
  });
});
