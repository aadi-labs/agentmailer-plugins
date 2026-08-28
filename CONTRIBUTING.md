# Contributing

Contributions that improve AgentMailer setup, inbox workflows, email safety, portability, or documentation are welcome.

1. Open an issue for a material behavior change.
2. Keep each skill focused and provider-neutral.
3. Do not add credentials, customer data, internal URLs, or production identifiers.
4. Keep `plugin.json`, `mcp.json`, `.mcp.json`, `package.json`, and platform manifests aligned when packaging metadata changes.
5. Run `python3 scripts/validate.py`, `claude plugin validate .`, and `npx skills add . --list` before opening a pull request.

Sending, scheduling, replying, forwarding, and deleting must remain explicit-confirmation operations. Changes that weaken those boundaries will not be accepted.
