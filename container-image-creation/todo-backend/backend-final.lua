FROM("docker://docker.io/library/node:14-alpine")
app = "/backend"
MKDIR(app)
CONFIG.WORKINGDIR = app
UPLOAD("backend/", app)
RUN("npm install")
PURGE("apk-tools")
CONFIG.CMD = "npm start"
COMMIT("filestage-todo-backend:final")
