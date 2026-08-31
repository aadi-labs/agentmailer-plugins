from .conftest import get_client, verify_request_count


def test_lists_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "lists.list_.0"
    client = get_client(test_id)
    client.lists.list()
    verify_request_count(test_id, "GET", "/v1/lists", None, 1)


def test_lists_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "lists.create.0"
    client = get_client(test_id)
    client.lists.create(
        pod_id="podId",
        name="name",
        kind="allow",
    )
    verify_request_count(test_id, "POST", "/v1/lists", None, 1)


def test_lists_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "lists.delete.0"
    client = get_client(test_id)
    client.lists.delete(
        list_id="listId",
    )
    verify_request_count(test_id, "DELETE", "/v1/lists/listId", None, 1)


def test_lists_add_entry() -> None:
    """Test addEntry endpoint with WireMock"""
    test_id = "lists.add_entry.0"
    client = get_client(test_id)
    client.lists.add_entry(
        list_id="listId",
        address_pattern="addressPattern",
    )
    verify_request_count(test_id, "POST", "/v1/lists/listId/entries", None, 1)


def test_lists_remove_entry() -> None:
    """Test removeEntry endpoint with WireMock"""
    test_id = "lists.remove_entry.0"
    client = get_client(test_id)
    client.lists.remove_entry(
        list_id="listId",
    )
    verify_request_count(test_id, "DELETE", "/v1/lists/listId/entries", None, 1)
