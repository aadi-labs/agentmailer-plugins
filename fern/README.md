# AgentMailer documentation on Fern

Target: `agentmailer.docs.buildwithfern.com` in the Fern organization `aadilabs`.
The existing SDK generator configuration shares the same reviewed API contract.

## Author and validate

- Edit introductory guides in `pages/`.
- Edit skills and their references in their top-level source directories, not
  `pages/generated/`. Edit example instructions in each example's README.
- Edit navigation and branding in `docs.template.yml`, not `docs.yml`.
- `pages/platform/` contains imported public guides, integrations, and use cases.
  `platform-pages.json` records their original URLs. These are editable docs now;
  do not rerun the one-time import over subsequent editorial changes.
- Run `pnpm docs:build`, then `pnpm docs:check` and `pnpm validate`.

`migration-manifest.json` records every generated page and its public source.
No private platform configuration, architecture runbook, Terraform state, or
security operations document is imported.

`openapi/openapi.json` remains the reviewed source snapshot. The deterministic
`openapi/fern.openapi.json` adapter moves embedded JSON Schema `$defs` into
namespaced OpenAPI components, preserving recursive references. This fixes
document-root references that otherwise prevent Fern validation. Do not edit
either generated contract by hand. `pnpm sdk:sync` rebuilds the adapter.

## Preview and publish

Authenticate using `pnpm exec fern login` locally. Never commit Fern tokens.
Once authenticated:

```sh
pnpm docs:check
pnpm exec fern generate --docs --preview --instance agentmailer.docs.buildwithfern.com
# Review the returned preview, then publish only with release authorization:
pnpm docs:publish
```

The Fern Dashboard currently has no repository connected. Connect the
public `aadi-labs/agentmailer-plugins` repository to enable editor persistence.
Only grant the required repository access; do not upload the private platform
repository. A repository connection and a Git push are separate release actions.

## Cutover gates

The Fern site was published on 2026-09-09. All 161 sitemap pages passed live
checks, along with the markdown quickstart, agent index, and legacy redirects.
The main platform's exact `/docs` and `/docs/enterprise-managed-auth` redirects
are tested locally but await a separately authorized website release.
Keep API-owned OpenAPI, auth.md, OAuth/MCP
discovery, and MCP endpoints at their existing stable URLs. Marketing, legal,
pricing, and dashboard routes remain on the main site.

The DNS inventory on 2026-09-09 contained 29 records and no Mintlify or docs
record for `agentmailer.ai`. No AgentMailer Mintlify rewrite exists in the
platform configuration. Mintlify configuration found in other products must not
be removed as part of this migration.

The supplied Fern hostname needs no AgentMailer DNS changes. A custom subdomain
requires Fern-provided CNAME and verification values; never copy the example
values from Fern's documentation or change the apex/mail/API records. Hosting at
the existing `/docs` path requires Fern's supported subpath setup and a verified
proxy configuration. Complete that separately after the published site passes
acceptance.
