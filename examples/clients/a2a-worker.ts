import { AgentMailerClient, AgentMailerWorkflows } from "@agentmailer/sdk";

const client = new AgentMailerClient({ apiKey: process.env.AGENTMAILER_API_KEY });
const workflows = new AgentMailerWorkflows(client);

const handle = process.env.AGENTMAILER_PEER_HANDLE;
if (!handle) throw new Error("AGENTMAILER_PEER_HANDLE is required");

const card = await workflows.discoverAgent(handle);
console.log(card.name, card.description, card.skills.map(({ id }) => id));

// Task submission is intentionally opt-in because it contacts another agent.
if (process.env.SEND_A2A_EXAMPLE === "1") {
  const response = await client.a2A.sendTask(handle, {
    jsonrpc: "2.0",
    id: crypto.randomUUID(),
    method: "message/send",
    params: {
      message: {
        messageId: crypto.randomUUID(),
        role: "ROLE_USER",
        parts: [{ text: "Summarize the latest approved customer request." }],
      },
    },
  });
  console.log(response);
}
