use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;
use std::collections::HashMap;

pub struct AttachmentsClient {
    pub http_client: HttpClient,
}

impl AttachmentsClient {
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
    ///         .attachments
    ///         .upload(
    ///             &"inboxId".to_string(),
    ///             &AttachmentUploadCreate {
    ///                 filename: "filename".to_string(),
    ///                 content_type: "contentType".to_string(),
    ///                 size: 1,
    ///                 checksum_sha256: "checksumSha256".to_string(),
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn upload(
        &self,
        inbox_id: &str,
        request: &AttachmentUploadCreate,
        options: Option<RequestOptions>,
    ) -> Result<HashMap<String, serde_json::Value>, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/inboxes/{}/attachments", inbox_id),
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
    ///         .attachments
    ///         .complete(&"inboxId".to_string(), &"attachmentId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn complete(
        &self,
        inbox_id: &str,
        attachment_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<CompleteAttachmentsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!(
                    "v1/inboxes/{}/attachments/{}/complete",
                    inbox_id, attachment_id
                ),
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
    ///         .attachments
    ///         .download(&"inboxId".to_string(), &"attachmentId".to_string(), None)
    ///         .await;
    /// }
    /// ```
    pub async fn download(
        &self,
        inbox_id: &str,
        attachment_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<DownloadAttachmentsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!(
                    "v1/inboxes/{}/attachments/{}/download",
                    inbox_id, attachment_id
                ),
                None,
                None,
                options,
            )
            .await
    }
}
