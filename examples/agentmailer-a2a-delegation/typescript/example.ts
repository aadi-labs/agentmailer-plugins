import { randomUUID } from "node:crypto";
import { AgentMailerClient, AgentMailerWorkflows } from "@agentmailer/sdk";

const client = new AgentMailerClient({ apiKey: required("AGENTMAILER_API_KEY") });
const handle = required("AGENTMAILER_PEER_HANDLE");
const card = await new AgentMailerWorkflows(client).discoverAgent(handle);
console.log(`${card.name}: ${card.description}`);
console.table(card.skills.map(({ id, name, description }) => ({ id, name, description })));

if (process.env.SEND_A2A_EXAMPLE === "1") {
  const requestedSkill = required("AGENTMAILER_PEER_SKILL");
  if (!card.skills.some(({ id }) => id === requestedSkill)) {
    throw new Error(`${handle} does not advertise skill ${requestedSkill}`);
  }
  const response = await client.a2A.sendTask(handle, {
    jsonrpc: "2.0",
    id: randomUUID(),
    method: "message/send",
    params: { message: { messageId: randomUUID(), role: "ROLE_USER", parts: [
      { text: required("AGENTMAILER_TASK_TEXT"), metadata: { requestedSkill } },
    ] } },
  });
  console.dir(response, { depth: null });
}

function required(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) throw new Error(`${name} is required`);
  return value;
}
