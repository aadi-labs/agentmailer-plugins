use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;
use std::collections::HashMap;

pub struct A2AClient {
    pub http_client: HttpClient,
}

impl A2AClient {
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
    ///         .a2a
    ///         .send_task(
    ///             &"handle".to_string(),
    ///             &A2AJsonRpcRequest {
    ///                 jsonrpc: A2AJsonRpcRequestJsonrpc::Two0,
    ///                 method: "method".to_string(),
    ///                 id: None,
    ///                 params: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn send_task(
        &self,
        handle: &str,
        request: &A2AJsonRpcRequest,
        options: Option<RequestOptions>,
    ) -> Result<HashMap<String, serde_json::Value>, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("a2a/{}", handle),
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
    ///     client.a2a.get_agent_card(&"handle".to_string(), None).await;
    /// }
    /// ```
    pub async fn get_agent_card(
        &self,
        handle: &str,
        options: Option<RequestOptions>,
    ) -> Result<A2AAgentCard, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("a2a/{}/.well-known/agent-card.json", handle),
                None,
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
    ///         .a2a
    ///         .update_task(
    ///             &"taskId".to_string(),
    ///             &A2ATaskUpdate {
    ///                 state: A2ATaskUpdateState::TaskStateSubmitted,
    ///                 message: None,
    ///                 artifacts: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update_task(
        &self,
        task_id: &str,
        request: &A2ATaskUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateTaskA2AResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/a2a/tasks/{}", task_id),
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
    ///         .a2a
    ///         .update_identity(
    ///             &A2AIdentitySettings {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update_identity(
        &self,
        request: &A2AIdentitySettings,
        options: Option<RequestOptions>,
    ) -> Result<HashMap<String, serde_json::Value>, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                "v1/a2a/identity",
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
