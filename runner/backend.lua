local podman = require("podman")
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
	TAG = "test",
	NETWORK = "mongo",
	CPUS = "3",
	SHARES = "512",
	MEM = "256m",
})
podman.start("backend", 600)
--[[podman.config({
	NAME = "backend",
	URL = "filestage-todo-backend",
	TAG = "fuzz",
	NETWORK = "mongo",
	CPUS = "3",
	SHARES = "512",
	MEM = "256m",
})
podman.start("backend", 1000)
]]
podman.stop("mongo")
