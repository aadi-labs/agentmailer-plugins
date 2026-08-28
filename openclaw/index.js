import { definePluginEntry } from "openclaw/plugin-sdk/plugin-entry";

export default definePluginEntry({
  id: "agentmailer",
  name: "AgentMailer",
  description:
    "Give AI agents isolated email inboxes and safe workflows for reading, drafting, and sending mail.",
  register() {
    // Skills and the hosted MCP server are declared statically in the manifest.
  },
});
