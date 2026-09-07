use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct ChannelRecipientPermissionsClient {
    pub http_client: HttpClient,
}

impl ChannelRecipientPermissionsClient {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            http_client: HttpClient::new(config.clone())?,
        })
    }

    /// List human-channel consent and opt-out state
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
    ///         .channel_recipient_permissions
    ///         .list(
    ///             &ChannelRecipientPermissionsListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &ChannelRecipientPermissionsListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListChannelRecipientPermissionsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/channel-recipient-permissions",
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
}
