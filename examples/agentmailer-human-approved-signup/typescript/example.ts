import { AgentMailerClient } from "@agentmailer/sdk";

const client = new AgentMailerClient();
const request = await client.agent.signUp({
  human_email: required("AGENTMAILER_HUMAN_EMAIL"),
  username: required("AGENTMAILER_USERNAME"),
});
console.log(`Requested ${request.requestedEmailAddress}`);
console.log(`Status: ${request.status}`);
console.log(`Human approval: ${request.approvalUrl}`);
console.log("Stop here until the named human has reviewed and approved access.");

function required(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) throw new Error(`${name} is required`);
  return value;
}
