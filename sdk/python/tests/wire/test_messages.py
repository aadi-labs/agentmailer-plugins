from .conftest import get_client, verify_request_count


def test_messages_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "messages.list_.0"
    client = get_client(test_id)
    client.messages.list(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/messages", None, 1)


def test_messages_send() -> None:
    """Test send endpoint with WireMock"""
    test_id = "messages.send.0"
    client = get_client(test_id)
    client.messages.send(
        inbox_id="inboxId",
        to=["to"],
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/messages/send", None, 1)


def test_messages_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "messages.get.0"
    client = get_client(test_id)
    client.messages.get(
        inbox_id="inboxId",
        message_id="messageId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/messages/messageId", None, 1)


def test_messages_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "messages.delete.0"
    client = get_client(test_id)
    client.messages.delete(
        inbox_id="inboxId",
        message_id="messageId",
    )
    verify_request_count(test_id, "DELETE", "/v1/inboxes/inboxId/messages/messageId", None, 1)


def test_messages_reply() -> None:
    """Test reply endpoint with WireMock"""
    test_id = "messages.reply.0"
    client = get_client(test_id)
    client.messages.reply(
        inbox_id="inboxId",
        message_id="messageId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/messages/messageId/reply", None, 1)


def test_messages_reply_all() -> None:
    """Test replyAll endpoint with WireMock"""
    test_id = "messages.reply_all.0"
    client = get_client(test_id)
    client.messages.reply_all(
        inbox_id="inboxId",
        message_id="messageId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/messages/messageId/reply-all", None, 1)


def test_messages_forward() -> None:
    """Test forward endpoint with WireMock"""
    test_id = "messages.forward.0"
    client = get_client(test_id)
    client.messages.forward(
        inbox_id="inboxId",
        message_id="messageId",
        to=["to"],
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/messages/messageId/forward", None, 1)
