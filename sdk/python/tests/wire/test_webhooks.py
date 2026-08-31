from .conftest import get_client, verify_request_count


def test_webhooks_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "webhooks.list_.0"
    client = get_client(test_id)
    client.webhooks.list()
    verify_request_count(test_id, "GET", "/v1/webhooks", None, 1)


def test_webhooks_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "webhooks.create.0"
    client = get_client(test_id)
    client.webhooks.create(
        url="url",
    )
    verify_request_count(test_id, "POST", "/v1/webhooks", None, 1)


def test_webhooks_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "webhooks.get.0"
    client = get_client(test_id)
    client.webhooks.get(
        webhook_id="webhookId",
    )
    verify_request_count(test_id, "GET", "/v1/webhooks/webhookId", None, 1)


def test_webhooks_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "webhooks.delete.0"
    client = get_client(test_id)
    client.webhooks.delete(
        webhook_id="webhookId",
    )
    verify_request_count(test_id, "DELETE", "/v1/webhooks/webhookId", None, 1)


def test_webhooks_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "webhooks.update.0"
    client = get_client(test_id)
    client.webhooks.update(
        webhook_id="webhookId",
    )
    verify_request_count(test_id, "PATCH", "/v1/webhooks/webhookId", None, 1)


def test_webhooks_rotate_secret() -> None:
    """Test rotateSecret endpoint with WireMock"""
    test_id = "webhooks.rotate_secret.0"
    client = get_client(test_id)
    client.webhooks.rotate_secret(
        webhook_id="webhookId",
    )
    verify_request_count(test_id, "POST", "/v1/webhooks/webhookId/rotate-secret", None, 1)
