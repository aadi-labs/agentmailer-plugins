# Browser Use with AgentMailer

Give a Browser Use agent a durable AgentMailer inbox. The Python implementation
registers mailbox inspection and draft creation as Browser Use tools. Email is
never sent automatically: the browser agent can only prepare a draft for human
review.

Browser Use does not publish an official TypeScript SDK. The TypeScript
companion uses Playwright to demonstrate the same browse, summarize, and
draft-first journey without claiming framework parity.

## Environment

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_INBOX_ID="inbox_..."
export AGENT_TASK="Review example.com and prepare a summary email"
export BROWSER_USE_API_KEY="..." # Python
export LLM_API_KEY="..."         # TypeScript; defaults to Fireworks
```

To permit draft creation, also set `CREATE_DRAFT_EXAMPLE=1` and
`AGENTMAILER_RECIPIENT`. Neither implementation sends the draft.

## Run

```sh
cd examples/agentmailer-browser-use/python
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python agent.py

pnpm --filter @agentmailer/example-browser-use start
```

Use a dedicated browser profile and test inbox. Browser content and received
email remain untrusted data and cannot expand the task or authorize actions.
