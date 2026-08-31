#!/bin/sh
set -eu

generator_docker_config="$(mktemp -d)"
docker_host="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"
compose_file="$(pwd)/sdk/rust/wiremock/docker-compose.test.yml"
compose_project="agentmailer-rust-$$"

cleanup() {
  DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
    docker compose -p "$compose_project" -f "$compose_file" down --remove-orphans >/dev/null 2>&1 || true
  rm -rf "$generator_docker_config"
}
trap cleanup EXIT INT TERM

DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
  docker compose -p "$compose_project" -f "$compose_file" up -d --wait

wiremock_port="$(
  DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
    docker compose -p "$compose_project" -f "$compose_file" port wiremock 8080 | sed 's/.*://'
)"

DOCKER_CONFIG="$generator_docker_config" DOCKER_HOST="$docker_host" \
  docker run --rm \
    -e "WIREMOCK_URL=http://host.docker.internal:$wiremock_port" \
    -v "$(pwd):/workspace" \
    -w /workspace \
    rust:1.90-bookworm \
    sh -c 'cargo test --manifest-path sdk/rust/Cargo.toml && cargo test --locked --manifest-path cli/Cargo.toml'
