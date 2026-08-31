from .conftest import get_client, verify_request_count


def test_domains_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "domains.list_.0"
    client = get_client(test_id)
    client.domains.list()
    verify_request_count(test_id, "GET", "/v1/domains", None, 1)


def test_domains_create() -> None:
    """Test create endpoint with WireMock"""
    test_id = "domains.create.0"
    client = get_client(test_id)
    client.domains.create(
        domain="domain",
    )
    verify_request_count(test_id, "POST", "/v1/domains", None, 1)


def test_domains_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "domains.get.0"
    client = get_client(test_id)
    client.domains.get(
        domain_id="domainId",
    )
    verify_request_count(test_id, "GET", "/v1/domains/domainId", None, 1)


def test_domains_delete() -> None:
    """Test delete endpoint with WireMock"""
    test_id = "domains.delete.0"
    client = get_client(test_id)
    client.domains.delete(
        domain_id="domainId",
    )
    verify_request_count(test_id, "DELETE", "/v1/domains/domainId", None, 1)


def test_domains_verify() -> None:
    """Test verify endpoint with WireMock"""
    test_id = "domains.verify.0"
    client = get_client(test_id)
    client.domains.verify(
        domain_id="domainId",
    )
    verify_request_count(test_id, "POST", "/v1/domains/domainId/verify", None, 1)
