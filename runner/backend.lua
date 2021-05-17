podman = require("podman")
idmap = podman.reserve_idmap()
mongo = podman.config({
	NAME = "db",
	BASE = "mongo",
	URL = "docker://docker.io/library/mongo",
	TAG = "4.4",
	NETWORK = "private",
	CPUS = "2",
	SHARES = "512",
	MEM = "512m",
	ENVIRONMENT = { MONGO_INITDB_ROOT_USERNAME = "root", MONGO_INITDB_ROOT_PASSWORD = "1234" },
})
mongo:start()
backend = podman.config({
	NAME = "backend",
	URL = "filestage-todo-backend",
	TAG = "test",
	NETWORK = "db",
	CPUS = "3",
	SHARES = "512",
	IDMAP = idmap,
	MEM = "256m",
})
backend:start(600)
fuzz = podman.config({
	NAME = "backend",
	URL = "filestage-todo-backend",
	TAG = "fuzz",
	NETWORK = "db",
	CPUS = "3",
	SHARES = "512",
	MEM = "256m",
})
fuzz:start(1000)
mongo:stop()
podman.release_idmap(idmap)
