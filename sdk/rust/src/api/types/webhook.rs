pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Webhook {
    #[serde(default)]
    pub url: String,
    #[serde(rename = "podId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
    #[serde(rename = "inboxId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub inbox_id: Option<String>,
    #[serde(rename = "eventTypes")]
    #[serde(default)]
    pub event_types: Vec<WebhookEventTypesItem>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(default)]
    pub id: String,
    pub status: WebhookStatus,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl Webhook {
    pub fn builder() -> WebhookBuilder {
        <WebhookBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct WebhookBuilder {
    url: Option<String>,
    pod_id: Option<String>,
    inbox_id: Option<String>,
    event_types: Option<Vec<WebhookEventTypesItem>>,
    description: Option<String>,
    id: Option<String>,
    status: Option<WebhookStatus>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl WebhookBuilder {
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

    pub fn event_types(mut self, value: Vec<WebhookEventTypesItem>) -> Self {
        self.event_types = Some(value);
        self
    }

    pub fn description(mut self, value: impl Into<String>) -> Self {
        self.description = Some(value.into());
        self
    }

    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn status(mut self, value: WebhookStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    pub fn updated_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.updated_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Webhook`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](WebhookBuilder::url)
    /// - [`event_types`](WebhookBuilder::event_types)
    /// - [`id`](WebhookBuilder::id)
    /// - [`status`](WebhookBuilder::status)
    /// - [`created_at`](WebhookBuilder::created_at)
    /// - [`updated_at`](WebhookBuilder::updated_at)
    pub fn build(self) -> Result<Webhook, BuildError> {
        Ok(Webhook {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
            pod_id: self.pod_id,
            inbox_id: self.inbox_id,
            event_types: self
                .event_types
                .ok_or_else(|| BuildError::missing_field("event_types"))?,
            description: self.description,
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
