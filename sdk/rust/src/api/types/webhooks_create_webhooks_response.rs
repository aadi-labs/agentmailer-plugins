pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct CreateWebhooksResponse {
    pub webhook: Webhook,
    #[serde(default)]
    pub secret: String,
}

impl CreateWebhooksResponse {
    pub fn builder() -> CreateWebhooksResponseBuilder {
        <CreateWebhooksResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateWebhooksResponseBuilder {
    webhook: Option<Webhook>,
    secret: Option<String>,
}

impl CreateWebhooksResponseBuilder {
    pub fn webhook(mut self, value: Webhook) -> Self {
        self.webhook = Some(value);
        self
    }

    pub fn secret(mut self, value: impl Into<String>) -> Self {
        self.secret = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`CreateWebhooksResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`webhook`](CreateWebhooksResponseBuilder::webhook)
    /// - [`secret`](CreateWebhooksResponseBuilder::secret)
    pub fn build(self) -> Result<CreateWebhooksResponse, BuildError> {
        Ok(CreateWebhooksResponse {
            webhook: self
                .webhook
                .ok_or_else(|| BuildError::missing_field("webhook"))?,
            secret: self
                .secret
                .ok_or_else(|| BuildError::missing_field("secret"))?,
        })
    }
}
