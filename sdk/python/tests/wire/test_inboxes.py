from .conftest import get_client, verify_request_count


def test_inboxes_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "inboxes.list_.0"
    client = get_client(test_id)
    client.inboxes.list()
    verify_request_count(test_id, "GET", "/v1/inboxes", None, 1)


def test_inboxes_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "inboxes.create.0"
    client = get_client(test_id)
    client.inboxes.create()
    verify_request_count(test_id, "POST", "/v1/inboxes", None, 1)


def test_inboxes_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "inboxes.get.0"
    client = get_client(test_id)
    client.inboxes.get(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId", None, 1)


def test_inboxes_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "inboxes.delete.0"
    client = get_client(test_id)
    client.inboxes.delete(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "DELETE", "/v1/inboxes/inboxId", None, 1)


def test_inboxes_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "inboxes.update.0"
    client = get_client(test_id)
    client.inboxes.update(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "PATCH", "/v1/inboxes/inboxId", None, 1)


def test_inboxes_issue_credentials() -> None:
    """Test issueCredentials endpoint with WireMock"""
    test_id = "inboxes.issue_credentials.0"
    client = get_client(test_id)
    client.inboxes.issue_credentials(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/credentials", None, 1)
