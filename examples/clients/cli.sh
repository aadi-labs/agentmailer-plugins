#!/usr/bin/env sh
set -eu

: "${AGENTMAILER_API_KEY:?Set AGENTMAILER_API_KEY before running this example}"

agentmailer inboxes list --limit 10 --format table

# Preview a send without making a network request. Replace both placeholders.
agentmailer messages send \
  --inbox-id inb_REPLACE_ME \
  --json '{"to":["recipient@example.com"],"subject":"Hello from AgentMailer","text":"Sent with the AgentMailer CLI."}' \
  --dry-run
