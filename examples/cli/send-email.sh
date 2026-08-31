#!/bin/sh
set -eu

: "${AGENTMAILER_API_KEY:?Set AGENTMAILER_API_KEY}"
: "${AGENTMAILER_INBOX_ID:?Set AGENTMAILER_INBOX_ID}"
: "${AGENTMAILER_RECIPIENT:?Set AGENTMAILER_RECIPIENT}"
: "${AGENTMAILER_SUBJECT:?Set AGENTMAILER_SUBJECT}"
: "${AGENTMAILER_TEXT:?Set AGENTMAILER_TEXT}"
command -v jq >/dev/null 2>&1 || { echo "jq is required" >&2; exit 1; }

body=$(jq -n \
  --arg recipient "$AGENTMAILER_RECIPIENT" \
  --arg subject "$AGENTMAILER_SUBJECT" \
  --arg text "$AGENTMAILER_TEXT" \
  '{to: [$recipient], subject: $subject, text: $text}')

if [ "${SEND_EXAMPLE:-0}" = "1" ]; then
  agentmailer messages send --inbox-id "$AGENTMAILER_INBOX_ID" --json "$body" --format json
else
  agentmailer messages send --inbox-id "$AGENTMAILER_INBOX_ID" --json "$body" --dry-run --format http
fi
