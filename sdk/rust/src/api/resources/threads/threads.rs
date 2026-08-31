use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct ThreadsClient {
    pub http_client: HttpClient,
}

impl ThreadsClient {
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
    ///         .threads
    ///         .list(
    ///             &"inboxId".to_string(),
    ///             &ThreadsListQueryRequest {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn list(
        &self,
        inbox_id: &str,
        request: &ThreadsListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListThreadsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/threads", inbox_id),
                None,
                QueryBuilder::new()
                    .int("limit", request.limit.clone())
                    .string("page_token", request.page_token.clone())
                    .string("label", request.label.clone())
                    .structured_query("query", request.query.clone())
                    .datetime("before", request.before.clone())
                    .datetime("after", request.after.clone())
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
    ///         .threads
    ///         .get(&"inboxId".to_string(), &"threadId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn get(
        &self,
        inbox_id: &str,
        thread_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetThreadsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/threads/{}", inbox_id, thread_id),
                None,
                None,
                options,
            )
            .await
    }
}
