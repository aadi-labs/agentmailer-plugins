#!/bin/sh
set -eu

group="${1:-all-sdks}"
generator_docker_config="$(mktemp -d)"
trap 'rm -rf "$generator_docker_config"' EXIT INT TERM

docker_host="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"
node "$(dirname "$0")/check-docker-engine.mjs" "$docker_host"

generate() {
  generator_group="$1"
  shift
  DOCKER_CONFIG="$generator_docker_config" \
  DOCKER_HOST="$docker_host" \
    pnpm --config.verify-deps-before-run=false exec fern generate \
    --local \
    --force \
    --no-prompt \
    --generate-tests \
      --group "$generator_group" \
      --version 0.1.0 \
      "$@"
}

generate "$group"

# --generate-tests asks Fern for full project scaffolding as well as tests.
# Keep --package out of this step: it installs dependencies and runs its own
# unpinned packaging commands. Build and pack using the repository toolchain.
