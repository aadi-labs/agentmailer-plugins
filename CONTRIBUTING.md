# Contributing

Contributions that improve AgentMailer setup, inbox workflows, email safety, portability, or documentation are welcome.

1. Open an issue for a material behavior change.
2. Keep each skill focused and provider-neutral.
3. Edit top-level canonical skill directories, update `skills.json` when catalog membership changes, and run `pnpm skills:build`. Never edit the generated `skills/` export directly.
4. Do not add credentials, customer data, internal URLs, or production identifiers.
5. Keep `plugin.json`, `mcp.json`, `.mcp.json`, `package.json`, and platform manifests aligned when packaging metadata changes.
6. Treat `fern/openapi/openapi.json` as a reviewed snapshot. Run `pnpm sdk:sync`, inspect the contract diff, then regenerate clients rather than editing generated API methods by hand.
7. Keep hand-written SDK or CLI behavior in Fern custom code or deterministic post-processing so regeneration cannot erase it.
8. Run `pnpm validate`, `pnpm sdk:check`, `claude plugin validate .`, and `npx skills add . --list` before opening a pull request.

Sending, scheduling, replying, forwarding, and deleting must remain explicit-confirmation operations. Changes that weaken those boundaries will not be accepted.
