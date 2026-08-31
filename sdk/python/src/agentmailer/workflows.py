from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable, Optional

from .client import AgentMailer
from .types import A2AAgentCard, Inbox, Message


@dataclass(frozen=True)
class EnsureInboxRequest:
    username: str
    pod_id: Optional[str] = None
    domain_id: Optional[str] = None
    client_id: Optional[str] = None
    display_name: Optional[str] = None


class AgentMailerWorkflows:
    """Read-first, retry-safe workflows over the generated endpoint clients."""

    def __init__(self, client: AgentMailer):
        self.client = client

    def list_all_inboxes(self) -> list[Inbox]:
        inboxes: list[Inbox] = []
        page_token: Optional[str] = None
        while True:
            page = self.client.inboxes.list(limit=100, page_token=page_token)
            inboxes.extend(page.inboxes)
            page_token = page.next_page_token
            if not page_token:
                return inboxes

    def ensure_inbox(self, request: EnsureInboxRequest) -> Inbox:
        expected_local_part = request.username.lower()
        for inbox in self.list_all_inboxes():
            local_part = inbox.address.split("@", 1)[0].lower()
            same_client = bool(request.client_id and inbox.client_id == request.client_id)
            same_address = local_part == expected_local_part and (
                not request.pod_id or inbox.pod_id == request.pod_id
            )
            if same_client or same_address:
                return inbox

        return self.client.inboxes.create(
            username=request.username,
            pod_id=request.pod_id,
            domain_id=request.domain_id,
            client_id=request.client_id,
            display_name=request.display_name,
        ).inbox

    def send_text(self, *, inbox_id: str, to: str | Iterable[str], subject: str, text: str) -> Message:
        recipients = [to] if isinstance(to, str) else list(to)
        return self.client.messages.send(
            inbox_id,
            to=recipients,
            subject=subject,
            text=text,
        ).message

    def discover_agent(self, handle: str) -> A2AAgentCard:
        return self.client.a2a.get_agent_card(handle)
