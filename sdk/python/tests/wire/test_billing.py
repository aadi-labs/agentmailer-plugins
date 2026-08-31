from .conftest import get_client, verify_request_count


def test_billing_get() -> None:
    """Test get endpoint with WireMock"""
    test_id = "billing.get.0"
    client = get_client(test_id)
    client.billing.get()
    verify_request_count(test_id, "GET", "/v1/billing", None, 1)


def test_billing_create_checkout() -> None:
    """Test createCheckout endpoint with WireMock"""
    test_id = "billing.create_checkout.0"
    client = get_client(test_id)
    client.billing.create_checkout()
    verify_request_count(test_id, "POST", "/v1/billing/checkout", None, 1)


def test_billing_create_portal() -> None:
    """Test createPortal endpoint with WireMock"""
    test_id = "billing.create_portal.0"
    client = get_client(test_id)
    client.billing.create_portal()
    verify_request_count(test_id, "POST", "/v1/billing/portal", None, 1)
