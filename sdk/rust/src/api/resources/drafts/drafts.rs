use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct DraftsClient {
    pub http_client: HttpClient,
}

impl DraftsClient {
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
    ///     client.drafts.list(&"inboxId".to_string(), None).await;
    /// }
    /// ```
    pub async fn list(
        &self,
        inbox_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<ListDraftsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/drafts", inbox_id),
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
    ///         .drafts
    ///         .create(
    ///             &"inboxId".to_string(),
    ///             &DraftCreate {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        inbox_id: &str,
        request: &DraftCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateDraftsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/drafts", inbox_id),
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
    ///         .drafts
    ///         .get(&"inboxId".to_string(), &"draftId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn get(
        &self,
        inbox_id: &str,
        draft_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetDraftsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/drafts/{}", inbox_id, draft_id),
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
    ///         .drafts
    ///         .delete(&"inboxId".to_string(), &"draftId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        inbox_id: &str,
        draft_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/inboxes/{}/drafts/{}", inbox_id, draft_id),
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
    ///         .drafts
    ///         .update(
    ///             &"inboxId".to_string(),
    ///             &"draftId".to_string(),
    ///             &DraftUpdate {
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
        draft_id: &str,
        request: &DraftUpdate,
        options: Option<RequestOptions>,
    ) -> Result<UpdateDraftsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::PATCH,
                &format!("v1/inboxes/{}/drafts/{}", inbox_id, draft_id),
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
    ///         .drafts
    ///         .send(&"inboxId".to_string(), &"draftId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn send(
        &self,
        inbox_id: &str,
        draft_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<SendDraftsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/drafts/{}/send", inbox_id, draft_id),
                None,
                None,
                options,
            )
            .await
    }
}
