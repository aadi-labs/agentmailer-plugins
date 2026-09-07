use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct ChannelConversationsClient {
    pub http_client: HttpClient,
}

impl ChannelConversationsClient {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            http_client: HttpClient::new(config.clone())?,
        })
    }

    /// List human-channel conversations
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
    ///         .channel_conversations
    ///         .list(
    ///             &ChannelConversationsListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &ChannelConversationsListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListChannelConversationsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/channel-conversations",
                None,
                QueryBuilder::new()
                    .int("limit", request.limit.clone())
                    .string("pageToken", request.page_token.clone())
                    .string("endpointId", request.endpoint_id.clone())
                    .serialize("channel", request.channel.clone())
                    .serialize("status", request.status.clone())
                    .build(),
                options,
            )
            .await
    }

    /// Get a human-channel conversation
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
    ///         .channel_conversations
    ///         .get(&"conversationId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn get(
        &self,
        conversation_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetChannelConversationsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/channel-conversations/{}", conversation_id),
                None,
                None,
                options,
            )
            .await
    }

    /// Open or close a human-channel conversation
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
    ///         .channel_conversations
    ///         .update(
    ///             &"conversationId".to_string(),
    ///             &ChannelConversationUpdate {
    ///                 status: ChannelConversationUpdateStatus::Active,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update(
        &self,
        conversation_id: &str,
        request: &ChannelConversationUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateChannelConversationsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/channel-conversations/{}", conversation_id),
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
