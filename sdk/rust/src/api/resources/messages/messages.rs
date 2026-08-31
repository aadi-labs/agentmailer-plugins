use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, QueryBuilder, RequestOptions};
use reqwest::Method;

pub struct MessagesClient {
    pub http_client: HttpClient,
}

impl MessagesClient {
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
    ///         .messages
    ///         .list(
    ///             &"inboxId".to_string(),
    ///             &MessagesListQueryRequest {
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
        request: &MessagesListQueryRequest,
        options: Option<RequestOptions>,
    ) -> Result<ListMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/messages", inbox_id),
                None,
                QueryBuilder::new()
                    .int("limit", request.limit.clone())
                    .string("page_token", request.page_token.clone())
                    .string("thread_id", request.thread_id.clone())
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
    ///         .messages
    ///         .send(
    ///             &"inboxId".to_string(),
    ///             &MessageCompose {
    ///                 to: vec![MessageComposeToItem::String("to".to_string())],
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn send(
        &self,
        inbox_id: &str,
        request: &MessageCompose,
        options: Option<RequestOptions>,
    ) -> Result<SendMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/messages/send", inbox_id),
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
    ///         .messages
    ///         .get(&"inboxId".to_string(), &"messageId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn get(
        &self,
        inbox_id: &str,
        message_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/inboxes/{}/messages/{}", inbox_id, message_id),
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
    ///         .messages
    ///         .delete(&"inboxId".to_string(), &"messageId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        inbox_id: &str,
        message_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/inboxes/{}/messages/{}", inbox_id, message_id),
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
    ///         .messages
    ///         .reply(
    ///             &"inboxId".to_string(),
    ///             &"messageId".to_string(),
    ///             &ReplyCompose {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn reply(
        &self,
        inbox_id: &str,
        message_id: &str,
        request: &ReplyCompose,
        options: Option<RequestOptions>,
    ) -> Result<ReplyMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/messages/{}/reply", inbox_id, message_id),
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
    ///         .messages
    ///         .reply_all(
    ///             &"inboxId".to_string(),
    ///             &"messageId".to_string(),
    ///             &ReplyCompose {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn reply_all(
        &self,
        inbox_id: &str,
        message_id: &str,
        request: &ReplyCompose,
        options: Option<RequestOptions>,
    ) -> Result<ReplyAllMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/messages/{}/reply-all", inbox_id, message_id),
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
    ///         .messages
    ///         .forward(
    ///             &"inboxId".to_string(),
    ///             &"messageId".to_string(),
    ///             &MessageCompose {
    ///                 to: vec![MessageComposeToItem::String("to".to_string())],
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn forward(
        &self,
        inbox_id: &str,
        message_id: &str,
        request: &MessageCompose,
        options: Option<RequestOptions>,
    ) -> Result<ForwardMessagesResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/messages/{}/forward", inbox_id, message_id),
                Some(serde_json::to_value(request).map_err(ApiError::Serialization)?),
                None,
                options,
            )
            .await
    }
}
