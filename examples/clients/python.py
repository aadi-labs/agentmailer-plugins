import os

from agentmailer import AgentMailer


client = AgentMailer(api_key=os.environ["AGENTMAILER_API_KEY"])
response = client.inboxes.list(limit=10)

for inbox in response.inboxes:
    print(inbox.id, inbox.address, inbox.status)

# Sending is intentionally explicit. Replace the recipient before enabling it.
if os.environ.get("SEND_EXAMPLE") == "1":
    if not response.inboxes:
        raise RuntimeError("Create an inbox before sending email")

    result = client.messages.send(
        response.inboxes[0].id,
        to=["recipient@example.com"],
        subject="Hello from AgentMailer",
        text="Sent with the AgentMailer Python SDK.",
    )
    print(result.message.id, result.message.status)
