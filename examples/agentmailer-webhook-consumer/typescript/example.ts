import { createServer } from "node:http";
import { verifyWebhookSignature } from "./webhook-signature.js";

const secret = required("AGENTMAILER_WEBHOOK_SECRET");
const port = Number.parseInt(process.env.PORT ?? "8787", 10);

createServer((request, response) => {
  if (request.method !== "POST" || request.url !== "/webhooks/agentmailer") {
    response.writeHead(404).end();
    return;
  }
  const chunks: Buffer[] = [];
  request.on("data", (chunk: Buffer) => chunks.push(chunk));
  request.on("end", () => {
    const payload = Buffer.concat(chunks).toString("utf8");
    try {
      verifyWebhookSignature({
        payload,
        secret,
        id: header(request.headers["svix-id"], "svix-id"),
        timestamp: header(request.headers["svix-timestamp"], "svix-timestamp"),
        signature: header(request.headers["svix-signature"], "svix-signature"),
      });
      const event = JSON.parse(payload) as { id: string; type: string; data: unknown };
      console.log(event.id, event.type, event.data);
      response.writeHead(204).end();
    } catch (error) {
      console.error("Rejected unsigned or malformed webhook", error);
      response.writeHead(400).end("invalid webhook");
    }
  });
}).listen(port, "127.0.0.1", () => {
  console.log(`Listening on http://127.0.0.1:${port}/webhooks/agentmailer`);
});

function required(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) throw new Error(`${name} is required`);
  return value;
}

function header(value: string | string[] | undefined, name: string): string {
  if (typeof value !== "string" || !value) throw new Error(`Missing ${name}`);
  return value;
}
