import { copyFile, readdir, readFile, rename, writeFile } from "node:fs/promises";
import { resolve } from "node:path";

const replaceRequired = (source, from, to, label) => {
  if (source.includes(to)) return source;
  if (!source.includes(from)) {
    throw new Error(`Unable to post-process ${label}; expected content is missing`);
  }
  return source.replace(from, to);
};

const license = await readFile(resolve("LICENSE"), "utf8");
const languages = ["typescript", "python", "rust", "ruby", "go", "swift"];
for (const sdk of languages) {
  await writeFile(resolve(`sdk/${sdk}/LICENSE`), license);
}

await copyFile(
  resolve("client-extensions/typescript/workflows.ts"),
  resolve("sdk/typescript/src/workflows.ts"),
);
await copyFile(
  resolve("client-extensions/python/workflows.py"),
  resolve("sdk/python/src/agentmailer/workflows.py"),
);
await copyFile(
  resolve("client-extensions/typescript/workflows.test.ts"),
  resolve("sdk/typescript/tests/workflows.test.ts"),
);
await copyFile(
  resolve("client-extensions/python/test_workflows.py"),
  resolve("sdk/python/tests/test_workflows.py"),
);

const typescriptIndexPath = resolve("sdk/typescript/src/index.ts");
let typescriptIndex = await readFile(typescriptIndexPath, "utf8");
if (!typescriptIndex.includes('./workflows.js')) {
  typescriptIndex += 'export { AgentMailerWorkflows } from "./workflows.js";\n';
  typescriptIndex += 'export type { EnsureInboxRequest, SendTextRequest } from "./workflows.js";\n';
}
await writeFile(typescriptIndexPath, typescriptIndex);

const pythonIndexPath = resolve("sdk/python/src/agentmailer/__init__.py");
let pythonIndex = await readFile(pythonIndexPath, "utf8");
if (!pythonIndex.includes("from .workflows import")) {
  pythonIndex +=
    "\nfrom .workflows import AgentMailerWorkflows, EnsureInboxRequest\n";
}
await writeFile(pythonIndexPath, pythonIndex);

const displayNames = {
  typescript: "TypeScript",
  python: "Python",
  rust: "Rust",
  ruby: "Ruby",
  go: "Go",
  swift: "Swift",
};
for (const sdk of languages) {
  const readmePath = resolve(`sdk/${sdk}/README.md`);
  let readme = await readFile(readmePath, "utf8");
  const language = displayNames[sdk];
  readme = readme
    .replace(`# AadiLabs ${language} Library`, `# AgentMailer ${language} SDK`)
    .replaceAll("AadiLabs%2F", "AgentMailer%2F")
    .replace(
      `The AadiLabs ${language} library provides convenient access to the AadiLabs APIs from ${language}.`,
      `The official ${language} SDK for AgentMailer: durable email inboxes and agent-to-agent communication for AI agents.`,
    );
  if (!readme.includes("Pre-release: generated clients are tested from source.")) {
    readme = readme.replace(
      "## Installation\n",
      "## Installation\n\n> Pre-release: generated clients are tested from source. Registry packages become available with the first SDK release.\n",
    );
  }
  await writeFile(readmePath, readme);
}

const replaceInFile = async (path, from, to, label) => {
  const source = await readFile(resolve(path), "utf8");
  await writeFile(resolve(path), replaceRequired(source, from, to, label));
};

await replaceInFile(
  "sdk/typescript/README.md",
  "await client.agent.bootstrap();",
  "const { inboxes } = await client.inboxes.list();\nconsole.log(inboxes);",
  "TypeScript quick start",
);
await replaceInFile(
  "sdk/python/README.md",
  "client.agent.bootstrap()",
  "response = client.inboxes.list()\nprint(response.inboxes)",
  "Python quick start",
);
await replaceInFile(
  "sdk/rust/README.md",
  `    client
        .agent
        .bootstrap(
            &BootstrapRequest {
                ..Default::default()
            },
            None,
        )
        .await;`,
  `    let response = client
        .inboxes
        .list(&InboxesListQueryRequest::default(), None)
        .await
        .expect("Failed to list inboxes");
    println!("{:?}", response.inboxes);`,
  "Rust quick start",
);
await replaceInFile(
  "sdk/ruby/README.md",
  "client.agent.bootstrap",
  "response = client.inboxes.list\nputs response.inboxes",
  "Ruby quick start",
);
await replaceInFile(
  "sdk/go/README.md",
  '    context "context"',
  '    context "context"\n    fmt "fmt"',
  "Go quick start imports",
);
await replaceInFile(
  "sdk/go/README.md",
  `    request := &_go.BootstrapRequest{}
    client.Agent.Bootstrap(
        context.TODO(),
        request,
    )`,
  `    response, err := client.Inboxes.List(
        context.TODO(),
        &_go.ListInboxesRequest{},
    )
    if err != nil {
        panic(err)
    }
    fmt.Println(response.Inboxes)`,
  "Go quick start",
);
await replaceInFile(
  "sdk/swift/README.md",
  '    .package(url: "<git-url>", from: "0.1.0"),',
  '    .package(url: "https://github.com/aadi-labs/agentmailer-plugins.git", from: "0.1.0"),',
  "Swift package URL",
);
await replaceInFile(
  "sdk/swift/README.md",
  "    _ = try await client.agent.bootstrap(request: .init())",
  "    let response = try await client.inboxes.list()\n    print(response.inboxes)",
  "Swift quick start",
);

