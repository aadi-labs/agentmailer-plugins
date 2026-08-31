import { readFile, writeFile } from "node:fs/promises";
import { resolve } from "node:path";

const cliRoot = resolve("cli");
const cargoPath = resolve(cliRoot, "Cargo.toml");
const readmePath = resolve(cliRoot, "README.md");
const mainPath = resolve(cliRoot, "cli/agentmailer/main.rs");

const replaceRequired = (source, from, to, label) => {
  if (source.includes(to)) return source;
  if (!source.includes(from)) {
    throw new Error(`Unable to post-process ${label}; expected content is missing`);
  }
  return source.replace(from, to);
};

let cargo = await readFile(cargoPath, "utf8");
cargo = cargo.replace(
  'repository = "https://github.com/aadi-labs/agentmailer-cli"',
  'repository = "https://github.com/aadi-labs/agentmailer-plugins"',
);
cargo = replaceRequired(
  cargo,
  'name = "fern-cli-sdk"',
  'name = "agentmailer-cli"',
  "Cargo package name",
);
cargo = replaceRequired(
  cargo,
  'version = "0.0.0"',
  'version = "0.1.0"',
  "Cargo package version",
);
cargo = replaceRequired(
  cargo,
  'description = "CLI generator — dynamic command surface from OpenAPI and GraphQL schemas"',
  'description = "Official command-line interface for AgentMailer"',
  "Cargo description",
);
cargo = replaceRequired(
  cargo,
  'repository = "https://github.com/fern-api/cli-sdk"',
  'repository = "https://github.com/aadi-labs/agentmailer-plugins"',
  "Cargo repository",
);
cargo = replaceRequired(
  cargo,
  'homepage = "https://github.com/fern-api/cli-sdk"',
  'homepage = "https://agentmailer.ai"',
  "Cargo homepage",
);
cargo = replaceRequired(
  cargo,
  'authors = ["Fern <hey@buildwithfern.com>"]',
  'authors = ["Aadi Labs <support@agentmailer.ai>"]',
  "Cargo authors",
);
cargo = replaceRequired(
  cargo,
  'keywords = ["cli", "openapi", "graphql", "fern", "codegen"]',
  'keywords = ["agent", "email", "a2a", "inbox", "cli"]',
  "Cargo keywords",
);
await writeFile(cargoPath, cargo);

let readme = await readFile(readmePath, "utf8");
readme = readme
  .replaceAll("https://github.com/<org>/<repo>", "https://github.com/aadi-labs/agentmailer-plugins")
  .replaceAll("https://github.com/aadi-labs/agentmailer-cli", "https://github.com/aadi-labs/agentmailer-plugins")
  .replaceAll("fern-cli-sdk-installer", "agentmailer-cli-installer")
  .replaceAll("AGENTMAILER_TOKEN", "AGENTMAILER_API_KEY");
readme = replaceRequired(
  readme,
  "## Installation\n",
  "## Installation\n\n> Prebuilt installers become available after the first GitHub release. Until then, build the CLI from source below.\n",
  "CLI prerelease installation notice",
);
readme = replaceRequired(
  readme,
  `List available commands:

\`\`\`bash
agentmailer --help
\`\`\`

Call an API endpoint:

\`\`\`bash
agentmailer <resource> <method>
\`\`\`

Run \`agentmailer <resource> --help\` to see available methods for a resource.`,
  `Start with a read-only request:

\`\`\`bash
agentmailer inboxes list --limit 10 --format table
\`\`\`

Preview a write without sending it:

\`\`\`bash
agentmailer messages send \\
  --inbox-id inb_REPLACE_ME \\
  --json '{"to":["recipient@example.com"],"subject":"Hello","text":"Sent with AgentMailer."}' \\
  --dry-run
\`\`\`

Run \`agentmailer <resource> --help\` for flags and \`agentmailer --help --format json\` for the machine-readable operation catalog.`,
  "CLI quick start",
);
await writeFile(readmePath, readme);

let main = await readFile(mainPath, "utf8");
main = main.replaceAll("AGENTMAILER_TOKEN", "AGENTMAILER_API_KEY");
await writeFile(mainPath, main);

const bindingPath = resolve(cliRoot, "src/openapi/binding.rs");
let binding = await readFile(bindingPath, "utf8");
binding = replaceRequired(
  binding,
  '        OpenApiBinding::default().command_namespace("auth");',
  '        let _ = OpenApiBinding::default().command_namespace("auth");',
  "CLI generated warning cleanup",
);
await writeFile(bindingPath, binding);

let gitignore = await readFile(resolve(cliRoot, ".gitignore"), "utf8");
for (const pattern of [".DS_Store", ".env", ".env.*", "!.env.example"]) {
  if (!gitignore.split("\n").includes(pattern)) gitignore += `${pattern}\n`;
}
await writeFile(resolve(cliRoot, ".gitignore"), gitignore);
await writeFile(resolve(cliRoot, ".env.example"), "AGENTMAILER_API_KEY=\n");

const lockPath = resolve(cliRoot, "Cargo.lock");
let lock = await readFile(lockPath, "utf8");
lock = replaceRequired(
  lock,
  'name = "fern-cli-sdk"\nversion = "0.0.0"',
  'name = "agentmailer-cli"\nversion = "0.1.0"',
  "Cargo lock package identity",
);
await writeFile(lockPath, lock);

console.log("Applied AgentMailer package, repository, and authentication metadata to the generated CLI.");
