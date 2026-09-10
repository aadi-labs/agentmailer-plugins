import { readFile, writeFile, mkdir } from "node:fs/promises";
import { resolve } from "node:path";

const SOURCE_URL =
  process.env.AGENTMAILER_OPENAPI_URL ??
  "https://api.agentmailer.ai/openapi.json";
const SOURCE_FILE = process.env.AGENTMAILER_OPENAPI_FILE;
const OUTPUT = resolve("fern/openapi/openapi.json");
const CHECK = process.argv.includes("--check");
const sourceLabel = SOURCE_FILE ? resolve(SOURCE_FILE) : SOURCE_URL;

const operations = {
  "POST /v1/agent/bootstrap": ["agent", "bootstrap"],
  "POST /v1/agent/sign-up": ["agent", "signUp"],
  "GET /v1/inboxes": ["inboxes", "list"],
  "POST /v1/inboxes": ["inboxes", "create"],
  "GET /v1/inboxes/{inboxId}": ["inboxes", "get"],
  "PATCH /v1/inboxes/{inboxId}": ["inboxes", "update"],
  "DELETE /v1/inboxes/{inboxId}": ["inboxes", "delete"],
  "POST /v1/inboxes/{inboxId}/credentials": ["inboxes", "issueCredentials"],
  "GET /v1/inboxes/{inboxId}/messages": ["messages", "list"],
  "POST /v1/inboxes/{inboxId}/messages/send": ["messages", "send"],
  "GET /v1/inboxes/{inboxId}/messages/{messageId}": ["messages", "get"],
  "DELETE /v1/inboxes/{inboxId}/messages/{messageId}": ["messages", "delete"],
  "POST /v1/inboxes/{inboxId}/messages/{messageId}/reply": [
    "messages",
    "reply",
  ],
  "POST /v1/inboxes/{inboxId}/messages/{messageId}/reply-all": [
    "messages",
    "replyAll",
  ],
  "POST /v1/inboxes/{inboxId}/messages/{messageId}/forward": [
    "messages",
    "forward",
  ],
  "GET /v1/inboxes/{inboxId}/threads": ["threads", "list"],
  "GET /v1/inboxes/{inboxId}/threads/{threadId}": ["threads", "get"],
  "GET /v1/inboxes/{inboxId}/drafts": ["drafts", "list"],
  "POST /v1/inboxes/{inboxId}/drafts": ["drafts", "create"],
  "GET /v1/inboxes/{inboxId}/drafts/{draftId}": ["drafts", "get"],
  "PATCH /v1/inboxes/{inboxId}/drafts/{draftId}": ["drafts", "update"],
  "DELETE /v1/inboxes/{inboxId}/drafts/{draftId}": ["drafts", "delete"],
  "POST /v1/inboxes/{inboxId}/drafts/{draftId}/send": ["drafts", "send"],
  "POST /v1/inboxes/{inboxId}/attachments": ["attachments", "upload"],
  "POST /v1/inboxes/{inboxId}/attachments/{attachmentId}/complete": [
    "attachments",
    "complete",
  ],
  "GET /v1/inboxes/{inboxId}/attachments/{attachmentId}/download": [
    "attachments",
    "download",
  ],
  "GET /v1/pods": ["pods", "list"],
  "POST /v1/pods": ["pods", "create"],
  "GET /v1/pods/{podId}": ["pods", "get"],
  "PATCH /v1/pods/{podId}": ["pods", "update"],
  "DELETE /v1/pods/{podId}": ["pods", "delete"],
  "GET /v1/domains": ["domains", "list"],
  "POST /v1/domains": ["domains", "create"],
  "GET /v1/domains/{domainId}": ["domains", "get"],
  "POST /v1/domains/{domainId}/verify": ["domains", "verify"],
  "DELETE /v1/domains/{domainId}": ["domains", "delete"],
  "GET /v1/webhooks": ["webhooks", "list"],
  "POST /v1/webhooks": ["webhooks", "create"],
  "GET /v1/webhooks/{webhookId}": ["webhooks", "get"],
  "PATCH /v1/webhooks/{webhookId}": ["webhooks", "update"],
  "DELETE /v1/webhooks/{webhookId}": ["webhooks", "delete"],
  "POST /v1/webhooks/{webhookId}/rotate-secret": [
    "webhooks",
    "rotateSecret",
  ],
  "GET /v1/labels": ["labels", "list"],
  "POST /v1/labels": ["labels", "create"],
  "DELETE /v1/labels/{labelId}": ["labels", "delete"],
  "PATCH /v1/messages/{messageId}/labels": ["labels", "updateMessage"],
  "PATCH /v1/threads/{threadId}/labels": ["labels", "updateThread"],
  "GET /v1/lists": ["lists", "list"],
  "POST /v1/lists": ["lists", "create"],
  "DELETE /v1/lists/{listId}": ["lists", "delete"],
  "POST /v1/lists/{listId}/entries": ["lists", "addEntry"],
  "DELETE /v1/lists/{listId}/entries": ["lists", "removeEntry"],
  "POST /v1/events/tickets": ["events", "createTicket"],
  "GET /v1/billing": ["billing", "get"],
  "POST /v1/billing/checkout": ["billing", "createCheckout"],
  "POST /v1/billing/portal": ["billing", "createPortal"],
  "POST /a2a/{handle}": ["a2a", "sendTask"],
  "GET /a2a/{handle}/.well-known/agent-card.json": ["a2a", "getAgentCard"],
  "POST /v1/a2a/tasks/{taskId}": ["a2a", "updateTask"],
  "PATCH /v1/a2a/identity": ["a2a", "updateIdentity"],
};

