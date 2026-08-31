import base64
import hashlib
import hmac
import json
import os
import time
from http.server import BaseHTTPRequestHandler, HTTPServer


def verify(payload: bytes, message_id: str, timestamp: str, signature: str) -> None:
    timestamp_seconds = int(timestamp)
    if abs(int(time.time()) - timestamp_seconds) > 5 * 60:
        raise ValueError("Webhook timestamp is outside the replay window")
    encoded_secret = required("AGENTMAILER_WEBHOOK_SECRET").removeprefix("whsec_")
    secret = base64.b64decode(encoded_secret, validate=True)
    signed = f"{message_id}.{timestamp}.".encode() + payload
    expected = base64.b64encode(hmac.new(secret, signed, hashlib.sha256).digest()).decode()
    candidates = [part.split(",", 1)[1] for part in signature.split(" ")
                  if part.startswith("v1,")]
    if not any(hmac.compare_digest(candidate, expected) for candidate in candidates):
        raise ValueError("Invalid webhook signature")


def required(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"{name} is required")
    return value


class Handler(BaseHTTPRequestHandler):
    def do_POST(self) -> None:
        if self.path != "/webhooks/agentmailer":
            self.send_error(404)
            return
        payload = self.rfile.read(int(self.headers.get("content-length", "0")))
        try:
            verify(payload, self.headers["svix-id"], self.headers["svix-timestamp"],
                   self.headers["svix-signature"])
            event = json.loads(payload)
            print(event["id"], event["type"], event.get("data"))
            self.send_response(204)
            self.end_headers()
        except (KeyError, TypeError, ValueError) as error:
            print("Rejected unsigned or malformed webhook", error)
            self.send_error(400, "invalid webhook")


if __name__ == "__main__":
    port = int(os.environ.get("PORT", "8787"))
    print(f"Listening on http://127.0.0.1:{port}/webhooks/agentmailer")
    HTTPServer(("127.0.0.1", port), Handler).serve_forever()
