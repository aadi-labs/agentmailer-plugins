use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct PodsClient {
    pub http_client: HttpClient,
}

impl PodsClient {
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
    ///     client.pods.list(None).await;
    /// }
    /// ```
    pub async fn list(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<ListPodsResponse, ApiError> {
        self.http_client
            .execute_request(Method::GET, "v1/pods", None, None, options)
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
    ///         .pods
    ///         .create(
    ///             &PodCreate {
    ///                 name: "name".to_string(),
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &PodCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreatePodsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/pods",
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
    ///     client.pods.get(&"podId".to_string(), None).await;
    /// }
    /// ```
    pub async fn get(
        &self,
        pod_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetPodsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/pods/{}", pod_id),
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
    ///     client.pods.delete(&"podId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        pod_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/pods/{}", pod_id),
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
    ///         .pods
    ///         .update(
    ///             &"podId".to_string(),
    ///             &PodUpdate {
    ///                 name: "name".to_string(),
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update(
        &self,
        pod_id: &str,
        request: &PodUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdatePodsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/pods/{}", pod_id),
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
