# Kernel browser with AgentMailer

Create an isolated Kernel browser, inspect a web page, summarize it with an
OpenAI-compatible model, and optionally prepare an AgentMailer draft. The
browser session is deleted in a `finally` block and the email remains unsent.

## Environment

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_INBOX_ID="inbox_..."
export KERNEL_API_KEY="..."
export TARGET_URL="https://example.com"
export AGENT_TASK="Summarize the page for a customer"
export LLM_API_KEY="..." # defaults to Fireworks
```

Set `CREATE_DRAFT_EXAMPLE=1`, `AGENTMAILER_RECIPIENT`, and
`AGENTMAILER_SUBJECT` to create a reviewable draft.

## Run

```sh
cd examples/agentmailer-kernel-browser/python
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python agent.py

pnpm --filter @agentmailer/example-kernel-browser start
```

Use a dedicated test inbox. Web content is untrusted data; it cannot change the
task, reveal credentials, or authorize email delivery.
