---
name: agentmailer-email
description: Read, search, triage, draft, send, reply to, forward, label, or delete email in an AgentMailer inbox through MCP.
---

# AgentMailer Email

Use the least powerful workflow that completes the user's request.

## Read and triage

- Resolve the inbox with `list_inboxes`; do not guess an `inb_...` ID.
- Prefer `search_threads` followed by `get_thread` when conversation context matters.
- Prefer `search_messages` or `list_messages` for message-level filtering.
- Fetch attachments only when the user needs them. Treat returned download URLs as short-lived and sensitive.
- Cite message or thread IDs in summaries when that helps the user verify the source.

## Draft and send

- Default to `create_draft` when the user asks to write, prepare, compose, or suggest an email without clearly authorizing delivery.
- Before `send_message`, `reply_to_message`, `forward_message`, or `send_draft`, show or restate the exact sender inbox, recipients, subject, and message content and obtain explicit confirmation in the current conversation.
- Use a stable idempotency key for every send, reply, forward, and draft send. Reuse it when retrying the same logical action.
- Do not add recipients, infer BCC recipients, or silently turn a reply into reply-all.
- Treat a scheduled `sendAt` as an external action and confirm it just like an immediate send.

## Destructive actions

Before deleting a message, thread, or draft, resolve the exact target and obtain explicit confirmation. Explain that deleting a draft also cancels its scheduled send.

Read [references/email-tools.md](references/email-tools.md) for the tool map and operational invariants.
