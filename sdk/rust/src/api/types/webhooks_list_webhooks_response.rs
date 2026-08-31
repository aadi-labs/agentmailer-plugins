pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListWebhooksResponse {
    #[serde(default)]
    pub webhooks: Vec<Webhook>,
}

impl ListWebhooksResponse {
    pub fn builder() -> ListWebhooksResponseBuilder {
        <ListWebhooksResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListWebhooksResponseBuilder {
    webhooks: Option<Vec<Webhook>>,
}

impl ListWebhooksResponseBuilder {
    pub fn webhooks(mut self, value: Vec<Webhook>) -> Self {
        self.webhooks = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListWebhooksResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`webhooks`](ListWebhooksResponseBuilder::webhooks)
    pub fn build(self) -> Result<ListWebhooksResponse, BuildError> {
        Ok(ListWebhooksResponse {
            webhooks: self
                .webhooks
                .ok_or_else(|| BuildError::missing_field("webhooks"))?,
        })
    }
}
