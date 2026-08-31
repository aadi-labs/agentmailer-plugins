import { AgentMailerClient } from "@agentmailer/sdk";

const client = new AgentMailerClient({ apiKey: process.env.AGENTMAILER_API_KEY });
const podId = process.env.AGENTMAILER_POD_ID;
if (!podId) throw new Error("AGENTMAILER_POD_ID is required");

const { lists } = await client.lists.list({ pod_id: podId });
console.table(
  lists.map(({ id, name, kind, entries }) => ({
    id,
    name,
    kind,
    entries: entries.length,
  })),
);

// Mutations require explicit opt-in and a human-selected pattern.
if (process.env.ADD_LIST_ENTRY_EXAMPLE === "1") {
  const listId = process.env.AGENTMAILER_LIST_ID;
  const addressPattern = process.env.AGENTMAILER_ADDRESS_PATTERN;
  if (!listId || !addressPattern) {
    throw new Error("AGENTMAILER_LIST_ID and AGENTMAILER_ADDRESS_PATTERN are required");
  }
  const { list } = await client.lists.addEntry(listId, {
    addressPattern,
    note: "Added by an explicitly approved governance workflow",
  });
  console.log(list.id, list.entries.length);
}
