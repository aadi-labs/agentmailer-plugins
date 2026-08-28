---
name: agentmailer-inbox
description: Create, inspect, update, or deactivate dedicated AgentMailer email inboxes for AI agents through MCP.
---

# AgentMailer Inbox

Use this skill when a user wants an agent email identity or needs to manage existing AgentMailer inboxes.

## Workflow

1. Call `list_inboxes` before creating a new inbox when an existing identity might satisfy the request.
2. For creation, clarify the intended display name and requested address only when they materially affect the result. Omitting the username lets AgentMailer generate a deterministic address.
3. Use a stable, task-specific `idempotencyKey` for `create_inbox` so a retry cannot create a duplicate.
4. Return the created or selected inbox ID, address, display name, and relevant metadata.
5. Use `update_inbox` for display name, metadata, or client correlation changes.

`delete_inbox` deactivates the mailbox and reserves its handle. Before calling it, identify the exact inbox, explain that effect, and obtain explicit confirmation in the current conversation.

Read [references/inbox-tools.md](references/inbox-tools.md) when choosing tool inputs or handling permissions.
