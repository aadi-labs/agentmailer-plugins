# Signed webhook consumer

Run a local webhook endpoint that verifies AgentMailer event signatures against
the exact raw body before parsing JSON. It rejects stale deliveries outside a
five-minute replay window.

```sh
export AGENTMAILER_WEBHOOK_SECRET="whsec_..."
pnpm --filter @agentmailer/example-webhook-consumer start
```

The listener uses `http://127.0.0.1:8787/webhooks/agentmailer`. For Python, run
`python/example.py`. Expose it through a trusted HTTPS tunnel only for local
development.

Production consumers must persist `event.id` before side effects, return
success for already-processed deliveries, and enqueue slow work before
responding. Never put the signing secret in the endpoint URL.
