import { readFile } from "node:fs/promises";

const expected = process.argv[2]?.replace(/^v/, "");
if (!expected || !/^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$/.test(expected)) {
  throw new Error("Pass a semantic version, for example: 0.1.0");
}

const files = [
  ["sdk/typescript/package.json", /"version":\s*"([^"]+)"/],
  ["sdk/python/pyproject.toml", /^version = "([^"]+)"/m],
  ["sdk/rust/Cargo.toml", /^version = "([^"]+)"/m],
  ["sdk/ruby/lib/AgentMailer/version.rb", /VERSION = "([^"]+)"/],
  ["cli/Cargo.toml", /^version = "([^"]+)"/m],
];

const mismatches = [];
for (const [path, pattern] of files) {
  const source = await readFile(path, "utf8");
  const actual = source.match(pattern)?.[1];
  if (actual !== expected) mismatches.push(`${path}: ${actual ?? "missing"}`);
}

if (mismatches.length > 0) {
  throw new Error(
    `Release version ${expected} is not synchronized:\n${mismatches.join("\n")}`,
  );
}
console.log(`All registry clients declare version ${expected}.`);
