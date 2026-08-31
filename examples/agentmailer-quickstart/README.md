# AgentMailer quickstart

List the inboxes available to an agent, then optionally send a first email from
a human-selected inbox. The example is read-only unless `SEND_EXAMPLE=1`.

## Environment

```sh
export AGENTMAILER_API_KEY="..."
export SEND_EXAMPLE=1 # optional
export AGENTMAILER_RECIPIENT="expected-recipient@example.com" # optional
```

## Run

```sh
pnpm --filter @agentmailer/example-quickstart start
```

Or run `python/example.py` after installing `python/requirements.txt`. Use a
test inbox and a recipient who expects the message.
