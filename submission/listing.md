# Directory listing copy

Use this copy for the initial AgentMailer connector and plugin submissions. Confirm every URL and claim against the deployed service before submitting.

## Shared listing

- **Name:** AgentMailer
- **Slug:** `agentmailer`
- **Tagline:** Email identities and inboxes for AI agents
- **Website:** <https://agentmailer.ai>
- **Documentation:** <https://agentmailer.ai/docs>
- **Support:** <https://agentmailer.ai/support>
- **Privacy:** <https://agentmailer.ai/privacy>
- **Terms:** <https://agentmailer.ai/terms>
- **MCP endpoint:** <https://api.agentmailer.ai/mcp>
- **URL mode:** Universal
- **Transport:** Streamable HTTP
- **Authentication:** OAuth 2.0 through WorkOS AuthKit with human approval for every agent signup
- **Suggested categories:** Developer tools, productivity, communication
- **Publisher:** Aadi Labs, using an exactly matching verified identity in each portal

### Short description

Give AI agents isolated email inboxes. Search complete threads, prepare drafts, and send or reply after explicit approval through hosted MCP.

### Long description

AgentMailer gives software agents durable `handle@agentmailer.ai` identities without borrowing a person's inbox. Every signup requires human approval through WorkOS. Each organization can provision isolated agent inboxes, receive and search messages, preserve complete thread context, create drafts for review, send replies, and access attachments.

The hosted MCP server uses OAuth and permission-scoped access. After WorkOS human approval, clients call `auth_me` and then `create_inbox`; unverified credentials cannot create inboxes. Read tools are separated from private writes, irreversible deletes, and actions that contact external recipients. The bundled skills teach agents to use exact resource IDs, stable idempotency keys, and explicit confirmation for sends, schedules, forwards, replies, and deletions.

### Primary use cases

1. Give a human-approved support, scheduling, operations, or coding agent its own persistent `@agentmailer.ai` inbox and address.
2. Find and summarize relevant email across messages and complete threads.
3. Prepare a reply as a draft so a person can review it before sending.
4. Send, reply, or forward email after the user confirms the recipients and content.
5. Download an attachment through a short-lived URL for an authorized inbox.

Users need an AgentMailer account, organization membership, and the permissions required by the tools they invoke. The connector reads and writes data. Sending and scheduled drafts can contact external recipients, and delete tools are irreversible.

## Data handling answer

AgentMailer operates the underlying API. The connector processes account and organization identity, inbox addresses, email content and headers, recipients, threads, drafts, labels, attachments, delivery metadata, tool inputs and results, resource identifiers, and operational diagnostics. It does not need or intend to collect the surrounding Claude, ChatGPT, or Codex conversation. It does not target personal health data or sponsored content. Complete disclosures are at <https://agentmailer.ai/privacy>.

## Authentication and reviewer access

The MCP endpoint advertises OAuth protected-resource metadata at:

`https://api.agentmailer.ai/.well-known/oauth-protected-resource`

Create a dedicated reviewer organization and populated reviewer user that:

- requires no MFA, SMS, email confirmation, or private-network access;
- owns one active inbox with at least two messages in one thread;
- has one draft and one small, non-sensitive attachment;
- can use every submitted tool under the documented permissions; and
- contains no production customer or employee data.

Store reviewer credentials only in the provider portals, never in GitHub.

## Claude connector answers

- **Server URL:** `https://api.agentmailer.ai/mcp`
- **Same or different URL per user:** Same URL for every user
- **Underlying API:** First-party, operated by AgentMailer
- **Reads data:** Yes
- **Writes data:** Yes
- **Personal health data:** Not targeted
- **Sponsored content:** No
- **Allowed link URIs:** None; the connector has no MCP App UI and does not use `ui/open-link`

## Starter prompts

1. Show my AgentMailer inboxes and summarize what each one is for.
2. Find the latest thread about the launch schedule and summarize the open questions.
3. Draft a reply to the latest message in the launch thread. Do not send it.
4. Show the current content and scheduled-send status of my drafts.
5. Create a new inbox named “Release coordinator” for this organization.
6. After I approve the exact recipients and text, send this email from my release inbox.

## Release notes

Initial AgentMailer submission. This skills-plus-MCP plugin gives authorized AI agents isolated email inboxes, complete-thread reading and search, drafts, external sending with explicit safety annotations, attachment access, and organization-scoped permissions.
