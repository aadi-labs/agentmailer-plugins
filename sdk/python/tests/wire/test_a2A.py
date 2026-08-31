from .conftest import get_client, verify_request_count


def test_a2A_send_task() -> None:
    """Test sendTask endpoint with WireMock"""
    test_id = "a2a.send_task.0"
    client = get_client(test_id)
    client.a2a.send_task(
        handle="handle",
        jsonrpc="2.0",
        method="method",
    )
    verify_request_count(test_id, "POST", "/a2a/handle", None, 1)


def test_a2A_get_agent_card() -> None:
    """Test getAgentCard endpoint with WireMock"""
    test_id = "a2a.get_agent_card.0"
    client = get_client(test_id)
    client.a2a.get_agent_card(
        handle="handle",
    )
    verify_request_count(test_id, "GET", "/a2a/handle/.well-known/agent-card.json", None, 1)


def test_a2A_update_task() -> None:
    """Test updateTask endpoint with WireMock"""
    test_id = "a2a.update_task.0"
    client = get_client(test_id)
    client.a2a.update_task(
        task_id="taskId",
        state="TASK_STATE_SUBMITTED",
    )
    verify_request_count(test_id, "POST", "/v1/a2a/tasks/taskId", None, 1)


def test_a2A_update_identity() -> None:
    """Test updateIdentity endpoint with WireMock"""
    test_id = "a2a.update_identity.0"
    client = get_client(test_id)
    client.a2a.update_identity()
    verify_request_count(test_id, "PATCH", "/v1/a2a/identity", None, 1)
