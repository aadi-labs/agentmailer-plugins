pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct UpdateWebhooksResponse {
    pub webhook: Webhook,
}

impl UpdateWebhooksResponse {
    pub fn builder() -> UpdateWebhooksResponseBuilder {
        <UpdateWebhooksResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateWebhooksResponseBuilder {
    webhook: Option<Webhook>,
}

impl UpdateWebhooksResponseBuilder {
    pub fn webhook(mut self, value: Webhook) -> Self {
        self.webhook = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateWebhooksResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`webhook`](UpdateWebhooksResponseBuilder::webhook)
    pub fn build(self) -> Result<UpdateWebhooksResponse, BuildError> {
        Ok(UpdateWebhooksResponse {
            webhook: self
                .webhook
                .ok_or_else(|| BuildError::missing_field("webhook"))?,
        })
    }
}
