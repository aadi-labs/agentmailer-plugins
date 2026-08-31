# Human-approved agent signup

Request a durable `handle@agentmailer.ai` identity without an API key. The
example prints the approval URL and stops so a named human can review access.

```sh
export AGENTMAILER_HUMAN_EMAIL="owner@example.com"
export AGENTMAILER_USERNAME="research-agent"
pnpm --filter @agentmailer/example-human-approved-signup start
```

Or run `python/example.py` after installing `python/requirements.txt`. Do not
scrape, bypass, or automate the approval page.
