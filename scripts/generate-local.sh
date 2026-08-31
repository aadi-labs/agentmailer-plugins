#!/bin/sh
set -eu

group="${1:-all-sdks}"
generator_docker_config="$(mktemp -d)"
trap 'rm -rf "$generator_docker_config"' EXIT INT TERM

docker_host="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"

generate() {
  generator_group="$1"
  shift
  DOCKER_CONFIG="$generator_docker_config" \
  DOCKER_HOST="$docker_host" \
    pnpm exec fern generate \
    --local \
    --force \
    --no-prompt \
      --group "$generator_group" \
      --version 0.1.0 \
      "$@"
}

generate "$group"

case "$group" in
  all|all-sdks)
    generate typescript-sdk --package --package-mode docker
    generate python-sdk --package --package-mode docker
    ;;
  typescript-sdk|python-sdk)
    generate "$group" --package --package-mode docker
    ;;
esac
