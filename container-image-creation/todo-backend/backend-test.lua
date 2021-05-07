FROM("docker://docker.io/library/node:14-alpine", "backend-test")
app = "/backend"
MKDIR(app)
CONFIG.WORKINGDIR = app
UPLOAD("backend/", app)
RUN("npm install")
UPLOAD("test/jest.json", "/backend")
UPLOAD("test/api.test.js", "/backend/src")
RUN("npm install --save-dev babel-cli jest supertest superagent")
PURGE("apk-tools")
ENTRYPOINT("/backend/node_modules/jest/bin/jest.js", "api", "--config=jest.json")
COMMIT("filestage-todo-backend:test")
FROM("filestage-todo-backend:test")
RUN("npm install --save-dev jest-fuzz")
UPLOAD("fuzz/api.test.js", "/backend/src")
--TAR("backend.tar")
COMMIT("filestage-todo-backend:fuzz")
