#!/bin/sh
set -eu

generator_docker_config="$(mktemp -d)"
compose_file="$(pwd)/sdk/go/wiremock/docker-compose.test.yml"
compose_project="agentmailer-go-$$"
docker_host="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"

cleanup() {
  DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
    docker compose -p "$compose_project" -f "$compose_file" down --remove-orphans >/dev/null 2>&1 || true
  rm -rf "$generator_docker_config"
}
trap cleanup EXIT INT TERM

DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
  docker compose -p "$compose_project" -f "$compose_file" up -d --wait

DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
  docker run --rm \
    --network "${compose_project}_default" \
    -e "WIREMOCK_URL=http://wiremock:8080" \
    -v "$(pwd)/sdk/go:/workspace" \
    -w /workspace \
    golang:1.24-bookworm \
    go test ./...
