pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct WebhookCreate {
    #[serde(default)]
    pub url: String,
    #[serde(rename = "podId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
    #[serde(rename = "inboxId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub inbox_id: Option<String>,
    #[serde(rename = "eventTypes")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub event_types: Option<Vec<WebhookCreateEventTypesItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
}

impl WebhookCreate {
    pub fn builder() -> WebhookCreateBuilder {
        <WebhookCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct WebhookCreateBuilder {
    url: Option<String>,
    pod_id: Option<String>,
    inbox_id: Option<String>,
    event_types: Option<Vec<WebhookCreateEventTypesItem>>,
    description: Option<String>,
}

impl WebhookCreateBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn inbox_id(mut self, value: impl Into<String>) -> Self {
        self.inbox_id = Some(value.into());
        self
    }

    pub fn event_types(mut self, value: Vec<WebhookCreateEventTypesItem>) -> Self {
        self.event_types = Some(value);
        self
    }

    pub fn description(mut self, value: impl Into<String>) -> Self {
        self.description = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`WebhookCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](WebhookCreateBuilder::url)
    pub fn build(self) -> Result<WebhookCreate, BuildError> {
        Ok(WebhookCreate {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
            pod_id: self.pod_id,
            inbox_id: self.inbox_id,
            event_types: self.event_types,
            description: self.description,
        })
    }
}
