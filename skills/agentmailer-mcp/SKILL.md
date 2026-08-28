---
name: agentmailer-mcp
description: Connect to AgentMailer's hosted MCP server, complete human-approved OAuth, or troubleshoot authentication in Claude Code, Codex, Cursor, and other MCP clients.
---

# AgentMailer MCP

Use the universal Streamable HTTP endpoint:

`https://api.agentmailer.ai/mcp`

Prefer the client's native remote-MCP configuration so it can discover OAuth from AgentMailer's protected-resource metadata. Do not ask the user to paste OAuth tokens into prompts, source files, or shell history.

## Connect

Choose the shortest path for the active client:

- Claude Code: `claude mcp add --transport http agentmailer https://api.agentmailer.ai/mcp`
- Codex: `codex mcp add agentmailer --url https://api.agentmailer.ai/mcp`
- Other clients: add the endpoint as a remote HTTP MCP server and complete OAuth in the client.

Every first-time signup requires human approval. After authorization:

1. Call `auth_me` and require a trusted identity with `inboxes:create` before creating an identity inbox. A2A workflows additionally require the advertised `a2a:read`, `a2a:send`, or `a2a:update` permission.
2. Call `list_inboxes` as a low-risk functional check.
3. If no existing inbox fits, call `create_inbox` with a stable idempotency key and an optional lowercase username.
4. Verify the returned address ends in `@agentmailer.ai`; this unique handle names the same durable identity over email and A2A.

If the client cannot complete MCP OAuth and requires an API key, follow `https://api.agentmailer.ai/llms.txt`: call `POST /v1/agent/sign-up` with `human_email` and `username`, present the returned approval URL to the human, then follow `auth.md`. Pass the resulting key only through the client's supported `x-api-key` configuration.

Do not call `create_inbox` with an unverified credential. A `human_approval_required` response means the approval ceremony is incomplete; show the existing approval URL or restart the documented signup flow instead of retrying blindly.

## Diagnose

Read [references/troubleshooting.md](references/troubleshooting.md) when connection, OAuth, or permission checks fail. Preserve the distinction between:

- transport failure;
- OAuth discovery or callback failure;
- authenticated but insufficient permissions;
- a successful connection with no inboxes yet.

Never claim the connection works until an authenticated tool call succeeds.
