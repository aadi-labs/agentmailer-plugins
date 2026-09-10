use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct LabelsClient {
    pub http_client: HttpClient,
}

impl LabelsClient {
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
    ///         .labels
    ///         .list(
    ///             &LabelsListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &LabelsListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListLabelsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/labels",
                None,
                QueryBuilder::new()
                    .string("pod_id", request.pod_id.clone())
                    .build(),
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
    ///         .labels
    ///         .create(
    ///             &LabelCreate {
    ///                 pod_id: "podId".to_string(),
    ///                 name: "name".to_string(),
    ///                 color: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &LabelCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateLabelsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/labels",
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
    ///     client.labels.delete(&"labelId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        label_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/labels/{}", label_id),
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
    ///         .labels
    ///         .update_message(
    ///             &"messageId".to_string(),
    ///             &LabelMutation {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update_message(
        &self,
        message_id: &str,
        request: &LabelMutation,
        options: Option<RequestOptions>,
    ) -> Result<UpdateMessageLabelsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/messages/{}/labels", message_id),
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
    ///         .labels
    ///         .update_thread(
    ///             &"threadId".to_string(),
    ///             &LabelMutation {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update_thread(
        &self,
        thread_id: &str,
        request: &LabelMutation,
        options: Option<RequestOptions>,
    ) -> Result<UpdateThreadLabelsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/threads/{}/labels", thread_id),
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
