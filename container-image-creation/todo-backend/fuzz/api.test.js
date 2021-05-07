const request = require("supertest");
const api = require("./api");
const database = require("./database");
const Fuzz = require("jest-fuzz");
const dummyFuzzer = Fuzz.Fuzzer({
  inter: Fuzz.int(),
});

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

  Fuzz.test("post fuzz", dummyFuzzer(), async (data) => {
    const res = await request(api).post("/").send({ text: data.inter });
    expect(res.status).toBe(200);
  });

  afterEach(() => {
    database.client.close();
  });
});
