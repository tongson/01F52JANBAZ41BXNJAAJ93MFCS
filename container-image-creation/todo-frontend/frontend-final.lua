FROM("docker://docker.io/library/node:14-alpine", "frontend-final")
app = "/frontend"
MKDIR(app)
CONFIG.WORKINGDIR = app
UPLOAD("frontend/", app)
RUN("npm install")
PURGE("apk-tools")
--TAR("frontend.tar")
CONFIG.CMD = "npm start"
COMMIT("filestage-todo-frontend:final")
