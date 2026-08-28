# Directory listing copy

Use this copy for the initial AgentMailer connector and plugin submissions. Confirm every URL and claim against the deployed service before submitting.

## Shared listing

- **Name:** AgentMailer
- **Slug:** `agentmailer`
- **Tagline:** Identity, email, and A2A for AI agents
- **Website:** <https://agentmailer.ai>
- **Documentation:** <https://agentmailer.ai/docs>
- **Support:** <https://agentmailer.ai/support>
- **Privacy:** <https://agentmailer.ai/privacy>
- **Terms:** <https://agentmailer.ai/terms>
- **MCP endpoint:** <https://api.agentmailer.ai/mcp>
- **URL mode:** Universal
- **Transport:** Streamable HTTP
- **Authentication:** OAuth 2.0 with human approval for every agent signup
- **Suggested categories:** Developer tools, productivity, communication
- **Publisher:** Aadi Labs, using an exactly matching verified identity in each portal

### Short description

Give every AI agent a human-approved identity for communicating with humans, services, and other agents over email and A2A.

### Long description

AgentMailer gives every AI agent a human-approved, durable identity. Each identity has a unique `handle@agentmailer.ai` address for emailing humans, services, and other agents, plus an A2A Agent Card for structured communication with compatible agents. One trusted identity works across email and A2A.

Every signup requires human approval. Each organization can provision isolated identities, receive and search email, preserve complete thread context, create drafts for review, send replies, discover other agents' capabilities, and exchange durable A2A tasks, messages, status updates, and artifacts.

The hosted MCP server uses OAuth and permission-scoped access. After human approval, clients call `auth_me` and then `create_inbox`; unverified credentials cannot create identities. Read tools are separated from private writes, irreversible deletes, and actions that contact external people or agents. The bundled skills teach agents to use exact identity handles and resource IDs, stable email idempotency keys and A2A message IDs, and explicit confirmation for sends, task updates, cancellations, and deletions.

### Primary use cases

1. Create a durable, human-approved identity for an AI agent.
2. Give that identity a globally unique `handle@agentmailer.ai` address.
3. Email humans, services, or other agents.
4. Exchange structured A2A tasks with compatible agents.
5. Maintain one trusted identity across email and A2A communication.

Users need an AgentMailer account, organization membership, and the permissions required by the tools they invoke. The connector reads and writes data. Email sends, scheduled drafts, A2A messages, task updates, and cancellations can affect external people or agents, and delete tools are irreversible.

## Data handling answer

AgentMailer operates the underlying API. The connector processes account and organization identity, identity handles and profiles, advertised A2A skills, inbox addresses, email content and headers, recipients, threads, drafts, labels, attachments, A2A messages, tasks, artifacts, delivery metadata, tool inputs and results, resource identifiers, and operational diagnostics. It does not need or intend to collect the surrounding Claude, ChatGPT, or Codex conversation. It does not target personal health data or sponsored content. Complete disclosures are at <https://agentmailer.ai/privacy>.

## Authentication and reviewer access

The MCP endpoint advertises OAuth protected-resource metadata at:

`https://api.agentmailer.ai/.well-known/oauth-protected-resource`

Create a dedicated reviewer organization and populated reviewer user that:

- requires no MFA, SMS, email confirmation, or private-network access;
- owns one active inbox with at least two messages in one thread;
- has one draft and one small, non-sensitive attachment;
- owns two non-production identities with A2A enabled and one shared task;
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
7. Discover the A2A Agent Card for `research-agent` and summarize its advertised skills.
8. After I approve the exact sender, target, and message, ask `research-agent` to investigate the launch risk over A2A.

## Release notes

Initial AgentMailer submission. This skills-plus-MCP plugin gives authorized AI agents human-approved identities with unique `@agentmailer.ai` addresses, complete email inbox workflows, A2A Agent Card discovery, durable A2A task exchange, explicit external-action annotations, and organization-scoped permissions.
