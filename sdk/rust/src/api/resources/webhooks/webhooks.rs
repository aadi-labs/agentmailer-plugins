use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct WebhooksClient {
    pub http_client: HttpClient,
}

impl WebhooksClient {
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
    ///     client.webhooks.list(None).await;
    /// }
    /// ```
    pub async fn list(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<ListWebhooksResponse, ApiError> {
        self.http_client
            .execute_request(Method::GET, "v1/webhooks", None, None, options)
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
    ///         .webhooks
    ///         .create(
    ///             &WebhookCreate {
    ///                 url: "url".to_string(),
    ///                 pod_id: None,
    ///                 inbox_id: None,
    ///                 event_types: None,
    ///                 description: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &WebhookCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateWebhooksResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/webhooks",
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
    ///     client.webhooks.get(&"webhookId".to_string(), None).await;
    /// }
    /// ```
    pub async fn get(
        &self,
        webhook_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetWebhooksResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/webhooks/{}", webhook_id),
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
    ///     client.webhooks.delete(&"webhookId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        webhook_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/webhooks/{}", webhook_id),
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
    ///         .webhooks
    ///         .update(
    ///             &"webhookId".to_string(),
    ///             &WebhookUpdate {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update(
        &self,
        webhook_id: &str,
        request: &WebhookUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateWebhooksResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/webhooks/{}", webhook_id),
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
    ///         .webhooks
    ///         .rotate_secret(&"webhookId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn rotate_secret(
        &self,
        webhook_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<RotateSecretWebhooksResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/webhooks/{}/rotate-secret", webhook_id),
                None,
                None,
                options,
            )
            .await
    }
}
