use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct AgentClient {
    pub http_client: HttpClient,
}

impl AgentClient {
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
    ///         .agent
    ///         .bootstrap(
    ///             &BootstrapRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn bootstrap(
        &self,
        request: &BootstrapRequest,
        options: Option<RequestOptions>,
    ) -> Result<BootstrapResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/agent/bootstrap",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
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
    ///         .agent
    ///         .sign_up(
    ///             &SignUpAgentRequest {
    ///                 human_email: "human_email".to_string(),
    ///                 username: "username".to_string(),
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn sign_up(
        &self,
        request: &SignUpAgentRequest,
        options: Option<RequestOptions>,
    ) -> Result<SignUpAgentResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/agent/sign-up",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
