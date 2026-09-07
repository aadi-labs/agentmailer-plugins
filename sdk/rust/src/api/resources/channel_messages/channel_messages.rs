use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct ChannelMessagesClient {
    pub http_client: HttpClient,
}

impl ChannelMessagesClient {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            http_client: HttpClient::new(config.clone())?,
        })
    }

    /// List human-channel messages
    ///
    /// # Arguments
    ///
    /// * `options` - Additional request options such as headers, timeout, etc.
    ///
    /// # Returns
    ///
    /// JSON response from the API
    ///
    /// # Examples
    ///
    /// ```no_run
    /// use agentmailer::prelude::*;
    ///
    /// #[tokio::main]
    /// async fn main() {
    ///     let config = ClientConfig {
    ///         token: Some("<token>".to_string()),
    ///         ..Default::default()
    ///     };
    ///     let client = AgentMailer::new(config).expect("Failed to build client");
    ///     client
    ///         .channel_messages
    ///         .list(
    ///             &ChannelMessagesListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &ChannelMessagesListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListChannelMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/channel-messages",
                None,
                QueryBuilder::new()
                    .int("limit", request.limit.clone())
                    .string("pageToken", request.page_token.clone())
                    .string("endpointId", request.endpoint_id.clone())
                    .string("conversationId", request.conversation_id.clone())
                    .serialize("channel", request.channel.clone())
                    .build(),
                options,
            )
            .await
    }

    /// Sends through an assigned SMS, MMS, RCS, WhatsApp, or outbound voice endpoint. Supports RCS rich cards and replies, plus WhatsApp media and reply buttons. All non-template WhatsApp messages require a recipient message within the last 24 hours; otherwise use an approved template.
    ///
    /// # Arguments
    ///
    /// * `options` - Additional request options such as headers, timeout, etc.
    ///
    /// # Returns
    ///
    /// JSON response from the API
    ///
    /// # Examples
    ///
    /// ```no_run
    /// use agentmailer::prelude::*;
    ///
    /// #[tokio::main]
    /// async fn main() {
    ///     let config = ClientConfig {
    ///         token: Some("<token>".to_string()),
    ///         ..Default::default()
    ///     };
    ///     let client = AgentMailer::new(config).expect("Failed to build client");
    ///     client
    ///         .channel_messages
    ///         .send(
    ///             &ChannelMessageSend::Sms {
    ///                 data: ChannelMessageSendSms {
    ///                     endpoint_id: "endpointId".to_string(),
    ///                     to: "to".to_string(),
    ///                     consent: ChannelMessageSendSmsConsent {
    ///                         basis: ChannelMessageSendSmsConsentBasis::Explicit,
    ///                         captured_at: DateTime::parse_from_rfc3339("2024-01-15T09:30:00Z").unwrap(),
    ///                         reference: "reference".to_string(),
    ///                     },
    ///                     content: ChannelMessageSendSmsContent {
    ///                         r#type: ChannelMessageSendSmsContentType::Text,
    ///                         body: "body".to_string(),
    ///                     },
    ///                     message_type: None,
    ///                 },
    ///             },
    ///             Some(RequestOptions::new().additional_header("Idempotency-Key", "Idempotency-Key")),
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn send(
        &self,
        request: &ChannelMessageSend,
        options: Option<RequestOptions>,
    ) -> Result<SendChannelMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/channel-messages",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
