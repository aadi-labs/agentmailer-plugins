# AgentMailer API CLI

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-CLI%20generated%20by%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=AgentMailer%20API%2FCLI)

Command-line interface for the AgentMailer API.

## Table of contents

- [Installation](#installation)
- [Authentication](#authentication)
- [Quick start](#quick-start)
- [Usage](#usage)
- [Documentation](#documentation)
- [Advanced](#advanced)
  - [Common flags](#common-flags)
  - [Environment variables](#environment-variables)
  - [Output formats](#output-formats)
  - [Shell completion](#shell-completion)
- [Attribution](#attribution)

## Installation

> Prebuilt installers become available after the first GitHub release. Until then, build the CLI from source below.

### Shell (macOS / Linux)

```bash
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/aadi-labs/agentmailer-plugins/releases/latest/download/agentmailer-cli-installer.sh | sh
```

### PowerShell (Windows)

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://github.com/aadi-labs/agentmailer-plugins/releases/latest/download/agentmailer-cli-installer.ps1 | iex"
```

### Build from source

If you prefer to build from source, install the [Rust toolchain](https://rustup.rs/) and run:

```bash
cargo build --release
./target/release/agentmailer --help
```

## Authentication

Set the following environment variable(s) before using the CLI:

```bash
export AGENTMAILER_API_KEY="<your token>"
```

A `.env` file in the working directory is also supported — the CLI auto-loads it on startup.

## Quick start

Start with a read-only request:

```bash
agentmailer inboxes list --limit 10 --format table
```

Preview a write without sending it:

```bash
agentmailer messages send \
  --inbox-id inb_REPLACE_ME \
  --json '{"to":["recipient@example.com"],"subject":"Hello","text":"Sent with AgentMailer."}' \
  --dry-run
```

Run `agentmailer <resource> --help` for flags and `agentmailer --help --format json` for the machine-readable operation catalog.

## Usage

Every API resource appears as a subcommand (e.g. `agentmailer <resource> <method>`). Run `agentmailer <resource> --help` to see available methods.

Provide request parameters as flags or as JSON:

```bash
agentmailer <resource> <method> --json '{"key": "value"}'
```

## Documentation

See [reference.md](./reference.md) for the full command reference.

## Advanced

### Common flags

These flags are available on every operation:

| Flag | Description |
|------|-------------|
| `--dry-run` | Validate the request locally and print the HTTP request without sending it |
| `--json <JSON\|->` | Supply a request body as JSON (or `-` to read stdin) |
| `--params <JSON>` | Merge extra parameters as JSON (overrides individual flags) |
| `--format <json\|table\|yaml\|csv>` | Output format (default `json`) |
| `--output <PATH>` | Write binary responses to a file |
| `--base-url <URL>` | Override the API base URL |
| `--page-all` | Auto-paginate and stream results as NDJSON |
| `--page-limit <N>` | Max pages to fetch when auto-paginating (default `10`) |
| `-q, --quiet` | Suppress stdout output on success (errors still go to stderr) |

### Environment variables

| Variable | Description |
|----------|-------------|
| `AGENTMAILER_BASE_URL` | Override the API base URL |
| `AGENTMAILER_CA_BUNDLE` | Path to PEM file with extra trust roots (or `SSL_CERT_FILE`) |
| `AGENTMAILER_INSECURE=1` | Skip TLS verification (debugging only) |
| `AGENTMAILER_PROXY` | HTTP(S) proxy URL |
| `AGENTMAILER_TIMEOUT_SECS` | Total request timeout in seconds |

Standard environment variables (`HTTPS_PROXY` / `HTTP_PROXY` / `NO_PROXY` / `SSL_CERT_FILE`) are also honored.

### Output formats

Use the global `--format` flag to control output. Supported values: `json`, `table`, `yaml`, `csv`, `jsonl`, `raw`, `http`.

Without `--format`, output (including errors) is `table` when stdout is a terminal and `json` when it is piped or redirected — so scripts and agents get JSON by default. Pass `--human` to keep the interactive rendering when piping to a pager, and `--format json` to pin JSON in a terminal.

```bash
# Pipe JSON output through jq
agentmailer <resource> <method> --format json | jq

# Keep the human rendering even when piped
agentmailer <resource> <method> --human | less

# Machine-readable catalog of every operation (same as --schema)
agentmailer --help --format json | jq '.operations | length'
```

### Shell completion

Generate shell completion scripts:

```bash
agentmailer completion <bash|zsh|fish|powershell>
```

## Attribution

Built on [fern-cli-sdk](https://github.com/fern-api/fern), Copyright Fern, licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

