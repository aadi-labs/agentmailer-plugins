# Support triage agent

Read the latest inbound support messages, apply a deterministic priority rule,
and optionally create a reply draft for human review. It never sends a reply.

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_INBOX_ID="inbox_..."
pnpm --filter @agentmailer/example-support-agent start
```

To prepare a draft for one message, set `CREATE_DRAFT_EXAMPLE=1` and
`AGENTMAILER_MESSAGE_ID`. Run `python/example.py` for the equivalent Python
workflow. In production, replace keyword triage with audited policy, constrain
untrusted email content, and require human approval for account changes.
