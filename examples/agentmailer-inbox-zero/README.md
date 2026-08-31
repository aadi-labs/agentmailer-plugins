# Inbox Zero agent

Classify mail, draft replies, and produce an actionable digest.

Both implementations inspect AgentMailer data, send untrusted content through an
OpenAI-compatible model, and keep external effects behind an explicit opt-in.
SEND_EXAMPLE=1 enables delivery to an explicit recipient.

## Environment

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_INBOX_ID="inbox_..."
export LLM_API_KEY="..."
# Defaults to Fireworks; override for another OpenAI-compatible provider.
export LLM_BASE_URL="https://api.fireworks.ai/inference/v1"
export LLM_MODEL="accounts/fireworks/models/llama-v3p3-70b-instruct"
```

## TypeScript

```sh
pnpm --filter @agentmailer/example-inbox-zero start
```

## Python

```sh
cd examples/agentmailer-inbox-zero/python
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python agent.py
```

Use a dedicated test inbox. Treat model output as a proposal, store idempotency
keys before side effects, and require human review for consequential actions.
