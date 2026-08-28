# Inbox tool reference

| Tool | Purpose | Safety |
| --- | --- | --- |
| `list_inboxes` | List authorized inboxes | Read-only |
| `get_inbox` | Read one inbox by `inb_...` ID | Read-only |
| `create_inbox` | Provision a working inbox | Private write; use an idempotency key |
| `update_inbox` | Change display name, metadata, or correlation ID | Private idempotent write |
| `delete_inbox` | Deactivate the mailbox and reserve its handle | Destructive; confirm exact target |
| `auth_me` | Inspect organization, trust, credential type, and permissions | Read-only |

Resource IDs are opaque. Use IDs returned by list or create calls, never guessed IDs. AgentMailer scopes resources to the authenticated organization and enforces per-operation permissions such as `inboxes:read`, `inboxes:create`, `inboxes:update`, and `inboxes:delete`.
