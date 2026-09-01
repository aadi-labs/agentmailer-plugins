# Contract redline agent

Identify risky clauses and propose review notes.

Both implementations are standalone agent processes. They use AgentMailer for
identity, mailbox data, threads, drafts, and delivery; the example process owns
the model call, execution state, and any external tool action.

They send untrusted content through an OpenAI-compatible model and keep external
effects behind an explicit opt-in. The example is read-only.

## Architecture boundary

AgentMailer is the communication substrate, not the workflow runtime. In a
production deployment, persist event deduplication, checkpoints, business
approvals, and tool results in your own application. Use AgentMailer message and
thread IDs to correlate that state, and stable idempotency keys for email writes.

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
pnpm --filter @agentmailer/example-contract-redline-agent start
```

## Python

```sh
cd examples/agentmailer-contract-redline-agent/python
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python agent.py
```

Use a dedicated test inbox. Treat model output as a proposal, record idempotency
keys in your application before side effects, and require human review for
consequential actions.
