#!/bin/sh
set -eu

: "${AGENTMAILER_API_KEY:?Set AGENTMAILER_API_KEY}"
: "${AGENTMAILER_PEER_HANDLE:?Set AGENTMAILER_PEER_HANDLE}"
agentmailer a2a get-agent-card \
  --handle "$AGENTMAILER_PEER_HANDLE" \
  --format json
