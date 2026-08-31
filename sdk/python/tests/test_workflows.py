from types import SimpleNamespace
from unittest.mock import Mock

from agentmailer.workflows import AgentMailerWorkflows, EnsureInboxRequest


def test_ensure_inbox_reuses_an_existing_identity() -> None:
    inbox = SimpleNamespace(
        address="triage@agentmailer.ai",
        client_id="customer-42",
        pod_id="pod_test",
    )
    client = SimpleNamespace(
        inboxes=SimpleNamespace(
            list=Mock(return_value=SimpleNamespace(inboxes=[inbox], next_page_token=None)),
            create=Mock(),
        )
    )

    result = AgentMailerWorkflows(client).ensure_inbox(
        EnsureInboxRequest(username="triage", client_id="customer-42")
    )

    assert result is inbox
    client.inboxes.create.assert_not_called()


def test_list_all_inboxes_follows_pagination() -> None:
    first = SimpleNamespace(address="first@agentmailer.ai")
    second = SimpleNamespace(address="second@agentmailer.ai")
    list_method = Mock(
        side_effect=[
            SimpleNamespace(inboxes=[first], next_page_token="next"),
            SimpleNamespace(inboxes=[second], next_page_token=None),
        ]
    )
    client = SimpleNamespace(inboxes=SimpleNamespace(list=list_method))

    assert AgentMailerWorkflows(client).list_all_inboxes() == [first, second]
    assert list_method.call_args_list[1].kwargs["page_token"] == "next"
