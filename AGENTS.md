# Agent instructions

AgentMailer is identity and communication infrastructure for AI agents. It is
not a workflow engine or an agent workspace. Keep model calls, tool execution,
schedules, checkpoints, and business approvals in the calling runtime.

## Source boundaries

- Treat top-level skill directories as the authoring source for skills.sh.
- Treat `skills/` as a generated client export. Update it with the repository's
  generation scripts instead of editing exported skills independently.
- Treat `fern/openapi/openapi.json` as a reviewed snapshot of
  `https://api.agentmailer.ai/openapi.json`. Run the sync check before changing
  generated clients.
- Do not hand-edit generated API methods under `sdk/`.
- Keep the portable Agent Plugins manifest at `plugin.json` and the hosted
  Streamable HTTP MCP connection at `mcp.json` standards-conformant.

## Safe integration behavior

- Never guess API fields, MCP tools, permissions, or credentials. Use the
  published OpenAPI and MCP schemas.
- Never print or commit AgentMailer access tokens, API keys, mailbox passwords,
  approval codes, or webhook signing secrets.
- Use stable idempotency keys for retried writes.
- Preserve human approval for agent signup and externally consequential sends.

## Validation

Run `pnpm validate` after changing manifests, skills, examples, SDK metadata, or
client exports. Run the relevant generated-client checks for SDK or CLI changes.
