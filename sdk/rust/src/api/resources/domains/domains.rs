use crate::api::*;
use crate::{ApiError, ClientConfig, HttpClient, RequestOptions};
use reqwest::Method;

pub struct DomainsClient {
    pub http_client: HttpClient,
}

impl DomainsClient {
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
    ///     client.domains.list(None).await;
    /// }
    /// ```
    pub async fn list(
        &self,
        options: Option<RequestOptions>,
    ) -> Result<ListDomainsResponse, ApiError> {
        self.http_client
            .execute_request(Method::GET, "v1/domains", None, None, options)
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
    ///         .domains
    ///         .create(
    ///             &DomainCreate {
    ///                 domain: "domain".to_string(),
    ///                 pod_id: None,
    ///             },
    ///             None,
    ///         )
    ///         .await;
    /// }
    /// ```
    pub async fn create(
        &self,
        request: &DomainCreate,
        options: Option<RequestOptions>,
    ) -> Result<CreateDomainsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                "v1/domains",
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
    ///     client.domains.get(&"domainId".to_string(), None).await;
    /// }
    /// ```
    pub async fn get(
        &self,
        domain_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<GetDomainsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::GET,
                &format!("v1/domains/{}", domain_id),
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
    ///     client.domains.delete(&"domainId".to_string(), None).await;
    /// }
    /// ```
    pub async fn delete(
        &self,
        domain_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<(), ApiError> {
        self.http_client
            .execute_request(
                Method::DELETE,
                &format!("v1/domains/{}", domain_id),
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
    ///     client.domains.verify(&"domainId".to_string(), None).await;
    /// }
    /// ```
    pub async fn verify(
        &self,
        domain_id: &str,
        options: Option<RequestOptions>,
    ) -> Result<VerifyDomainsResponse, ApiError> {
        self.http_client
            .execute_request(
                Method::POST,
                &format!("v1/domains/{}/verify", domain_id),
                None,
                None,
                options,
            )
            .await
    }
}
