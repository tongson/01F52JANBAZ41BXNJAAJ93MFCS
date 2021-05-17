podman = require("podman")
frontend = podman.config({
	NAME = "frontend",
	URL = "filestage-todo-frontend",
	TAG = "test",
	NETWORK = "private",
	CPUS = "1",
	SHARES = "512",
	MEM = "512m",
})
frontend:start(600)