const document = SOURCE_FILE
  ? JSON.parse(await readFile(resolve(SOURCE_FILE), "utf8"))
  : await fetch(SOURCE_URL, { headers: { accept: "application/json" } }).then(
      async (response) => {
        if (!response.ok) {
          throw new Error(
            `Unable to fetch AgentMailer OpenAPI: ${response.status} ${response.statusText}`,
          );
        }
        return response.json();
      },
    );
if (document.openapi !== "3.1.0" || document.info?.title !== "AgentMailer API") {
  throw new Error(
    "The fetched document is not the expected AgentMailer OpenAPI 3.1 contract",
  );
}

const discovered = new Set();
for (const [path, pathItem] of Object.entries(document.paths ?? {})) {
  for (const method of ["get", "post", "put", "patch", "delete"]) {
    const operation = pathItem?.[method];
    if (!operation) continue;
    const key = `${method.toUpperCase()} ${path}`;
    if (key === "POST /mcp") {
      operation["x-fern-ignore"] = true;
      continue;
    }
    const naming = operations[key];
    if (!naming) throw new Error(`Missing SDK naming metadata for ${key}`);
    const [group, name] = naming;
    operation.operationId = `${group}_${name}`;
    operation.tags = [group];
    operation["x-fern-sdk-group-name"] = group;
    operation["x-fern-sdk-method-name"] = name;
    discovered.add(key);
  }
}

const staleMappings = Object.keys(operations).filter((key) => !discovered.has(key));
if (staleMappings.length > 0) {
  throw new Error(`SDK mappings no longer exist: ${staleMappings.join(", ")}`);
}

document.info["x-generated-by"] = "scripts/sync-openapi.mjs";
const serialized = `${JSON.stringify(document, null, 2)}\n`;

if (CHECK) {
  const current = await readFile(OUTPUT, "utf8").catch(() => "");
  if (current !== serialized) {
    throw new Error("fern/openapi/openapi.json is stale; run pnpm sdk:sync");
  }
  console.log(`OpenAPI snapshot is current (${discovered.size} SDK operations).`);
} else {
  await mkdir(resolve("fern/openapi"), { recursive: true });
  await writeFile(OUTPUT, serialized);
  console.log(`Synced ${discovered.size} SDK operations from ${sourceLabel}.`);
}
