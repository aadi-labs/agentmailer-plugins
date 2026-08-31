# AgentMailer client examples

These examples use the same `AGENTMAILER_API_KEY` credential as the hosted MCP server and CLI. Start with a read-only inbox listing, then send only after a human has chosen the sender and recipient.

```sh
export AGENTMAILER_API_KEY="..."
```

- [TypeScript](./typescript.ts)
- [Python](./python.py)
- [CLI](./cli.sh)
- [A2A discovery and task submission](./a2a-worker.ts)
- [Allow/block-list governance](./governance.ts)

All send operations automatically receive an idempotency key from the generated clients. For a stable workflow-level key, pass an explicit `Idempotency-Key` through request headers.

The TypeScript and Python SDKs also export `AgentMailerWorkflows`, a maintained layer for complete inbox pagination, read-first `ensureInbox`/`ensure_inbox`, explicit text sending, and public A2A discovery. It complements rather than hides the generated endpoint clients.