const typescriptPath = resolve("sdk/typescript/package.json");
const typescript = JSON.parse(await readFile(typescriptPath, "utf8"));
typescript.repository = {
  type: "git",
  url: "https://github.com/aadi-labs/agentmailer-plugins.git",
  directory: "sdk/typescript",
};
typescript.homepage = "https://agentmailer.ai/docs";
typescript.bugs = {
  url: "https://github.com/aadi-labs/agentmailer-plugins/issues",
};
await writeFile(typescriptPath, `${JSON.stringify(typescript, null, 4)}\n`);

const pythonPath = resolve("sdk/python/pyproject.toml");
let python = await readFile(pythonPath, "utf8");
python = python.replace(
  'repository = "https://github.com/aadi-labs/agentmailer-sdk"',
  'repository = "https://github.com/aadi-labs/agentmailer-plugins"',
);
python = replaceRequired(
  python,
  'description = ""',
  'description = "Official Python SDK for the AgentMailer API."',
  "Python description",
);
python = replaceRequired(
  python,
  "authors = []",
  'authors = ["Aadi Labs <support@agentmailer.ai>"]\nlicense = "MIT"\nhomepage = "https://agentmailer.ai"\nrepository = "https://github.com/aadi-labs/agentmailer-plugins"',
  "Python package metadata",
);
python = replaceRequired(
  python,
  "keywords = []",
  'keywords = ["agent", "email", "inbox", "a2a", "agentmailer"]',
  "Python keywords",
);
await writeFile(pythonPath, python);

const rustPath = resolve("sdk/rust/Cargo.toml");
let rust = await readFile(rustPath, "utf8");
rust = rust.replace(
  /repository = "https:\/\/github\.com\/aadi-labs\/(?:agentmailer-sdk|agentmailer-plugins)"/,
  'repository = "https://github.com/aadi-labs/agentmailer-plugins"',
);
await writeFile(rustPath, rust);

const goPath = resolve("sdk/go/go.mod");
let go = await readFile(goPath, "utf8");
go = go.replace(
  "module github.com/aadi-labs/agentmailer-sdk/sdks/go",
  "module github.com/aadi-labs/agentmailer-plugins/sdk/go",
);
await writeFile(goPath, go);

const rewriteGoModuleReferences = async (directory) => {
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    const path = resolve(directory, entry.name);
    if (entry.isDirectory()) {
      await rewriteGoModuleReferences(path);
    } else if (entry.name.endsWith(".go") || entry.name.endsWith(".md")) {
      const source = await readFile(path, "utf8");
      const rewritten = source.replaceAll(
        "github.com/aadi-labs/agentmailer-sdk/sdks/go",
        "github.com/aadi-labs/agentmailer-plugins/sdk/go",
      );
      if (rewritten !== source) await writeFile(path, rewritten);
    }
  }
};
await rewriteGoModuleReferences(resolve("sdk/go"));

const rubyPath = resolve("sdk/ruby/custom.gemspec.rb");
let ruby = await readFile(rubyPath, "utf8");
ruby = ruby.replace(
  /def add_custom_gemspec_data\(spec\)[\s\S]*?\nend\n/,
  `def add_custom_gemspec_data(spec)\n  spec.name = "agentmailer"\n  spec.authors = ["Aadi Labs"]\n  spec.email = ["support@agentmailer.ai"]\n  spec.homepage = "https://agentmailer.ai"\n  spec.metadata["source_code_uri"] = "https://github.com/aadi-labs/agentmailer-plugins/tree/main/sdk/ruby"\n  spec.license = "MIT"\nend\n`,
);
await writeFile(rubyPath, ruby);
await writeFile(
  resolve("sdk/ruby/.fernignore"),
  "custom.gemspec.rb\n.fernignore\n",
);
// Fern emits `AgentMailer.rb`, but RubyGems consumers conventionally require
// `agentmailer`. Rename through a distinct temporary filename so the operation
// is reliable on both case-sensitive Linux and case-insensitive macOS volumes.
const rubyGeneratedEntrypoint = resolve("sdk/ruby/lib/AgentMailer.rb");
const rubyEntrypointTemporary = resolve(
  "sdk/ruby/lib/__agentmailer_entrypoint.rb",
);
const rubyEntrypoint = resolve("sdk/ruby/lib/agentmailer.rb");
await rename(rubyGeneratedEntrypoint, rubyEntrypointTemporary);
await rename(rubyEntrypointTemporary, rubyEntrypoint);

const rubyReadmePath = resolve("sdk/ruby/README.md");
const rubyReadme = (await readFile(rubyReadmePath, "utf8")).replaceAll(
  'require "AgentMailer"',
  'require "agentmailer"',
);
await writeFile(rubyReadmePath, rubyReadme);

let rubyGitignore = await readFile(resolve("sdk/ruby/.gitignore"), "utf8");
if (!rubyGitignore.split("\n").includes("*.gem")) rubyGitignore += "*.gem\n";
await writeFile(resolve("sdk/ruby/.gitignore"), rubyGitignore);

console.log("Applied AgentMailer publishing metadata to generated SDK manifests.");
