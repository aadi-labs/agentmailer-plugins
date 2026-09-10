use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct InboxesClient {
    pub http_client: HttpClient,
}

impl InboxesClient {
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
    ///         .inboxes
    ///         .list(
    ///             &InboxesListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        request: &InboxesListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListInboxesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                "v1/inboxes",
                None,
                QueryBuilder::new()
                    .int("limit", request.limit.clone())
                    .string("page_token", request.page_token.clone())
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
    ///         .inboxes
    ///         .create(
    ///             &InboxCreate {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &InboxCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateInboxesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/inboxes",
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
    ///     client.inboxes.get(&"inboxId".to_string(), None).await;
    /// }
    /// ```
    pub async fn get(
        &self,
        inbox_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetInboxesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}", inbox_id),
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
    ///     client.inboxes.delete(&"inboxId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        inbox_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/inboxes/{}", inbox_id),
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
    ///         .inboxes
    ///         .update(
    ///             &"inboxId".to_string(),
    ///             &InboxUpdate {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn update(
        &self,
        inbox_id: &str,
        request: &InboxUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateInboxesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/inboxes/{}", inbox_id),
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
    ///         .inboxes
    ///         .issue_credentials(&"inboxId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn issue_credentials(
        &self,
        inbox_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<IssueCredentialsInboxesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/credentials", inbox_id),
                None,
                None,
                options,
            )
            .await
    }
}
