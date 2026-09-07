use agentmailer::prelude::*;

mod wire_test_utils;

#[tokio::test]
#[allow(unused_variables, unreachable_code)]
async fn test_channel_messages_list_with_wiremock() {
    wire_test_utils::reset_wiremock_requests().await.unwrap();
    let wiremock_base_url = wire_test_utils::get_wiremock_base_url();

    let mut config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    config.base_url = wiremock_base_url.to_string();
    let client = AgentMailer::new(config).expect("Failed to build client");

    let result = client
        .channel_messages
        .list(
            &ChannelMessagesListQueryRequest {
                ..Default::default()
            },
            None,
        )
        .await;

    assert!(result.is_ok(), "Client method call should succeed");

    wire_test_utils::verify_request_count("GET", "/v1/channel-messages", None, 1)
        .await
        .unwrap();
}

#[tokio::test]
#[allow(unused_variables, unreachable_code)]
async fn test_channel_messages_send_with_wiremock() {
    wire_test_utils::reset_wiremock_requests().await.unwrap();
    let wiremock_base_url = wire_test_utils::get_wiremock_base_url();

    let mut config = ClientConfig {
        token: Some("<token>".to_string()),
        ..Default::default()
    };
    config.base_url = wiremock_base_url.to_string();
    let client = AgentMailer::new(config).expect("Failed to build client");

    let result = client
        .channel_messages
        .send(
            &ChannelMessageSend::Sms {
                data: ChannelMessageSendSms {
                    endpoint_id: "endpointId".to_string(),
                    to: "to".to_string(),
                    consent: ChannelMessageSendSmsConsent {
                        basis: ChannelMessageSendSmsConsentBasis::Explicit,
                        captured_at: DateTime::parse_from_rfc3339("2024-01-15T09:30:00Z").unwrap(),
                        reference: "reference".to_string(),
                    },
                    content: ChannelMessageSendSmsContent {
                        r#type: ChannelMessageSendSmsContentType::Text,
                        body: "body".to_string(),
                    },
                    message_type: None,
                },
            },
            Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
        )
        .await;

    assert!(result.is_ok(), "Client method call should succeed");

    wire_test_utils::verify_request_count("POST", "/v1/channel-messages", None, 1)
        .await
        .unwrap();
}
