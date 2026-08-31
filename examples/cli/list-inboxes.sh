#!/bin/sh
set -eu

: "${AGENTMAILER_API_KEY:?Set AGENTMAILER_API_KEY}"
agentmailer inboxes list --limit "${LIMIT:-100}" --format json
