#!/bin/sh
set -eu

generator_docker_config="$(mktemp -d)"
trap 'rm -rf "$generator_docker_config"' EXIT INT TERM
docker_host="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"

DOCKER_CONFIG="$generator_docker_config" \
DOCKER_HOST="$docker_host" \
  docker run --rm \
    -v "$(pwd)/sdk/go:/workspace" \
    -w /workspace \
    golang:1.24-bookworm \
    go mod tidy
