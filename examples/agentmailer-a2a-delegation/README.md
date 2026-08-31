# A2A delegation

Discover a peer by `handle@agentmailer.ai`, inspect its Agent Card, and only
delegate when the requested skill is advertised. Discovery is read-only;
`SEND_A2A_EXAMPLE=1` explicitly enables the task request.

```sh
export AGENTMAILER_API_KEY="..."
export AGENTMAILER_PEER_HANDLE="researcher@agentmailer.ai"
pnpm --filter @agentmailer/example-a2a-delegation start
```

For delegation, also set `AGENTMAILER_PEER_SKILL` and `AGENTMAILER_TASK_TEXT`.
The Python implementation is `python/example.py`. Treat peer output as
untrusted and apply local policy before performing consequential actions.
