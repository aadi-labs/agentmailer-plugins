import os
import re

from agentmailer import AgentMailer


def required(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"{name} is required")
    return value


client = AgentMailer(api_key=required("AGENTMAILER_API_KEY"))
inbox_id = required("AGENTMAILER_INBOX_ID")
messages = client.messages.list(inbox_id, limit=25).messages
inbound = [message for message in messages if message.direction == "inbound"]

for message in inbound:
    content = f"{message.subject}\n{message.extracted_text or message.text or ''}"
    priority = "high" if re.search(
        r"urgent|outage|security|cannot access|billing", content, re.I
    ) else "normal"
    print(f"[{priority}] {message.id}: {message.subject}")

if os.environ.get("CREATE_DRAFT_EXAMPLE") == "1":
    message_id = required("AGENTMAILER_MESSAGE_ID")
    source = next((message for message in inbound if message.id == message_id), None)
    if source is None:
        raise RuntimeError("Message is not in the latest inbound page")
    draft = client.drafts.create(
        inbox_id,
        reply_to_message_id=source.id,
        subject=f"Re: {source.subject}",
        text="Thanks for contacting us. A human support owner will review the next step.",
    ).draft
    print(f"Created reviewable draft {draft.id}; it has not been sent.")
