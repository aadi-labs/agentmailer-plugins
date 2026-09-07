import datetime

from .conftest import get_client, verify_request_count

from agentmailer import ChannelMessageSend_Sms, ChannelMessageSendSmsConsent, ChannelMessageSendSmsContent


def test_channelMessages_list_() -> None:
    """Test list endpoint with WireMock"""
    test_id = "channel_messages.list_.0"
    client = get_client(test_id)
    client.channel_messages.list()
    verify_request_count(test_id, "GET", "/v1/channel-messages", None, 1)


def test_channelMessages_send() -> None:
    """Test send endpoint with WireMock"""
    test_id = "channel_messages.send.0"
    client = get_client(test_id)
    client.channel_messages.send(
        idempotency_key="Idempotency-Key",
        request=ChannelMessageSend_Sms(
            endpoint_id="endpointId",
            to="to",
            consent=ChannelMessageSendSmsConsent(
                basis="explicit",
                captured_at=datetime.datetime.fromisoformat("2024-01-15T09:30:00+00:00"),
                reference="reference",
            ),
            content=ChannelMessageSendSmsContent(
                type="text",
                body="body",
            ),
        ),
    )
    verify_request_count(test_id, "POST", "/v1/channel-messages", None, 1)
