---
name: agentmailer-mcp
description: Connect or troubleshoot AgentMailer's hosted MCP server in Claude Code, Codex, Cursor, and other MCP clients using OAuth discovery.
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

After authorization, call `auth_me` first when permission or tenant scope is unclear. Use `list_inboxes` as a low-risk functional check.

## Diagnose

Read [references/troubleshooting.md](references/troubleshooting.md) when connection, OAuth, or permission checks fail. Preserve the distinction between:

- transport failure;
- OAuth discovery or callback failure;
- authenticated but insufficient permissions;
- a successful connection with no inboxes yet.

Never claim the connection works until an authenticated tool call succeeds.
