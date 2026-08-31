from .conftest import get_client, verify_request_count


def test_labels_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "labels.list_.0"
    client = get_client(test_id)
    client.labels.list()
    verify_request_count(test_id, "GET", "/v1/labels", None, 1)


def test_labels_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "labels.create.0"
    client = get_client(test_id)
    client.labels.create(
        pod_id="podId",
        name="name",
    )
    verify_request_count(test_id, "POST", "/v1/labels", None, 1)


def test_labels_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "labels.delete.0"
    client = get_client(test_id)
    client.labels.delete(
        label_id="labelId",
    )
    verify_request_count(test_id, "DELETE", "/v1/labels/labelId", None, 1)


def test_labels_update_message() -> None:
    """Test updateMessage endpoint with WireMock"""
    test_id = "labels.update_message.0"
    client = get_client(test_id)
    client.labels.update_message(
        message_id="messageId",
    )
    verify_request_count(test_id, "PATCH", "/v1/messages/messageId/labels", None, 1)


def test_labels_update_thread() -> None:
    """Test updateThread endpoint with WireMock"""
    test_id = "labels.update_thread.0"
    client = get_client(test_id)
    client.labels.update_thread(
        thread_id="threadId",
    )
    verify_request_count(test_id, "PATCH", "/v1/threads/threadId/labels", None, 1)
