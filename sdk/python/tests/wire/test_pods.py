from .conftest import get_client, verify_request_count


def test_pods_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "pods.list_.0"
    client = get_client(test_id)
    client.pods.list()
    verify_request_count(test_id, "GET", "/v1/pods", None, 1)


def test_pods_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "pods.create.0"
    client = get_client(test_id)
    client.pods.create(
        name="name",
    )
    verify_request_count(test_id, "POST", "/v1/pods", None, 1)


def test_pods_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "pods.get.0"
    client = get_client(test_id)
    client.pods.get(
        pod_id="podId",
    )
    verify_request_count(test_id, "GET", "/v1/pods/podId", None, 1)


def test_pods_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "pods.delete.0"
    client = get_client(test_id)
    client.pods.delete(
        pod_id="podId",
    )
    verify_request_count(test_id, "DELETE", "/v1/pods/podId", None, 1)


def test_pods_update() -> None:
    """Test update endpoint with WireMock"""
    test_id = "pods.update.0"
    client = get_client(test_id)
    client.pods.update(
        pod_id="podId",
        name="name",
    )
    verify_request_count(test_id, "PATCH", "/v1/pods/podId", None, 1)
