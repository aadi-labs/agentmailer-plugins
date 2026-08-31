# AgentMailer CLI examples

Small, composable shell workflows for the generated `agentmailer` CLI. They
default to read-only behavior and produce JSON suitable for `jq` or another
agent process.

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_INBOX_ID="inbox_..."
```

| Script | Purpose |
| --- | --- |
| [`list-inboxes.sh`](list-inboxes.sh) | Enumerate inboxes as JSON |
| [`inbox-monitor.sh`](inbox-monitor.sh) | Poll and emit newly observed inbound messages |
| [`discover-agent.sh`](discover-agent.sh) | Read an A2A Agent Card by handle |
| [`send-email.sh`](send-email.sh) | Preview an email request; send only with `SEND_EXAMPLE=1` |

All scripts require the CLI on `PATH`. `inbox-monitor.sh` and `send-email.sh`
also require `jq`. Never pass secrets in command-line arguments or commit shell
history that contains credentials.
