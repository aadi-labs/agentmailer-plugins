from .conftest import get_client, verify_request_count


def test_channelEndpoints_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "channel_endpoints.list_.0"
    client = get_client(test_id)
    client.channel_endpoints.list()
    verify_request_count(test_id, "GET", "/v1/channel-endpoints", None, 1)


def test_channelEndpoints_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "channel_endpoints.create.0"
    client = get_client(test_id)
    client.channel_endpoints.create(
        inbox_id="inboxId",
        pod_id="podId",
        channel="sms",
    )
    verify_request_count(test_id, "POST", "/v1/channel-endpoints", None, 1)


def test_channelEndpoints_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "channel_endpoints.get.0"
    client = get_client(test_id)
    client.channel_endpoints.get(
        endpoint_id="endpointId",
    )
    verify_request_count(test_id, "GET", "/v1/channel-endpoints/endpointId", None, 1)


def test_channelEndpoints_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "channel_endpoints.update.0"
    client = get_client(test_id)
    client.channel_endpoints.update(
        endpoint_id="endpointId",
        status="active",
    )
    verify_request_count(test_id, "PATCH", "/v1/channel-endpoints/endpointId", None, 1)
