use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct EventsClient {
    pub http_client: HttpClient,
}

impl EventsClient {
    pub fn new(config: ClientConfig) -> Result<Self, ApiError> {
        Ok(Self {
            http_client: HttpClient::new(config.clone())?,
        })
    }

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
    ///         .events
    ///         .create_ticket(
    ///             &CreateTicketEventsRequest {
    ///                 pod_id: "podId".to_string(),
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create_ticket(
        &self,
        request: &CreateTicketEventsRequest,
        options: Option<RequestOptions>,
    ) -> Result<CreateTicketEventsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/events/tickets",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
