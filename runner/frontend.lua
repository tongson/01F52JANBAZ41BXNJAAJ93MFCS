local podman = require("podman")
--[[
podman.config({
	NAME = "mongo",
	URL = "docker://docker.io/library/mongo",
	TAG = "4.4",
	NETWORK = "private",
	CPUS = "2",
	SHARES = "512",
	MEM = "512m",
	ENVIRONMENT = { MONGO_INITDB_ROOT_USERNAME = "root", MONGO_INITDB_ROOT_PASSWORD = "1234" },
})
podman.start("mongo")
podman.config({
	NAME = "backend",
	URL = "filestage-todo-backend",
	TAG = "final",
	NETWORK = "mongo",
	CPUS = "3",
	SHARES = "512",
	MEM = "256m",
})
podman.start("backend")
]]
podman.config({
	NAME = "frontend",
	URL = "filestage-todo-frontend",
	TAG = "test",
	NETWORK = "private",
	CPUS = "1",
	SHARES = "512",
	MEM = "512m",
})
podman.start("frontend", 600)
