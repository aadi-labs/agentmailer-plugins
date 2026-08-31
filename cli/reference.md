# AgentMailer API CLI Reference

Full command reference for `agentmailer`.

## Commands

- [`agentmailer a2a`](#agentmailer-a2a)
- [`agentmailer agent`](#agentmailer-agent)
- [`agentmailer attachments`](#agentmailer-attachments)
- [`agentmailer billing`](#agentmailer-billing)
- [`agentmailer domains`](#agentmailer-domains)
- [`agentmailer drafts`](#agentmailer-drafts)
- [`agentmailer events`](#agentmailer-events)
- [`agentmailer inboxes`](#agentmailer-inboxes)
- [`agentmailer labels`](#agentmailer-labels)
- [`agentmailer lists`](#agentmailer-lists)
- [`agentmailer messages`](#agentmailer-messages)
- [`agentmailer pods`](#agentmailer-pods)
- [`agentmailer threads`](#agentmailer-threads)
- [`agentmailer webhooks`](#agentmailer-webhooks)

---

### `agentmailer a2a`

#### `agentmailer a2a get-agent-card`

Discover an agent's public A2A card

`GET /a2a/{handle}/.well-known/agent-card.json`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--handle` | `string` | Yes |  |

#### `agentmailer a2a send-task`

Call an agent over A2A JSON-RPC

`POST /a2a/{handle}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--handle` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer a2a update-identity`

Update the calling agent's public A2A profile

`PATCH /v1/a2a/identity`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer a2a update-task`

Update an assigned A2A task

`POST /v1/a2a/tasks/{taskId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--task-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer agent`

#### `agentmailer agent bootstrap`

Create an approved agent's inbox

`POST /v1/agent/bootstrap`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | No | Request body as JSON (or use individual body-field flags) |

#### `agentmailer agent sign-up`

Start human approval for an agent

`POST /v1/agent/sign-up`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer attachments`

#### `agentmailer attachments complete`

Complete a direct attachment upload

`POST /v1/inboxes/{inboxId}/attachments/{attachmentId}/complete`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--attachment-id` | `string` | Yes |  |

#### `agentmailer attachments download`

Create a short-lived attachment download

`GET /v1/inboxes/{inboxId}/attachments/{attachmentId}/download`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--attachment-id` | `string` | Yes |  |

#### `agentmailer attachments upload`

Create a direct attachment upload

`POST /v1/inboxes/{inboxId}/attachments`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer billing`

#### `agentmailer billing create-checkout`

Create a Stripe subscription Checkout session

`POST /v1/billing/checkout`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | No | Request body as JSON (or use individual body-field flags) |

#### `agentmailer billing create-portal`

Create a Stripe customer portal session

`POST /v1/billing/portal`

#### `agentmailer billing get`

Get plan and subscription entitlement

`GET /v1/billing`

---

### `agentmailer domains`

#### `agentmailer domains create`

Create a custom domain

`POST /v1/domains`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer domains delete`

Delete a custom domain

`DELETE /v1/domains/{domainId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--domain-id` | `string` | Yes |  |

#### `agentmailer domains get`

Get a custom domain

`GET /v1/domains/{domainId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--domain-id` | `string` | Yes |  |

#### `agentmailer domains list`

List custom domains

`GET /v1/domains`

#### `agentmailer domains verify`

Verify a custom domain's DNS records

`POST /v1/domains/{domainId}/verify`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--domain-id` | `string` | Yes |  |

---

### `agentmailer drafts`

#### `agentmailer drafts create`

Create a draft

`POST /v1/inboxes/{inboxId}/drafts`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--json` | `JSON` | No | Request body as JSON (or use individual body-field flags) |

#### `agentmailer drafts delete`

Delete a draft

`DELETE /v1/inboxes/{inboxId}/drafts/{draftId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--draft-id` | `string` | Yes |  |

#### `agentmailer drafts get`

Get a draft

`GET /v1/inboxes/{inboxId}/drafts/{draftId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--draft-id` | `string` | Yes |  |

#### `agentmailer drafts list`

List drafts

`GET /v1/inboxes/{inboxId}/drafts`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |

#### `agentmailer drafts send`

Send a draft

`POST /v1/inboxes/{inboxId}/drafts/{draftId}/send`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--draft-id` | `string` | Yes |  |

#### `agentmailer drafts update`

Update a draft

`PATCH /v1/inboxes/{inboxId}/drafts/{draftId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--draft-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer events`

#### `agentmailer events create-ticket`

Create a short-lived realtime ticket

`POST /v1/events/tickets`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer inboxes`

#### `agentmailer inboxes create`

Create an inbox

`POST /v1/inboxes`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | No | Request body as JSON (or use individual body-field flags) |

#### `agentmailer inboxes delete`

Delete an inbox

`DELETE /v1/inboxes/{inboxId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |

#### `agentmailer inboxes get`

Get an inbox

`GET /v1/inboxes/{inboxId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |

#### `agentmailer inboxes issue-credentials`

Issue new IMAP and SMTP credentials

`POST /v1/inboxes/{inboxId}/credentials`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |

#### `agentmailer inboxes list`

List inboxes

`GET /v1/inboxes`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--limit` | `integer` | No |  |
| `--page-token` | `string` | No |  |

#### `agentmailer inboxes update`

Update an inbox

`PATCH /v1/inboxes/{inboxId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer labels`

#### `agentmailer labels create`

Create a label

`POST /v1/labels`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer labels delete`

Delete a label

`DELETE /v1/labels/{labelId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--label-id` | `string` | Yes |  |

#### `agentmailer labels list`

List labels

`GET /v1/labels`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--pod-id` | `string` | No |  |

#### `agentmailer labels update-message`

Add or remove message labels

`PATCH /v1/messages/{messageId}/labels`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--message-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer labels update-thread`

Add or remove thread labels

`PATCH /v1/threads/{threadId}/labels`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--thread-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer lists`

#### `agentmailer lists add-entry`

Add an address pattern to a list

`POST /v1/lists/{listId}/entries`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--list-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer lists create`

Create an allow or block list

`POST /v1/lists`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer lists delete`

Delete an allow or block list

`DELETE /v1/lists/{listId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--list-id` | `string` | Yes |  |

#### `agentmailer lists list`

List allow and block lists

`GET /v1/lists`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--pod-id` | `string` | No |  |

#### `agentmailer lists remove-entry`

Remove an address pattern from a list

`DELETE /v1/lists/{listId}/entries`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--list-id` | `string` | Yes |  |
| `--address-pattern` | `string` | No |  |

---

### `agentmailer messages`

#### `agentmailer messages delete`

Delete a message

`DELETE /v1/inboxes/{inboxId}/messages/{messageId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--message-id` | `string` | Yes |  |

#### `agentmailer messages forward`

Forward a message

`POST /v1/inboxes/{inboxId}/messages/{messageId}/forward`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--message-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer messages get`

Get a message

`GET /v1/inboxes/{inboxId}/messages/{messageId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--message-id` | `string` | Yes |  |

#### `agentmailer messages list`

List or search messages

`GET /v1/inboxes/{inboxId}/messages`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--limit` | `integer` | No |  |
| `--page-token` | `string` | No |  |
| `--thread-id` | `string` | No |  |
| `--label` | `string` | No |  |
| `--query` | `string` | No |  |
| `--before` | `string (date-time)` | No |  |
| `--after` | `string (date-time)` | No |  |

#### `agentmailer messages reply`

Reply to a message

`POST /v1/inboxes/{inboxId}/messages/{messageId}/reply`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--message-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer messages reply-all`

Reply all to a message

`POST /v1/inboxes/{inboxId}/messages/{messageId}/reply-all`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--message-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer messages send`

Send a message

`POST /v1/inboxes/{inboxId}/messages/send`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer pods`

#### `agentmailer pods create`

Create a Pod

`POST /v1/pods`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer pods delete`

Delete a Pod

`DELETE /v1/pods/{podId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--pod-id` | `string` | Yes |  |

#### `agentmailer pods get`

Get a Pod

`GET /v1/pods/{podId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--pod-id` | `string` | Yes |  |

#### `agentmailer pods list`

List Pods

`GET /v1/pods`

#### `agentmailer pods update`

Update a Pod

`PATCH /v1/pods/{podId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--pod-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

### `agentmailer threads`

#### `agentmailer threads get`

Get a thread and conversation

`GET /v1/inboxes/{inboxId}/threads/{threadId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--thread-id` | `string` | Yes |  |

#### `agentmailer threads list`

List or search threads

`GET /v1/inboxes/{inboxId}/threads`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--inbox-id` | `string` | Yes |  |
| `--limit` | `integer` | No |  |
| `--page-token` | `string` | No |  |
| `--label` | `string` | No |  |
| `--query` | `string` | No |  |
| `--before` | `string (date-time)` | No |  |
| `--after` | `string (date-time)` | No |  |

---

### `agentmailer webhooks`

#### `agentmailer webhooks create`

Create a webhook endpoint

`POST /v1/webhooks`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

#### `agentmailer webhooks delete`

Delete a webhook endpoint

`DELETE /v1/webhooks/{webhookId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--webhook-id` | `string` | Yes |  |

#### `agentmailer webhooks get`

Get a webhook endpoint

`GET /v1/webhooks/{webhookId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--webhook-id` | `string` | Yes |  |

#### `agentmailer webhooks list`

List webhook endpoints

`GET /v1/webhooks`

#### `agentmailer webhooks rotate-secret`

Rotate a webhook signing secret

`POST /v1/webhooks/{webhookId}/rotate-secret`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--webhook-id` | `string` | Yes |  |

#### `agentmailer webhooks update`

Update a webhook endpoint

`PATCH /v1/webhooks/{webhookId}`

| Flag | Type | Required | Description |
|------|------|----------|-------------|
| `--webhook-id` | `string` | Yes |  |
| `--json` | `JSON` | Yes | Request body as JSON (or use individual body-field flags) |

---

## Global flags

These flags are available on every command:

| Flag | Description |
|------|-------------|
| `--dry-run` | Print the HTTP request without sending it |
| `--json <JSON\|->` | Supply the request body as JSON (or `-` for stdin) |
| `--params <JSON>` | Merge extra parameters as JSON |
| `--format <json\|table\|yaml\|csv>` | Output format (default: `json`) |
| `--output <PATH>` | Write binary responses to a file |
| `--base-url <URL>` | Override the API base URL |
| `--page-all` | Auto-paginate and stream all results |
| `--page-limit <N>` | Max pages to fetch (default: `10`) |
| `-q, --quiet` | Suppress stdout on success |
| `-h, --help` | Print help |
| `-V, --version` | Print version |

