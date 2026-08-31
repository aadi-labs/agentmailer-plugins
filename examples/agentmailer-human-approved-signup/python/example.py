import os

from agentmailer import AgentMailer


def required(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"{name} is required")
    return value


request = AgentMailer().agent.sign_up(
    human_email=required("AGENTMAILER_HUMAN_EMAIL"),
    username=required("AGENTMAILER_USERNAME"),
)
print(f"Requested {request.requested_email_address}")
print(f"Status: {request.status}")
print(f"Human approval: {request.approval_url}")
print("Stop here until the named human has reviewed and approved access.")
