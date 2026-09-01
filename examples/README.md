# AgentMailer examples

Copyable, named examples for common AgentMailer workflows. Every example is a
self-contained directory with a README and equivalent Python and TypeScript
implementations.

## Architecture boundary

These examples are agent applications, not jobs hosted by AgentMailer.
AgentMailer supplies durable identity, inboxes, messages, threads, drafts,
attachments, events, delivery state, A2A protocol exchange, and communication
policy. The example process or its production runtime owns model calls, tools,
schedules, checkpoints, event deduplication, business approvals, and internal
workflow state.

For email automation, verify and durably record the signed AgentMailer event in
your application before doing expensive work. Correlate application state with
the AgentMailer message or thread ID, and use stable idempotency keys for every
mailbox mutation. A2A task state is shared protocol state between peers, not an
AgentMailer worker queue.

## Getting started and infrastructure

| Example | Learn how to |
| --- | --- |
| [Quickstart](agentmailer-quickstart/) | List inboxes and opt in to sending a first email |
| [Human-approved signup](agentmailer-human-approved-signup/) | Request an agent identity with explicit human approval |
| [A2A delegation](agentmailer-a2a-delegation/) | Discover a peer's Agent Card before delegating a task |
| [Webhook consumer](agentmailer-webhook-consumer/) | Verify signed events and reject replayed deliveries |
| [Browser Use integration](agentmailer-browser-use/) | Give a Browser Use agent mailbox and draft tools |
| [Kernel browser integration](agentmailer-kernel-browser/) | Combine isolated cloud browsing with reviewable email drafts |
| [LangChain terminal](agentmailer-langchain-terminal/) | Put AgentMailer behind a terminal agent loop |
| [OpenAI terminal](agentmailer-openai-terminal/) | Inspect mail with an OpenAI-compatible model |
| [CLI workflows](cli/) | Compose read-first AgentMailer shell commands |

## Productivity and operations

| Example | Learn how to |
| --- | --- |
| [Approval inbox](agentmailer-approval-inbox/) | Turn requests into explicit approval drafts |
| [Inbox Zero](agentmailer-inbox-zero/) | Classify mail and produce an actionable digest |
| [Note taker](agentmailer-note-taker/) | Convert forwarded mail into structured notes |
| [Newsletter digest](agentmailer-newsletter-digest/) | Summarize newsletters into one briefing |
| [Scheduling agent](agentmailer-scheduling-agent/) | Coordinate timezones and meeting availability |
| [Dinner coordination agent](agentmailer-dinner-agent/) | Reconcile participant preferences into a plan |
| [Dinner reservation](agentmailer-dinner-reservation/) | Coordinate parties and restaurant reservations |
| [Browser signup agent](agentmailer-browser-signup-agent/) | Handle verification mail without exposing OTPs |
| [Voice-to-email](agentmailer-voice-to-email/) | Turn a supplied transcript into email |

## Sales, recruiting, and communications

| Example | Learn how to |
| --- | --- |
| [GTM agent](agentmailer-gtm-agent/) | Draft relevant, permission-aware outreach |
| [Cold email researcher](agentmailer-cold-email-researcher/) | Research prospect context before outreach |
| [Sales agent](agentmailer-sales-agent/) | Qualify inbound interest and propose a response |
| [Sales signal router](agentmailer-sales-signal-router/) | Detect and route buying signals |
| [Negotiation agent](agentmailer-negotiation-agent/) | Draft counteroffers within an approved mandate |
| [Podcast booking agent](agentmailer-podcast-booking-agent/) | Research fit and prepare guest outreach |
| [Hiring screener](agentmailer-hiring-screener-agent/) | Structure applicant evidence against a rubric |
| [Recruiter coordinator](agentmailer-recruiter-coordinator/) | Coordinate candidate interviews |

## Support, finance, legal, and development

| Example | Learn how to |
| --- | --- |
| [Email agent](agentmailer-email-agent/) | Prepare safe responses to inbound mail |
| [Support agent](agentmailer-support-agent/) | Triage support mail and prepare reviewable drafts |
| [Documentation assistant](agentmailer-docs-assistant/) | Answer product questions with cited sources |
| [Invoice processor](agentmailer-invoice-processor/) | Extract invoice fields and route exceptions |
| [Receipt parser](agentmailer-receipt-parser-agent/) | Extract structured receipt data |
| [Collections agent](agentmailer-collections-agent/) | Draft respectful payment reminders |
| [x402 payment agent](agentmailer-x402-payment-agent/) | Prepare a payment approval record |
| [Contract redline agent](agentmailer-contract-redline-agent/) | Identify risky contract clauses |
| [Legal intake agent](agentmailer-legal-intake-agent/) | Collect matter-intake facts without legal advice |
| [GitHub maintainer agent](agentmailer-github-maintainer-agent/) | Propose actions for repository notifications |

Each TypeScript example is an independent workspace package. Validate them all
without calling AgentMailer:

```sh
pnpm install
pnpm --filter @agentmailer/sdk build
pnpm examples:check
```

Python examples install the local generated SDK from this repository. From an
example's `python/` directory:

```sh
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python agent.py
```

The existing [client snippets](clients/) remain available as terse API
references. Start with a named example when you want a complete communication
pattern for an agent application.

## Safety conventions

- Read operations are the default.
- Email and A2A writes require an explicit environment-variable opt-in.
- Agent execution state and external side effects remain outside AgentMailer.
- Signup stops at the human approval boundary.
- Support automation creates a draft instead of sending a reply.
- Webhook examples verify the raw request body before parsing it.
- Secrets, customer content, and `.env` files must never be committed.

## Inkbox workflow coverage

The Browser Use, Kernel, signup, webhook, and CLI mailbox journeys from
[Inkbox's examples](https://github.com/inkbox-ai/inkbox/tree/main/examples) are
covered. AgentMailer does not expose an encrypted credential vault, TOTP
generation, phone-number provisioning, calling, or a general-purpose public
tunnel. Those Inkbox-specific operations are intentionally not imitated here;
use a dedicated provider with separately scoped credentials when a workflow
needs them.
