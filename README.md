# FastChat Docker Image

[![img-docker]][link-docker]
[![img-github-actions]][link-github-actions]

Server/Cloud-ready [FastChat][link-fastchat] Docker image based either on [Nvdidia CUDA][link-docker-nvidia-cuda]
Ubuntu image including:

- Python 3
- Rust
- [FastChat][link-fastchat]
- Vicuna-13B

This image is intented for people who want to run FastChat using on their own server or cloud instance.

[Docker Hub prebuilt images][link-docker] are automatically updated on a daily basis.

---

- [Caveats](#caveats)
- [Supported tags and respective `Dockerfile` links](#supported-tags-and-respective-dockerfile-links)
- [Docker Environment Variables](#docker-environment-variables)
  - [`PORT`](#port)
- [Roadmap](#roadmap)
- [Convenience Server Scripts (no Docker)](#convenience-server-scripts-no-docker)
- [Contribute](#contribute)
  - [Prerequisites](#prerequisites)
  - [Build](#build)
  - [Run](#run)

---

## Caveats

- **⚠️ The web application is NOT secured.** It's up to you to secure your public HTTP port connection.
- You need a GPU server or instance. The default entrypoint uses a single GPU run but you can override it
  using `docker run --entrypoint ...` or a Docker Compose file via `entrypoint: [...]`.
- This image is **BIG** since it includes a 9GB data model.


## Supported tags and respective `Dockerfile` links

- [`latest-cuda12`](https://github.com/ivangabriele/docker-fastchat/blob/main/dockerfiles/lastest-cuda12.Dockerfile)

## Docker Environment Variables

### `PORT`

**REQUIRED**

This is the server exposed port to emit and listen socket events.

## Roadmap

- Add a CPU-only version

## Convenience Server Scripts (no Docker)

This repository provides a few convenience scripts to install and run FastChat without using Docker,
for better performances:

- `debian.sh`: Copy this file in your `/home/[username]` directory and run it from this directory via `sh ./debian.sh`.

## Contribute

`X` is FastChat version:

- `latest`: clone the `main` branch from [FastChat repository](https://github.com/lm-sys/FastChat)

`Z` is the variant tag:

- `cuda12`: NVidia GPUs

### Prerequisites

- Docker ([Desktop](https://docs.docker.com/desktop/) or [Engine](https://docs.docker.com/engine/install/))
- Make (installation depends on your OS)

### Build

```sh
make build-X-Z
```

Example: `make build-latest-cuda12`.

### Run

```sh
make run-X
# or:
make run-X-Z
```

Example: `make run-latest-cuda12`.

---

[img-docker]: https://img.shields.io/docker/pulls/ivangabriele/docker-fastchat?style=for-the-badge
[img-github-actions]:
  https://img.shields.io/github/actions/workflow/status/ivangabriele/docker-fastchat/main.yml?branch=main&label=Build&style=for-the-badge

[link-docker-nvidia-cuda]: https://hub.docker.com/r/nvidia/cuda
[link-docker]: https://hub.docker.com/r/ivangabriele/fastchat
[link-fastchat]: https://github.com/lm-sys/FastChat#readme
[link-github-actions]: https://github.com/ivangabriele/docker-fastchat/actions/workflows/main.yml?query=branch%3Amain
