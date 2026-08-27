# AgentMailer plugins and skills

Official public plugins and agent skills for [AgentMailer](https://agentmailer.ai), the email identity and inbox platform for AI agents.

This repository packages one hosted MCP connection and three focused skills for Claude, ChatGPT, Codex, and any client supported by the open [Agent Skills](https://agentskills.io) ecosystem. The MCP server owns live data, authentication, authorization, and actions. The skills teach agents how to connect, manage inbox identities, and handle email safely.

## Install

### Skills CLI and skills.sh

List the skills without installing them:

```sh
npx skills add aadi-labs/agentmailer-plugins --list
```

Install one skill:

```sh
npx skills add aadi-labs/agentmailer-plugins --skill agentmailer-email
```

Install all AgentMailer skills:

```sh
npx skills add aadi-labs/agentmailer-plugins --all
```

### Claude Code plugin

```sh
claude plugin marketplace add aadi-labs/agentmailer-plugins
claude plugin install agentmailer@agentmailer
```

The plugin configures the hosted MCP server. Claude Code opens the OAuth flow when the connection is first used.

### Codex plugin

```sh
codex plugin marketplace add aadi-labs/agentmailer-plugins
```

Then open the Plugins Directory in the ChatGPT desktop app, choose the **AgentMailer** source, and install **AgentMailer**.

### MCP only

Use the universal Streamable HTTP endpoint in any compatible client:

```text
https://api.agentmailer.ai/mcp
```

The server advertises OAuth protected-resource metadata. Do not paste OAuth tokens into configuration files or prompts.

## Included skills

| Skill | Use it for |
| --- | --- |
| `agentmailer-mcp` | Connect or troubleshoot the hosted MCP server and OAuth |
| `agentmailer-inbox` | Create, inspect, update, or deactivate agent inboxes |
| `agentmailer-email` | Read, search, triage, draft, send, reply, label, or delete email |

## Safety model

Read operations can run when they are necessary for the user's request. Sending email changes external state, and deletes are destructive. The bundled skills require the agent to resolve exact targets and obtain explicit confirmation before sending, scheduling, forwarding, replying, or deleting.

Use stable idempotency keys for creation and delivery operations. Never place credentials, authorization headers, reviewer accounts, or customer data in this repository.

## Privacy Policy

The plugin itself stores no credentials or email data. It connects to AgentMailer's hosted service, which processes the account, organization, inbox, message, thread, draft, attachment, recipient, and delivery data needed to provide the requested workflow. See the public [AgentMailer Privacy Policy](https://agentmailer.ai/privacy) for collection, use, storage, sharing, retention, and contact details.

## Support and security

- Documentation: <https://agentmailer.ai/docs>
- Support: <https://agentmailer.ai/support>
- Privacy: <https://agentmailer.ai/privacy>
- Terms: <https://agentmailer.ai/terms>
- Security reports: `support@agentmailer.ai` with “Security” in the subject

See [SECURITY.md](SECURITY.md) before reporting a vulnerability.

## Repository layout

```text
.agents/plugins/marketplace.json     Codex repo marketplace
.claude-plugin/marketplace.json      Claude Code marketplace
plugins/agentmailer/
  .claude-plugin/plugin.json         Claude plugin manifest
  .codex-plugin/plugin.json          Codex plugin manifest
  .mcp.json                          Shared remote MCP configuration
  skills/                            Canonical shared skills
submission/                          Review-ready listing and test material
```

## Validate

```sh
python3 scripts/validate.py
python3 /path/to/skill-creator/scripts/quick_validate.py plugins/agentmailer/skills/agentmailer-mcp
python3 /path/to/skill-creator/scripts/quick_validate.py plugins/agentmailer/skills/agentmailer-inbox
python3 /path/to/skill-creator/scripts/quick_validate.py plugins/agentmailer/skills/agentmailer-email
claude plugin validate .
npx skills add . --list
```

## Contributing

Issues and pull requests are welcome. Keep provider-neutral behavior in the shared skills and platform-specific packaging in the manifests. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
