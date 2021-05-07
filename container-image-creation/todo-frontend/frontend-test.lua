FROM("docker://docker.io/library/node:14-alpine", "frontend-test")
app = "/frontend"
MKDIR(app)
CONFIG.WORKINGDIR = app
UPLOAD("frontend/", app)
RUN("npm install")
UPLOAD("test/jest.json", "/frontend")
UPLOAD("test/babel.config.json", "/frontend")
UPLOAD("test/Todos.test.js", "/frontend/src")
RUN("npm install --save-dev babel-cli @babel/preset-env @babel/preset-react jest enzyme @wojtekmaj/enzyme-adapter-react-17 react-test-renderer")
PURGE("apk-tools")
ENTRYPOINT("/frontend/node_modules/jest/bin/jest.js", "Todos", "--config=jest.json")
--TAR("frontend.tar")
COMMIT("filestage-todo-frontend:test")
