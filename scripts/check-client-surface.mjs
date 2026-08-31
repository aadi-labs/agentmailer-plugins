import { readFile } from "node:fs/promises";

const document = JSON.parse(
  await readFile(new URL("../fern/openapi/openapi.json", import.meta.url), "utf8"),
);

const operations = [];
for (const [path, pathItem] of Object.entries(document.paths ?? {})) {
  for (const method of ["get", "post", "put", "patch", "delete"]) {
    const operation = pathItem?.[method];
    if (!operation || operation["x-fern-ignore"] === true) continue;
    operations.push({
      key: `${method.toUpperCase()} ${path}`,
      group: operation["x-fern-sdk-group-name"],
      name: operation["x-fern-sdk-method-name"],
    });
  }
}

const minimumOperations = 60;
if (operations.length < minimumOperations) {
  throw new Error(
    `Client surface regressed to ${operations.length} operations; expected at least ${minimumOperations}`,
  );
}

const required = [
  "GET /v1/inboxes",
  "POST /v1/inboxes/{inboxId}/credentials",
  "POST /v1/inboxes/{inboxId}/messages/send",
  "GET /v1/inboxes/{inboxId}/attachments/{attachmentId}/download",
  "PATCH /v1/pods/{podId}",
  "POST /v1/domains/{domainId}/verify",
  "POST /v1/webhooks/{webhookId}/rotate-secret",
  "PATCH /v1/messages/{messageId}/labels",
  "POST /v1/lists/{listId}/entries",
  "GET /a2a/{handle}/.well-known/agent-card.json",
  "POST /v1/a2a/tasks/{taskId}",
];
const keys = new Set(operations.map(({ key }) => key));
const missing = required.filter((key) => !keys.has(key));
if (missing.length > 0) {
  throw new Error(`Required client operations are missing: ${missing.join(", ")}`);
}

for (const operation of operations) {
  if (!operation.group || !operation.name) {
    throw new Error(`SDK naming metadata is missing for ${operation.key}`);
  }
}

const groups = operations.reduce((counts, operation) => {
  counts.set(operation.group, (counts.get(operation.group) ?? 0) + 1);
  return counts;
}, new Map());

console.log(
  `Verified ${operations.length} client operations across ${groups.size} resource groups: ${[...groups.entries()]
    .sort(([left], [right]) => left.localeCompare(right))
    .map(([group, count]) => `${group}=${count}`)
    .join(", ")}`,
);
