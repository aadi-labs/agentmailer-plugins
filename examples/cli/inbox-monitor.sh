#!/bin/sh
set -eu

: "${AGENTMAILER_API_KEY:?Set AGENTMAILER_API_KEY}"
: "${AGENTMAILER_INBOX_ID:?Set AGENTMAILER_INBOX_ID}"
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 1; }

interval=${POLL_INTERVAL_SECONDS:-15}
seen_file=${SEEN_FILE:-"${TMPDIR:-/tmp}/agentmailer-seen-${AGENTMAILER_INBOX_ID}.txt"}
touch "$seen_file"

while :; do
  payload=$(agentmailer messages list \
    --inbox-id "$AGENTMAILER_INBOX_ID" \
    --limit "${LIMIT:-50}" \
    --format json)
  printf '%s\n' "$payload" | jq -c '.messages[] | select(.direction == "inbound")' | while IFS= read -r message; do
    message_id=$(printf '%s' "$message" | jq -r '.id')
    if ! grep -Fqx "$message_id" "$seen_file"; then
      printf '%s\n' "$message"
      printf '%s\n' "$message_id" >> "$seen_file"
    fi
  done
  sleep "$interval"
done
