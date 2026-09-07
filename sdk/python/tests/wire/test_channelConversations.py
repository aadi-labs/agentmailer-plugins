from .conftest import get_client, verify_request_count


def test_channelConversations_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "channel_conversations.list_.0"
    client = get_client(test_id)
    client.channel_conversations.list()
    verify_request_count(test_id, "GET", "/v1/channel-conversations", None, 1)


def test_channelConversations_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "channel_conversations.get.0"
    client = get_client(test_id)
    client.channel_conversations.get(
        conversation_id="conversationId",
    )
    verify_request_count(test_id, "GET", "/v1/channel-conversations/conversationId", None, 1)


def test_channelConversations_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "channel_conversations.update.0"
    client = get_client(test_id)
    client.channel_conversations.update(
        conversation_id="conversationId",
        status="active",
    )
    verify_request_count(test_id, "PATCH", "/v1/channel-conversations/conversationId", None, 1)
