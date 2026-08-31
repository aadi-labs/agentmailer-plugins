import { AgentMailerClient } from "@agentmailer/sdk";

const client = new AgentMailerClient({ apiKey: required("AGENTMAILER_API_KEY") });
const inboxId = required("AGENTMAILER_INBOX_ID");
const { messages } = await client.messages.list(inboxId, { limit: 25 });
const inbound = messages.filter(({ direction }) => direction === "inbound");

for (const message of inbound) {
  const content = `${message.subject}\n${message.extractedText ?? message.text ?? ""}`;
  const priority = /urgent|outage|security|cannot access|billing/i.test(content)
    ? "high"
    : "normal";
  console.log(`[${priority}] ${message.id}: ${message.subject}`);
}

if (process.env.CREATE_DRAFT_EXAMPLE === "1") {
  const source = inbound.find(({ id }) => id === required("AGENTMAILER_MESSAGE_ID"));
  if (!source) throw new Error("Message is not in the latest inbound page");
  const { draft } = await client.drafts.create(inboxId, {
    replyToMessageId: source.id,
    subject: `Re: ${source.subject}`,
    text: "Thanks for contacting us. A human support owner will review the next step.",
  });
  console.log(`Created reviewable draft ${draft.id}; it has not been sent.`);
}

function required(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) throw new Error(`${name} is required`);
  return value;
}
