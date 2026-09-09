// One-time migration of the public marketing content module, not private docs/.
// Run with Node's --experimental-strip-types flag and the exact source path.
import { mkdirSync, writeFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const source = process.argv[2];
if (
  !source ||
  !path.resolve(source).endsWith("/platform/app/_content/marketing.ts")
) {
  throw new Error(
    "Pass the exact public platform/app/_content/marketing.ts path; private docs are never imported.",
  );
}
const { guides, integrations, useCases } = await import(
  pathToFileURL(path.resolve(source)).href
);
const pages = [];
function page(section, slug, title, description, body, originalUrl) {
  const relative = `pages/platform/${section}/${slug}.mdx`;
  const target = path.join(root, "fern", relative);
  mkdirSync(path.dirname(target), { recursive: true });
  writeFileSync(
    target,
    `---\ntitle: ${JSON.stringify(title)}\ndescription: ${JSON.stringify(description)}\n---\n\n${description}\n\n${body.trim()}\n`,
  );
  pages.push({ section, title, path: relative, originalUrl });
}
for (const guide of guides) {
  const body = [
    "## Direct answer",
    guide.answer,
    ...guide.sections.flatMap((s) => [
      `## ${s.heading}`,
      ...s.paragraphs,
      ...(s.bullets ? [s.bullets.map((b) => `- ${b}`).join("\n")] : []),
    ]),
    "## Frequently asked questions",
    ...guide.faq.flatMap((f) => [`### ${f.question}`, f.answer]),
  ].join("\n\n");
  page(
    "guides",
    guide.slug,
    guide.title,
    guide.description,
    body,
    `https://agentmailer.ai/blog/${guide.slug}`,
  );
}
for (const integration of integrations) {
  page(
    "integrations",
    integration.slug,
    `${integration.name} integration`,
    integration.description,
    `## Connect\n\n\`\`\`text\n${integration.command}\n\`\`\`\n\nAdd https://api.agentmailer.ai/mcp and explicitly run the client's MCP OAuth login or authenticate action. Complete human approval, then call \`auth_me\` to verify the connection. Adding a server URL alone does not log in.\n\nCall \`list_inboxes\` and reuse the intended identity when possible. Create a new inbox only when needed and with a stable idempotency key. Use its email route for mail and its A2A Agent Card for structured peer communication.\n\nFor direct REST access or agent signup, follow [auth.md](https://api.agentmailer.ai/auth.md) exactly.\n\nSee the [original client-specific setup](https://agentmailer.ai/build/${integration.slug}) for additional configuration details and [official skills and examples](https://github.com/aadi-labs/agentmailer-plugins).`,
    `https://agentmailer.ai/build/${integration.slug}`,
  );
}
for (const useCase of useCases) {
  page(
    "use-cases",
    useCase.slug,
    useCase.title,
    useCase.description,
    `## Problem\n\n${useCase.problem}\n\n## Workflow\n\n${useCase.workflow.map((step, i) => `${i + 1}. ${step}`).join("\n")}\n\nAgentMailer supplies the communication substrate. Your runtime owns model execution, application state, schedules, and business approvals. Check the [examples catalog](https://github.com/aadi-labs/agentmailer-plugins/tree/main/examples) for Python and TypeScript implementations.`,
    `https://agentmailer.ai/use-cases/${useCase.slug}`,
  );
}
writeFileSync(
  path.join(root, "fern/platform-pages.json"),
  JSON.stringify(pages, null, 2) + "\n",
);
console.log(
  `Imported ${pages.length} public guides, integrations, and use cases; no private runbooks were read.`,
);
