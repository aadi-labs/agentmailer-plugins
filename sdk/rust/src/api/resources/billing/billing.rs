use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct BillingClient {
    pub http_client: HttpClient,
}

impl BillingClient {
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
    ///     client.billing.get(None).await;
    /// }
    /// ```
    pub async fn get(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<GetBillingResponse, ApiError> {
        self.http_client
            .execute_request(Method::GET, "v1/billing", None, None, options)
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
    ///         .billing
    ///         .create_checkout(
    ///             &BillingSelection {
    ///                 ..Default::default()
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create_checkout(
        &self,
        request: &BillingSelection,
        options: Option<RequestOptions>,
    ) -> Result<CreateCheckoutBillingResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/billing/checkout",
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
    ///     client.billing.create_portal(None).await;
    /// }
    /// ```
    pub async fn create_portal(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<CreatePortalBillingResponse, ApiError> {
        self.http_client
            .execute_request(Method::POST, "v1/billing/portal", None, None, options)
            .await
    }
}
