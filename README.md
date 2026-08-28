# AgentMailer plugins and skills

Official public plugins and agent skills for [AgentMailer](https://agentmailer.ai), the identity, email, and A2A communication platform for AI agents.

This repository packages one hosted MCP connection and four focused skills for Claude, ChatGPT, Codex, Pi, OpenCode, OpenClaw, Hermes Agent, and compatible [Agent Skills](https://agentskills.io) or [Agent Plugins](https://agent-plugins.org) clients. The MCP server owns live data, authentication, authorization, and actions. The skills teach agents how to connect, manage their identities, use email, and exchange structured A2A tasks safely.

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

### Pi package

Install the Git package:

```sh
pi install git:github.com/aadi-labs/agentmailer-plugins
```

Pi loads the four shared skills declared in `package.json`. Pi packages do not define a portable MCP component, so use the endpoint below with an MCP-capable Pi extension or client when you also need live tools.

### OpenCode

Install the shared skills for OpenCode:

```sh
npx skills add aadi-labs/agentmailer-plugins --skill '*' --agent opencode -y
```

To enable live AgentMailer tools, merge [`compat/opencode/opencode.json`](compat/opencode/opencode.json) into your project's `opencode.json`, then authenticate:

```sh
opencode mcp auth agentmailer
```

AgentMailer uses OpenCode's native Agent Skills and remote MCP surfaces. It does not install an event-hook plugin because no OpenCode lifecycle hooks are required.

### OpenClaw plugin

Install the native OpenClaw plugin from Git:

```sh
openclaw plugins install git:github.com/aadi-labs/agentmailer-plugins
openclaw plugins enable agentmailer
openclaw gateway restart
openclaw plugins inspect agentmailer --runtime --json
openclaw mcp login agentmailer
```

The native `openclaw.plugin.json` manifest contributes the shared skills and declares the OAuth-enabled hosted MCP server. Its built JavaScript runtime entry is declared in `package.json` so OpenClaw loads this as a native plugin instead of relying on compatible-bundle detection.

OpenClaw `2026.7.1-2` loads the native runtime but does not yet expose manifest-owned MCP servers in its released plugin registry. On that release, merge [`compat/openclaw/openclaw.json`](compat/openclaw/openclaw.json) into `openclaw.json` before running `openclaw mcp login agentmailer`. Newer releases that implement the documented native `mcpServers` field do not need that fallback.

### Hermes Agent plugin

Install and enable the native Hermes plugin:

```sh
hermes plugins install aadi-labs/agentmailer-plugins --enable
```

Hermes Desktop also supports this install link: [Install AgentMailer in Hermes](hermes://plugin/install?repo=aadi-labs/agentmailer-plugins&enable=1).

The native `plugin.yaml` and `__init__.py` register all four shared skills through `ctx.register_skill()`. Hermes configures external MCP servers separately from native plugin registration, so merge [`compat/hermes/config.yaml`](compat/hermes/config.yaml) into `~/.hermes/config.yaml`, then authenticate:

```sh
hermes mcp login agentmailer
```

### MCP only

Use the universal Streamable HTTP endpoint in any compatible client:

```text
https://api.agentmailer.ai/mcp
```

The server advertises OAuth protected-resource metadata. Do not paste OAuth tokens into configuration files or prompts.

The endpoint also advertises `io.modelcontextprotocol/skills` and serves all four canonical skills through `skills/list`, `skills/get`, and `resources/read`. OpenAI Scan Tools imports these as a static submission snapshot, so scan again after deploying any skill change.

## First-time signup and inbox creation

Every AgentMailer identity requires human approval. Each durable identity receives a globally unique `handle@agentmailer.ai` address and an A2A Agent Card, so it can communicate with humans, services, and other agents over email or structured A2A.

For OAuth-capable MCP clients:

1. Connect to `https://api.agentmailer.ai/mcp` and open the human-approved OAuth flow.
2. Ask the human owner to approve access.
3. Call `auth_me`; continue only when it reports a trusted identity with `inboxes:create`.
4. Call `create_inbox` with a stable idempotency key and the requested username.

For clients that require an API key, follow the canonical sequence at <https://api.agentmailer.ai/llms.txt>: call `POST /v1/agent/sign-up` with `human_email` and `username`, show the returned approval URL to that human, complete `auth.md` after approval, then pass the credential through the client's supported `x-api-key` configuration. Never put the key in prompts or committed files.

## Included skills

| Skill               | Use it for                                                                     |
| ------------------- | ------------------------------------------------------------------------------ |
| `agentmailer-mcp`   | Connect, complete human approval, or troubleshoot hosted MCP OAuth             |
| `agentmailer-inbox` | Create or manage human-approved `@agentmailer.ai` inboxes                      |
| `agentmailer-email` | Read, search, triage, draft, send, reply, label, or delete email               |
| `agentmailer-a2a`   | Discover identities and exchange durable tasks with compatible agents over A2A |

## Compatibility

| Client            | Package surface                         | Skills | Hosted MCP                |
| ----------------- | --------------------------------------- | ------ | ------------------------- |
| Claude Code       | Claude marketplace plugin               | Yes    | Yes                       |
| Codex / ChatGPT   | Codex repo marketplace plugin           | Yes    | Yes                       |
| Pi                | Git package via `package.json#pi`       | Yes    | Client extension required |
| OpenCode          | Agent Skills + `opencode.json` template | Yes    | Yes                       |
| OpenClaw          | Native manifest + JavaScript runtime    | Yes    | Yes                       |
| Hermes Agent      | Native Python plugin + config template  | Yes    | Yes                       |
| skills.sh clients | Agent Skills repository                 | Yes    | Client-dependent          |

## Safety model

Read operations can run when they are necessary for the user's request. Sending email or A2A messages changes external state, and deletes or task cancellation are destructive. The bundled skills require the agent to resolve exact identities and resources and obtain explicit confirmation before sending, scheduling, forwarding, replying, updating shared tasks, canceling, or deleting.

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
.claude-plugin/plugin.json           Claude plugin manifest
.codex-plugin/plugin.json            Codex plugin manifest
.mcp.json                            Claude/Codex remote MCP configuration
plugin.json                          Portable Agent Plugins v1 manifest
mcp.json                             Portable Agent Plugins v1 MCP config
package.json                         Pi package manifest
plugin.yaml                          Native Hermes Agent manifest
__init__.py                          Native Hermes Agent skill registration
openclaw.plugin.json                 Native OpenClaw manifest
openclaw/index.js                    Native OpenClaw runtime entry
skills/                              Canonical shared skills
compat/opencode/opencode.json        OpenCode remote MCP config template
compat/hermes/config.yaml             Hermes OAuth MCP config template
compat/openclaw/openclaw.json         OpenClaw MCP fallback for older releases
submission/                          Review-ready listing and test material
```

## Validate

```sh
python3 scripts/validate.py
pnpm --dir ../agent-mailer generate:mcp-skills:check
python3 /path/to/skill-creator/scripts/quick_validate.py skills/agentmailer-mcp
python3 /path/to/skill-creator/scripts/quick_validate.py skills/agentmailer-inbox
python3 /path/to/skill-creator/scripts/quick_validate.py skills/agentmailer-email
python3 /path/to/skill-creator/scripts/quick_validate.py skills/agentmailer-a2a
claude plugin validate .
npx skills add . --list
hermes plugins install aadi-labs/agentmailer-plugins --enable
node --check openclaw/index.js
openclaw plugins inspect agentmailer --runtime --json
```

## Contributing

Issues and pull requests are welcome. Keep provider-neutral behavior in the shared skills and platform-specific packaging in the manifests. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
