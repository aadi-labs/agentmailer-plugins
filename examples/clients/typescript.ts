import { AgentMailerClient } from "@agentmailer/sdk";

const client = new AgentMailerClient({
  apiKey: process.env.AGENTMAILER_API_KEY,
});

const { inboxes } = await client.inboxes.list({ limit: 10 });
console.table(inboxes.map(({ id, address, status }) => ({ id, address, status })));

// Sending is intentionally explicit. Replace both addresses before enabling it.
if (process.env.SEND_EXAMPLE === "1") {
  const sender = inboxes.at(0);
  if (!sender) throw new Error("Create an inbox before sending email");

  const { message } = await client.messages.send(sender.id, {
    to: ["recipient@example.com"],
    subject: "Hello from AgentMailer",
    text: "Sent with the AgentMailer TypeScript SDK.",
  });
  console.log(message.id, message.status);
}
