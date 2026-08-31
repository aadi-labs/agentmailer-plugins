from .conftest import get_client, verify_request_count


def test_events_create_ticket() -> None:
    """Test createTicket endpoint with WireMock"""
    test_id = "events.create_ticket.0"
    client = get_client(test_id)
    client.events.create_ticket(
        pod_id="podId",
    )
    verify_request_count(test_id, "POST", "/v1/events/tickets", None, 1)
