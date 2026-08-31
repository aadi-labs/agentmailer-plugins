pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct GetWebhooksResponse {
    pub webhook: Webhook,
}

impl GetWebhooksResponse {
    pub fn builder() -> GetWebhooksResponseBuilder {
        <GetWebhooksResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetWebhooksResponseBuilder {
    webhook: Option<Webhook>,
}

impl GetWebhooksResponseBuilder {
    pub fn webhook(mut self, value: Webhook) -> Self {
        self.webhook = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetWebhooksResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`webhook`](GetWebhooksResponseBuilder::webhook)
    pub fn build(self) -> Result<GetWebhooksResponse, BuildError> {
        Ok(GetWebhooksResponse {
            webhook: self
                .webhook
                .ok_or_else(|| BuildError::missing_field("webhook"))?,
        })
    }
}
