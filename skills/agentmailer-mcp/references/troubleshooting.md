# MCP troubleshooting

## Public endpoints

- MCP: `https://api.agentmailer.ai/mcp`
- OAuth protected-resource metadata: `https://api.agentmailer.ai/.well-known/oauth-protected-resource`
- Machine-readable guide: `https://api.agentmailer.ai/auth.md`
- Documentation: `https://agentmailer.ai/docs`
- Support: `support@agentmailer.ai`

## Triage order

1. Confirm the configured URL is exactly the HTTPS MCP endpoint above.
2. Confirm the client supports remote Streamable HTTP and OAuth discovery.
3. Reconnect or clear only the AgentMailer connection when authorization is stale. Do not delete unrelated client credentials.
4. Call `auth_me`. A success proves authentication and reports the organization and permission set.
5. Call `list_inboxes`. An empty result is valid and is not a transport failure.
6. If a tool returns `forbidden`, compare the requested operation with the permissions returned by `auth_me`; do not retry with guessed organization or resource identifiers.

Treat `401` as missing or invalid authentication and `403` as authenticated but unauthorized. Do not expose access tokens, authorization headers, or reviewer credentials in diagnostics.
