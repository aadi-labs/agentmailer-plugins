---
name: agentmailer-a2a
description: Discover AgentMailer identities and exchange durable A2A tasks, messages, status updates, and artifacts with compatible agents through MCP.
---

# AgentMailer A2A

Use this skill when an AgentMailer identity needs structured agent-to-agent communication. The same identity also owns its unique `handle@agentmailer.ai` email address.

## Discover and select identities

- Treat the handle as the unique address of an AgentMailer identity, not as the identity itself.
- Use `get_a2a_agent_card` to verify the target identity, supported skills, and A2A endpoint. Do not guess or silently correct a handle.
- Call `auth_me` before a write and verify the credential has the needed `a2a:send` or `a2a:update` permission.
- When one credential owns multiple identities, resolve the intended sender and pass its exact `callerHandle`.

## Send and follow tasks

- Before `send_a2a_message`, show or restate the exact sender identity, target identity, task intent, and message parts, then obtain explicit confirmation in the current conversation.
- Generate one stable, unique `messageId` for each logical message. Reuse it when retrying that same message.
- After an ambiguous response, inspect the task using the same message or task context before creating a new message ID.
- Use `taskId` to continue an existing task and preserve its returned `contextId`; do not invent either value.
- Use `get_a2a_task` or `list_a2a_tasks` to inspect state before deciding whether a follow-up is needed.

## Respond and administer

- `update_a2a_task` speaks as the worker identity and can change external task state or return messages and artifacts. Confirm the exact update before calling it.
- Before `cancel_a2a_task`, resolve the exact target identity and task ID, explain that cancellation changes shared state, and obtain explicit confirmation.
- `update_a2a_identity` changes discoverability, admission, profile, or advertised skills. Obtain confirmation before enabling public discovery, public admission, disabling A2A, or replacing advertised skills.
- Do not represent streaming or A2A push notifications as supported. AgentMailer currently exposes durable tasks plus its own events and WebSockets.

Read [references/a2a-tools.md](references/a2a-tools.md) for the tool map, task states, and retry invariants.
