use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct ChannelEndpointsClient {
    pub http_client: HttpClient,
}

impl ChannelEndpointsClient {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            http_client: HttpClient::new(config.clone())?,
        })
    }

    /// List human-channel endpoints
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
    ///     client.channel_endpoints.list(None).await;
    /// }
    /// ```
    pub async fn list(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<ListChannelEndpointsResponse, ApiError> {
        self.http_client
            .execute_request(Method::GET, "v1/channel-endpoints", None, None, options)
            .await
    }

    /// Assign a human-channel endpoint
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
    ///         .channel_endpoints
    ///         .create(
    ///             &ChannelEndpointCreate {
    ///                 inbox_id: "inboxId".to_string(),
    ///                 pod_id: "podId".to_string(),
    ///                 channel: ChannelEndpointCreateChannel::Sms,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &ChannelEndpointCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateChannelEndpointsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/channel-endpoints",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }

    /// Get a human-channel endpoint
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
    ///         .channel_endpoints
    ///         .get(&"endpointId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn get(
        &self,
        endpoint_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetChannelEndpointsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/channel-endpoints/{}", endpoint_id),
                None,
                None,
                options,
            )
            .await
    }

    /// Enable or disable a human-channel endpoint
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
    ///         .channel_endpoints
    ///         .update(
    ///             &"endpointId".to_string(),
    ///             &ChannelEndpointUpdate {
    ///                 status: ChannelEndpointUpdateStatus::Active,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update(
        &self,
        endpoint_id: &str,
        request: &ChannelEndpointUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateChannelEndpointsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/channel-endpoints/{}", endpoint_id),
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
