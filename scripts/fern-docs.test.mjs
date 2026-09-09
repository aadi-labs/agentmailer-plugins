import assert from "node:assert/strict";
import { readFileSync, existsSync, readdirSync } from "node:fs";
import { execFileSync } from "node:child_process";
import { fileURLToPath } from "node:url";
import path from "node:path";
import test from "node:test";
import { fernOpenApi } from "./fern-openapi.mjs";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
test("custom domain survives documentation generation", () => {
  for (const file of ["docs.template.yml", "docs.yml"]) {
    assert.match(
      readFileSync(path.join(root, "fern", file), "utf8"),
      /instances:\n  - url: agentmailer\.docs\.buildwithfern\.com\n    custom-domain: docs\.agentmailer\.ai\n/,
    );
  }
});
test("Fern renders the page title once and both themes have a logo", () => {
  for (const file of readdirSync(path.join(root, "fern/pages"), {
    recursive: true,
  }).filter((file) => file.endsWith(".mdx"))) {
    const prose = readFileSync(
      path.join(root, "fern/pages", file),
      "utf8",
    ).replace(/^```[^\n]*\n[\s\S]*?^```\s*$/gm, "");
    assert.doesNotMatch(prose, /^# /m, file);
  }
  for (const theme of ["light", "dark"]) {
    assert.match(
      readFileSync(path.join(root, `fern/assets/logo-${theme}.svg`), "utf8"),
      /aria-label="AgentMailer"/,
    );
  }
});
test("documentation generation is deterministic and every migrated source exists", () => {
  execFileSync(process.execPath, ["scripts/build-fern-docs.mjs", "--check"], {
    cwd: root,
  });
  const manifest = JSON.parse(
    readFileSync(path.join(root, "fern/migration-manifest.json"), "utf8"),
  );
  assert.ok(manifest.length > 50);
  assert.equal(
    new Set(manifest.map((p) => p.destination)).size,
    manifest.length,
  );
  for (const entry of manifest) {
    assert.ok(existsSync(path.join(root, entry.source)));
    const body = readFileSync(path.join(root, entry.destination), "utf8");
    assert.ok(body.startsWith("---\ntitle:"));
    assert.doesNotMatch(body, /\]\((?:\.\.\/|\.\/|references\/)/);
  }
});
test("quickstart explicitly logs in and treats email and A2A as peers", () => {
  const body = readFileSync(
    path.join(root, "fern/pages/quickstart.mdx"),
    "utf8",
  );
  assert.match(body, /codex mcp login agentmailer/);
  assert.match(body, /claude mcp login agentmailer/);
  assert.match(body, /auth_me/);
  assert.match(body, /send_a2a_message/);
  assert.match(body, /human approval/);
});
test("all public platform guides and integration pages are present", () => {
  const pages = JSON.parse(
    readFileSync(path.join(root, "fern/platform-pages.json"), "utf8"),
  );
  assert.equal(pages.filter((p) => p.section === "guides").length, 8);
  assert.equal(pages.filter((p) => p.section === "integrations").length, 9);
  assert.equal(pages.filter((p) => p.section === "use-cases").length, 6);
  for (const entry of pages) {
    assert.ok(entry.originalUrl.startsWith("https://agentmailer.ai/"));
    assert.ok(
      readFileSync(path.join(root, "fern", entry.path), "utf8").includes(
        entry.title,
      ),
    );
  }
});
test("embedded definitions are namespaced, recursive references survive, and input is untouched", () => {
  const schema = () => ({
    properties: { data: { $ref: "#/$defs/value" } },
    $defs: {
      value: {
        anyOf: [
          { type: "string" },
          { type: "array", items: { $ref: "#/$defs/value" } },
        ],
      },
    },
  });
  const input = { components: { schemas: { A: schema(), B: schema() } } };
  const result = fernOpenApi(input).components.schemas;
  assert.equal(result.A.properties.data.$ref, "#/components/schemas/A_value");
  assert.equal(result.B.properties.data.$ref, "#/components/schemas/B_value");
  assert.equal(
    result.A_value.anyOf[1].items.$ref,
    "#/components/schemas/A_value",
  );
  assert.ok(input.components.schemas.A.$defs);
  assert.equal(result.A.$defs, undefined);
});
test("normalization fails closed for missing or colliding definitions", () => {
  assert.throws(
    () =>
      fernOpenApi({
        components: {
          schemas: { A: { $ref: "#/$defs/missing", $defs: { x: {} } } },
        },
      }),
    /Unresolved/,
  );
  assert.throws(
    () =>
      fernOpenApi({
        components: { schemas: { A: { $defs: { x: {} } }, A_x: {} } },
      }),
    /collision/,
  );
});
test("normalized API preserves operations and resolves every local JSON reference", () => {
  const input = JSON.parse(
    readFileSync(path.join(root, "fern/openapi/openapi.json"), "utf8"),
  );
  const result = fernOpenApi(input);
  assert.deepEqual(result.paths, input.paths);
  const walk = (value) => {
    if (!value || typeof value !== "object") return;
    if (typeof value.$ref === "string" && value.$ref.startsWith("#/")) {
      let target = result;
      for (const token of value.$ref.slice(2).split("/"))
        target = target?.[token.replace(/~1/g, "/").replace(/~0/g, "~")];
      assert.notEqual(target, undefined, value.$ref);
    }
    for (const child of Object.values(value)) walk(child);
  };
  walk(result);
});
