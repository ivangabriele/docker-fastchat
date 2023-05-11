_NAME = "ivangabriele_fastchat"

build:
	docker build -f "./dockerfiles/$(_VERSION)$(_VARIANT).Dockerfile" -t "ivangabriele/fastchat:$(_VERSION)$(_VARIANT)" .
build-latest-cuda12:
	_VERSION="latest" _VARIANT="-cuda12" make build

run: --stop-and-remove
	make build
	docker run -dt --name "$(_NAME)" "ivangabriele/fastchat:$(_VERSION)"
run-latest-cuda12:
	_VERSION="latest" _VARIANT="-cuda12" make run

--stop-and-remove:
	docker stop "$(_NAME)" || true 2>/dev/null
	docker rm "$(_NAME)" || true 2>/dev/null

################################################################################
# DEBUG COMMANDS

rebuild:
	# docker system prune -af --volumes
	docker build -f "./dockerfiles/$(_VERSION)$(_VARIANT).Dockerfile" --no-cache -t "ivangabriele/fastchat:$(_VERSION)" .
rebuild-latest-cuda12:
	_VERSION="latest" _VARIANT="-cuda12" make rebuild

sh: build
	docker run -it ivangabriele/fastchat:$(_VERSION) /bin/sh
sh-latest-cuda12:
	_VERSION="latest" _VARIANT="-cuda12" make sh

shf: rebuild
	docker run -it ivangabriele/fastchat:$(_VERSION) /bin/sh
shf-latest-cuda12:
	_VERSION="latest" _VARIANT="-cuda12" make shf
