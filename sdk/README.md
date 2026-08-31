# AgentMailer SDKs

The source-of-truth Fern project and generated SDK monorepo for AgentMailer.
One annotated snapshot of the public OpenAPI contract generates consistent
clients for TypeScript, Python, Rust, Ruby, Go, and Swift.

## Repository layout

```text
../../fern/            Fern configuration and pinned OpenAPI snapshot
../../scripts/         Contract synchronization and validation
typescript/            Generated TypeScript SDK
python/                Generated Python SDK
rust/                  Generated Rust SDK
ruby/                  Generated Ruby SDK
go/                    Generated Go SDK
swift/                 Generated Swift SDK
```

The sibling [`../cli`](../cli/) directory is emitted from the same Fern project,
so commands and SDK methods cannot silently drift apart.

## Development

```bash
pnpm install
pnpm sdk:sync
pnpm sdk:check
pnpm sdk:generate
pnpm cli:generate
```

`pnpm sdk:sync` fetches the deployed AgentMailer OpenAPI document, verifies every
public operation has stable SDK naming metadata, excludes the MCP transport
endpoint, and writes a deterministic snapshot. Commit that snapshot with any
generated changes so API drift remains reviewable.

Run these commands from the repository root. Generation runs locally in Fern's
pinned Docker generator images, so contributors do not need a Fern Cloud
account. The CLI generator is currently an early-access Fern feature, but the
pinned generator is already configured and verified in this repository.

## Authentication

Generated clients use `AGENTMAILER_API_KEY` and default to
`https://api.agentmailer.ai`. Never commit API keys or generated credentials.
