import { definePluginEntry } from "openclaw/plugin-sdk/plugin-entry";

export default definePluginEntry({
  id: "agentmailer",
  name: "AgentMailer",
  description:
    "Give every AI agent one human-approved identity with a persistent @agentmailer.ai address for email and direct communication with other agents.",
  register() {
    // Skills are declared statically in the manifest. Stable OpenClaw releases
    // configure the hosted MCP server through compat/openclaw/openclaw.json.
  },
});
