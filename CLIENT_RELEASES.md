# SDK and CLI releases

The plugin, generated SDKs, and CLI live together but have independent versions and distribution channels. A plugin release does not imply that every language package has been published.

## Release order

The checked-in OpenAPI snapshot is the pull-request contract. Live API drift is
checked independently on a schedule and on demand, so an API-contract change can
land before its corresponding production deployment without making client CI
depend on deployment timing.

1. Update and deploy the canonical OpenAPI document in `agent-mailer`.
2. Run `pnpm clients:generate` here and review the generated diff.
3. Run `pnpm check` plus every language test in `.github/workflows/clients.yml`.
4. Bump only the clients that changed and update their changelogs.
5. Build registry artifacts without publishing and inspect package contents.
6. Publish with registry provenance only after explicit release approval.
7. Install from each public registry in a clean environment and run a read-only inbox listing.

## Evidence layers

- `clients.yml` validates the contract, generated wire tests, package builds, clean local artifact imports, and CLI behavior.
- `live-clients.yml` runs read-only authenticated requests from the checked-in TypeScript and Python clients against production.
- `published-clients.yml` installs exact npm and PyPI versions in clean runners and repeats the read-only production check.

Configure `AGENTMAILER_SMOKE_API_KEY` in the protected `client-smoke` GitHub environment. The credential should be restricted to `inboxes:read` in an isolated smoke-test workspace. These workflows never create inboxes or send email.

Go and Swift are released from signed repository tags. Rust, Ruby, and the CLI require their registry or GitHub release workflows before they can be described as published. Do not replace the exact-version registry checks with source installs.

`release-sdks.yml` is deliberately manual and defaults to a dry run. Public publishing additionally requires approval in the protected `client-release` environment. It publishes npm and PyPI with provenance or trusted publishing and uses scoped registry credentials for crates.io and RubyGems. Go uses the `sdk/go/vX.Y.Z` module tag; Swift uses the root `vX.Y.Z` tag and the repository-level `Package.swift` manifest.

Generated files should not be hand-edited. Put durable metadata and documentation changes in `fern/generators.yml` or the deterministic post-processors under `scripts/`.
