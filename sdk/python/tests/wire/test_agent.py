from .conftest import get_client, verify_request_count


def test_agent_bootstrap() -> None:
    """Test bootstrap endpoint with WireMock"""
    test_id = "agent.bootstrap.0"
    client = get_client(test_id)
    client.agent.bootstrap()
    verify_request_count(test_id, "POST", "/v1/agent/bootstrap", None, 1)


def test_agent_sign_up() -> None:
    """Test signUp endpoint with WireMock"""
    test_id = "agent.sign_up.0"
    client = get_client(test_id)
    client.agent.sign_up(
        human_email="human_email",
        username="username",
    )
    verify_request_count(test_id, "POST", "/v1/agent/sign-up", None, 1)
