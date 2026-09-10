import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const read = (path) =>
  JSON.parse(readFileSync(new URL(`../${path}`, import.meta.url), "utf8"));

test("published clients expose email and A2A without retired phone channels", () => {
  const spec = read("fern/openapi/openapi.json");
  const paths = Object.keys(spec.paths);
  assert.ok(paths.some((path) => path.includes("inboxes")));
  assert.ok(paths.some((path) => path.includes("/a2a/")));
  for (const path of paths)
    assert.doesNotMatch(path, /channel|phone|imessage|whatsapp/i);
  for (const name of Object.keys(spec.components.schemas)) {
    assert.doesNotMatch(
      name,
      /ChannelEndpoint|ChannelMessage|PhoneOrder|Imessage|Whatsapp/i,
    );
  }
  assert.deepEqual(read("cli/cli/agentmailer/openapi0.json"), spec);
});
