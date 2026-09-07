import { test } from "node:test";
import assert from "node:assert/strict";
import { mkdtempSync, writeFileSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

test("generated SDK uses the repository's pinned package manager", () => {
  const manifest = (path) => JSON.parse(readFileSync(new URL(path, import.meta.url), "utf8"));
  assert.equal(manifest("../sdk/typescript/package.json").packageManager,
    manifest("../package.json").packageManager);
});

test("generates complete projects without invoking Fern packaging", () => {
  const directory = mkdtempSync(join(tmpdir(), "fern-script-test-"));
  const calls = join(directory, "calls");
  try {
    writeFileSync(
      join(directory, "docker"),
      '#!/bin/sh\ncase "$*" in *info*) printf "29.0.0\\n";; *) printf "unix:///test.sock\\n";; esac\n',
      { mode: 0o700 },
    );
    writeFileSync(
      join(directory, "pnpm"),
      '#!/bin/sh\nif [ -f "$TEST_CALLS" ]; then case "$*" in *--config.verify-deps-before-run=false*) ;; *) echo "workspace package missing during generation" >&2; exit 17;; esac; fi\ncase "$*" in *--package*) [ "$npm_config_legacy_peer_deps" = true ] || { echo "unexpected peer dependency installation" >&2; exit 18; };; esac\nprintf "%s\\n" "$*" >> "$TEST_CALLS"\n',
      { mode: 0o700 },
    );
    const result = spawnSync(
      "sh",
      [
        fileURLToPath(new URL("./generate-local.sh", import.meta.url)),
        "all-sdks",
      ],
      {
        encoding: "utf8",
        env: {
          ...process.env,
          PATH: `${directory}:${process.env.PATH}`,
          TEST_CALLS: calls,
          FERN_PACKAGE_MODE: "",
        },
      },
    );
    assert.equal(result.status, 0, result.stderr);
    const lines = readFileSync(calls, "utf8").trim().split("\n");
    assert.equal(lines.length, 1);
    assert.match(lines[0], /--generate-tests/);
    assert.match(lines[0], /--config.verify-deps-before-run=false/);
    assert.doesNotMatch(lines[0], /--package/);
  } finally {
    rmSync(directory, { recursive: true, force: true });
  }
});

test("does not start generators when Docker returns a successful but empty engine response", () => {
  const directory = mkdtempSync(join(tmpdir(), "fern-engine-test-"));
  const calls = join(directory, "calls");
  try {
    writeFileSync(
      join(directory, "docker"),
      '#!/bin/sh\ncase "$*" in *info*) exit 0;; *) printf "unix:///test.sock\\n";; esac\n',
      { mode: 0o700 },
    );
    writeFileSync(
      join(directory, "pnpm"),
      '#!/bin/sh\nprintf "started" > "$TEST_CALLS"\n',
      { mode: 0o700 },
    );
    const result = spawnSync(
      "sh",
      [fileURLToPath(new URL("./generate-local.sh", import.meta.url)), "all"],
      {
        encoding: "utf8",
        env: {
          ...process.env,
          PATH: `${directory}:${process.env.PATH}`,
          TEST_CALLS: calls,
        },
        timeout: 20000,
      },
    );
    assert.notEqual(result.status, 0);
    assert.match(result.stderr, /Docker engine is not ready/);
    assert.throws(() => readFileSync(calls), { code: "ENOENT" });
  } finally {
    rmSync(directory, { recursive: true, force: true });
  }
});
