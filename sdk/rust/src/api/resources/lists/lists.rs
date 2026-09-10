use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct ListsClient {
    pub http_client: HttpClient,
}

impl ListsClient {
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
    ///         .lists
    ///         .list(
    ///             &ListsListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &ListsListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListListsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/lists",
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
    ///         .lists
    ///         .create(
    ///             &ListCreate {
    ///                 pod_id: "podId".to_string(),
    ///                 name: "name".to_string(),
    ///                 kind: ListCreateKind::Allow,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &ListCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateListsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/lists",
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
    ///     client.lists.delete(&"listId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        list_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/lists/{}", list_id),
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
    ///         .lists
    ///         .add_entry(
    ///             &"listId".to_string(),
    ///             &ListEntry {
    ///                 address_pattern: "addressPattern".to_string(),
    ///                 note: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn add_entry(
        &self,
        list_id: &str,
        request: &ListEntry,
        options: Option<RequestOptions>,
    ) -> Result<AddEntryListsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/lists/{}/entries", list_id),
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
    ///         .lists
    ///         .remove_entry(
    ///             &"listId".to_string(),
    ///             &RemoveEntryQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn remove_entry(
        &self,
        list_id: &str,
        request: &RemoveEntryQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<RemoveEntryListsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/lists/{}/entries", list_id),
                None,
                QueryBuilder::new()
                    .string("address_pattern", request.address_pattern.clone())
                    .build(),
                options,
            )
            .await
    }
}
