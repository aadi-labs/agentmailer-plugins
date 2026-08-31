import { AgentMailerClient } from "../sdk/typescript/dist/esm/index.mjs";

const apiKey = process.env.AGENTMAILER_SMOKE_API_KEY;
if (!apiKey) throw new Error("AGENTMAILER_SMOKE_API_KEY is required");

const client = new AgentMailerClient({ apiKey });
const { inboxes } = await client.inboxes.list({ limit: 1 });
console.log(`Authenticated read-only smoke test passed (${inboxes.length} inboxes returned).`);
