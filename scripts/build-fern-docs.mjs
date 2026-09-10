import {
  readFileSync,
  writeFileSync,
  mkdirSync,
  readdirSync,
  existsSync,
} from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { fernOpenApi } from "./fern-openapi.mjs";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const check = process.argv.includes("--check");
const sections = [
  [
    "Connect",
    [
      "agentmailer-mcp",
      "agentmailer-sdk",
      "agentmailer-cli",
      "agentmailer-toolkit",
    ],
  ],
  [
    "Email",
    [
      "agentmailer-manage-inboxes",
      "agentmailer-check-email",
      "agentmailer-send-email",
      "agentmailer-email",
    ],
  ],
  ["Agent-to-agent communication", ["agentmailer-a2a"]],
  ["Events", ["agentmailer-events"]],
  ["Security and permissions", ["agentmailer-security"]],
];
const migrations = [];
const openapi = JSON.parse(
  readFileSync(path.join(root, "fern/openapi/openapi.json"), "utf8"),
);
let stale = false;
function output(relative, body) {
  const target = path.join(root, relative);
  if (existsSync(target) && readFileSync(target, "utf8") === body) return;
  if (check) {
    console.error(`Stale Fern documentation: ${relative}`);
    stale = true;
    return;
  }
  mkdirSync(path.dirname(target), { recursive: true });
  writeFileSync(target, body);
}
function page(source) {
  const original = readFileSync(path.join(root, source), "utf8");
  const body = original.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n/, "");
  const title = body.match(/^# (.+)$/m)?.[1];
  if (!title) throw new Error(`Missing title in ${source}`);
  // Resolve source-relative links against the public repository, never the local disk.
  const linked = body.replace(/\]\(([^\s)]+)\)/g, (match, href) => {
    if (/^(?:[a-z][a-z0-9+.-]*:|#|\/\/)/i.test(href)) return match;
    const resolved = path.posix.normalize(
      path.posix.join(path.posix.dirname(source), href),
    );
    if (resolved.startsWith("../"))
      throw new Error(`Link escapes repository: ${source}: ${href}`);
    return `](https://github.com/aadi-labs/agentmailer-plugins/blob/main/${resolved})`;
  });
  const destination = `fern/pages/generated/${source.replace(/\.md$/, ".mdx")}`;
  output(
    destination,
    `---\ntitle: ${JSON.stringify(title)}\n---\n\n{/* Generated from ${source}; run pnpm docs:build. */}\n${linked.replace(/^# [^\n]*\r?\n+/m, "").trim()}\n`,
  );
  migrations.push({ source, destination });
  return `          - page: ${JSON.stringify(title)}\n            path: ${destination.slice(5)}\n`;
}
let navigation = "";
for (const [title, skills] of sections) {
  navigation += `      - section: ${JSON.stringify(title)}\n        contents:\n`;
  for (const skill of skills) {
    navigation += page(`${skill}/SKILL.md`);
    const references = path.join(root, skill, "references");
    if (existsSync(references)) {
      for (const name of readdirSync(references)
        .filter((name) => name.endsWith(".md"))
        .sort()) {
        navigation += page(`${skill}/references/${name}`);
      }
    }
  }
}
navigation +=
  "      - section: Examples\n        contents:\n" + page("examples/README.md");
for (const dir of readdirSync(path.join(root, "examples"), {
  withFileTypes: true,
})
  .filter((entry) => entry.isDirectory())
  .sort((a, b) => a.name.localeCompare(b.name))) {
  if (existsSync(path.join(root, "examples", dir.name, "README.md")))
    navigation += page(`examples/${dir.name}/README.md`);
}
const template = readFileSync(
  path.join(root, "fern/docs.template.yml"),
  "utf8",
);
const platformIndex = path.join(root, "fern/platform-pages.json");
if (existsSync(platformIndex)) {
  const pages = JSON.parse(readFileSync(platformIndex, "utf8"));
  for (const [key, title] of [
    ["guides", "Concepts and architecture"],
    ["integrations", "Client integrations"],
    ["use-cases", "Use cases"],
  ]) {
    navigation += `      - section: ${JSON.stringify(title)}\n        contents:\n`;
    for (const entry of pages.filter((p) => p.section === key)) {
      if (!existsSync(path.join(root, "fern", entry.path)))
        throw new Error(`Missing migrated page: ${entry.path}`);
      navigation += `          - page: ${JSON.stringify(entry.title)}\n            path: ${entry.path}\n`;
    }
  }
}
if (!template.includes("# GENERATED_NAVIGATION"))
  throw new Error("Missing navigation insertion marker");
output(
  "fern/docs.yml",
  template.replace(/^[ \t]*# GENERATED_NAVIGATION\r?\n/m, navigation),
);
output(
  "fern/migration-manifest.json",
  JSON.stringify(migrations, null, 2) + "\n",
);
output(
  "fern/openapi/fern.openapi.json",
  JSON.stringify(fernOpenApi(openapi), null, 2) + "\n",
);
if (stale) process.exitCode = 1;
else
  console.log(
    `Fern documentation ${check ? "checked" : "built"}: ${migrations.length} public source documents.`,
  );
