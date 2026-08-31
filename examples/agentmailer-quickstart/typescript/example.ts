import { AgentMailerClient, AgentMailerWorkflows } from "@agentmailer/sdk";

const client = new AgentMailerClient({ apiKey: required("AGENTMAILER_API_KEY") });
const workflows = new AgentMailerWorkflows(client);
const inboxes = await workflows.listAllInboxes();
console.table(inboxes.map(({ id, address, status }) => ({ id, address, status })));

if (process.env.SEND_EXAMPLE === "1") {
  const inbox = inboxes.at(0);
  if (!inbox) throw new Error("Create an inbox before sending the example");
  const message = await workflows.sendText({
    inboxId: inbox.id,
    to: [required("AGENTMAILER_RECIPIENT")],
    subject: "Hello from AgentMailer",
    text: "This message was sent from the AgentMailer TypeScript quickstart.",
  });
  console.log(`Queued ${message.id} with status ${message.status}`);
}

function required(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) throw new Error(`${name} is required`);
  return value;
}
