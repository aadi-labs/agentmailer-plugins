import os
import uuid

from agentmailer import AgentMailer, AgentMailerWorkflows


def required(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"{name} is required")
    return value


client = AgentMailer(api_key=required("AGENTMAILER_API_KEY"))
handle = required("AGENTMAILER_PEER_HANDLE")
card = AgentMailerWorkflows(client).discover_agent(handle)
print(f"{card.name}: {card.description}")
for skill in card.skills:
    print(skill.id, skill.name, skill.description)

if os.environ.get("SEND_A2A_EXAMPLE") == "1":
    requested_skill = required("AGENTMAILER_PEER_SKILL")
    if not any(skill.id == requested_skill for skill in card.skills):
        raise RuntimeError(f"{handle} does not advertise skill {requested_skill}")
    response = client.a2a.send_task(
        handle,
        jsonrpc="2.0",
        id=str(uuid.uuid4()),
        method="message/send",
        params={"message": {
            "messageId": str(uuid.uuid4()),
            "role": "ROLE_USER",
            "parts": [{
                "text": required("AGENTMAILER_TASK_TEXT"),
                "metadata": {"requestedSkill": requested_skill},
            }],
        }},
    )
    print(response)
