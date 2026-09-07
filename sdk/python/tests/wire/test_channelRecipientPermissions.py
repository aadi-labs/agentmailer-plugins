from .conftest import get_client, verify_request_count


def test_channelRecipientPermissions_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "channel_recipient_permissions.list_.0"
    client = get_client(test_id)
    client.channel_recipient_permissions.list()
    verify_request_count(test_id, "GET", "/v1/channel-recipient-permissions", None, 1)
