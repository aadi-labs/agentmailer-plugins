pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct WebhookUpdate {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub url: Option<String>,
    #[serde(rename = "eventTypes")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub event_types: Option<Vec<WebhookUpdateEventTypesItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub enabled: Option<bool>,
}

impl WebhookUpdate {
    pub fn builder() -> WebhookUpdateBuilder {
        <WebhookUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct WebhookUpdateBuilder {
    url: Option<String>,
    event_types: Option<Vec<WebhookUpdateEventTypesItem>>,
    description: Option<String>,
    enabled: Option<bool>,
}

impl WebhookUpdateBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn event_types(mut self, value: Vec<WebhookUpdateEventTypesItem>) -> Self {
        self.event_types = Some(value);
        self
    }

    pub fn description(mut self, value: impl Into<String>) -> Self {
        self.description = Some(value.into());
        self
    }

    pub fn enabled(mut self, value: bool) -> Self {
        self.enabled = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`WebhookUpdate`].
    pub fn build(self) -> Result<WebhookUpdate, BuildError> {
        Ok(WebhookUpdate {
            url: self.url,
            event_types: self.event_types,
            description: self.description,
            enabled: self.enabled,
        })
    }
}
