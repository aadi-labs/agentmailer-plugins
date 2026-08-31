import assert from "node:assert/strict";
import { createHmac } from "node:crypto";
import test from "node:test";
import { verifyWebhookSignature } from "./webhook-signature.js";

const now = new Date("2026-08-31T12:00:00Z");
const timestamp = String(Math.floor(now.getTime() / 1000));
const payload = JSON.stringify({ id: "evt_example", type: "message.received" });
const secretBytes = Buffer.from("example signing secret with enough entropy");
const secret = `whsec_${secretBytes.toString("base64")}`;
const signature = createHmac("sha256", secretBytes)
  .update(`msg_example.${timestamp}.${payload}`).digest("base64");

test("accepts valid signatures and rejects tampering", () => {
  assert.doesNotThrow(() => verifyWebhookSignature({
    payload, secret, id: "msg_example", timestamp, signature: `v1,${signature}`, now,
  }));
  assert.throws(() => verifyWebhookSignature({
    payload: `${payload} `, secret, id: "msg_example", timestamp,
    signature: `v1,${signature}`, now,
  }));
});
