from .conftest import get_client, verify_request_count


def test_drafts_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "drafts.list_.0"
    client = get_client(test_id)
    client.drafts.list(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/drafts", None, 1)


def test_drafts_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "drafts.create.0"
    client = get_client(test_id)
    client.drafts.create(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/drafts", None, 1)


def test_drafts_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "drafts.get.0"
    client = get_client(test_id)
    client.drafts.get(
        inbox_id="inboxId",
        draft_id="draftId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/drafts/draftId", None, 1)


def test_drafts_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "drafts.delete.0"
    client = get_client(test_id)
    client.drafts.delete(
        inbox_id="inboxId",
        draft_id="draftId",
    )
    verify_request_count(test_id, "DELETE", "/v1/inboxes/inboxId/drafts/draftId", None, 1)


def test_drafts_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "drafts.update.0"
    client = get_client(test_id)
    client.drafts.update(
        inbox_id="inboxId",
        draft_id="draftId",
    )
    verify_request_count(test_id, "PATCH", "/v1/inboxes/inboxId/drafts/draftId", None, 1)


def test_drafts_send() -> None:
    """Test send endpoint with WireMock"""
    test_id = "drafts.send.0"
    client = get_client(test_id)
    client.drafts.send(
        inbox_id="inboxId",
        draft_id="draftId",
    )
    verify_request_count(test_id, "POST", "/v1/inboxes/inboxId/drafts/draftId/send", None, 1)
