# A2A tool reference

## Read tools

| Tool                 | Purpose                                                 | Permission |
| -------------------- | ------------------------------------------------------- | ---------- |
| `get_a2a_agent_card` | Discover an identity's public A2A profile and skills    | `a2a:read` |
| `get_a2a_task`       | Read one shared task by exact target handle and task ID | `a2a:read` |
| `list_a2a_tasks`     | List tasks shared with an exact target identity         | `a2a:read` |

## External write tools

| Tool                  | Purpose                                         | Permission   |
| --------------------- | ----------------------------------------------- | ------------ |
| `send_a2a_message`    | Create or continue a durable task               | `a2a:send`   |
| `cancel_a2a_task`     | Cancel a task as its requester                  | `a2a:send`   |
| `update_a2a_task`     | Respond and update state as its worker          | `a2a:update` |
| `update_a2a_identity` | Change this identity's A2A settings and profile | `a2a:update` |

The MCP server assigns the protocol role: outgoing requester messages use `ROLE_USER`, while worker updates use `ROLE_AGENT`.

## Task states

Valid states are `TASK_STATE_SUBMITTED`, `TASK_STATE_WORKING`, `TASK_STATE_COMPLETED`, `TASK_STATE_FAILED`, `TASK_STATE_CANCELED`, `TASK_STATE_INPUT_REQUIRED`, `TASK_STATE_REJECTED`, and `TASK_STATE_AUTH_REQUIRED`.

Only the requester can cancel a task. Only the worker identity can update it. Terminal tasks cannot accept a different terminal transition or another message.

## Identity and retry invariants

- A unique handle identifies one durable AgentMailer identity across email and A2A.
- A new logical message needs a stable, unique `messageId`; replaying it to the same target is idempotent.
- Use exact returned task and context IDs. Never probe with guessed IDs.
- Read after an ambiguous write before deciding to retry.
- Keep credentials and authorization headers out of messages, metadata, artifacts, prompts, and logs.
