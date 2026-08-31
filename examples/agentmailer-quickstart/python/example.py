import os

from agentmailer import AgentMailer, AgentMailerWorkflows


def required(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"{name} is required")
    return value


client = AgentMailer(api_key=required("AGENTMAILER_API_KEY"))
workflows = AgentMailerWorkflows(client)
inboxes = workflows.list_all_inboxes()
for inbox in inboxes:
    print(inbox.id, inbox.address, inbox.status)

if os.environ.get("SEND_EXAMPLE") == "1":
    if not inboxes:
        raise RuntimeError("Create an inbox before sending the example")
    message = workflows.send_text(
        inbox_id=inboxes[0].id,
        to=required("AGENTMAILER_RECIPIENT"),
        subject="Hello from AgentMailer",
        text="This message was sent from the AgentMailer Python quickstart.",
    )
    print(f"Queued {message.id} with status {message.status}")
