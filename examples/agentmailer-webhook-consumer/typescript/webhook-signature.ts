import { createHmac, timingSafeEqual } from "node:crypto";

export interface WebhookSignatureInput {
  payload: string;
  secret: string;
  id: string;
  timestamp: string;
  signature: string;
  now?: Date;
}

export function verifyWebhookSignature(input: WebhookSignatureInput): void {
  const timestampSeconds = Number.parseInt(input.timestamp, 10);
  if (!Number.isSafeInteger(timestampSeconds)) throw new Error("Invalid timestamp");
  const nowSeconds = Math.floor((input.now ?? new Date()).getTime() / 1000);
  if (Math.abs(nowSeconds - timestampSeconds) > 5 * 60) {
    throw new Error("Webhook timestamp is outside the replay window");
  }
  const encodedSecret = input.secret.replace(/^whsec_/, "");
  const secret = Buffer.from(encodedSecret, "base64");
  if (!secret.length) throw new Error("Invalid webhook secret");
  const expected = createHmac("sha256", secret)
    .update(`${input.id}.${input.timestamp}.${input.payload}`)
    .digest();
  const valid = input.signature.split(" ").some((part) => {
    const [version, value] = part.split(",", 2);
    const candidate = Buffer.from(value ?? "", "base64");
    return version === "v1" && candidate.length === expected.length &&
      timingSafeEqual(candidate, expected);
  });
  if (!valid) throw new Error("Invalid webhook signature");
}
