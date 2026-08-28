import { definePluginEntry } from "openclaw/plugin-sdk/plugin-entry";

export default definePluginEntry({
  id: "agentmailer",
  name: "AgentMailer",
  description:
    "Give AI agents human-approved identities for email and structured A2A communication.",
  register() {
    // Skills and the hosted MCP server are declared statically in the manifest.
  },
});
