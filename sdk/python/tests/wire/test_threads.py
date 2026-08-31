from .conftest import get_client, verify_request_count


def test_threads_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "threads.list_.0"
    client = get_client(test_id)
    client.threads.list(
        inbox_id="inboxId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/threads", None, 1)


def test_threads_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "threads.get.0"
    client = get_client(test_id)
    client.threads.get(
        inbox_id="inboxId",
        thread_id="threadId",
    )
    verify_request_count(test_id, "GET", "/v1/inboxes/inboxId/threads/threadId", None, 1)
