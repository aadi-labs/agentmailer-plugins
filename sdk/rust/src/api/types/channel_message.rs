pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct ChannelMessage {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "endpointId")]
    #[serde(default)]
    pub endpoint_id: String,
    #[serde(rename = "conversationId")]
    #[serde(default)]
    pub conversation_id: String,
    pub channel: ChannelMessageChannel,
    pub direction: ChannelMessageDirection,
    pub status: ChannelMessageStatus,
    #[serde(default)]
    pub from: String,
    #[serde(default)]
    pub to: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(rename = "mediaUrls")]
    #[serde(default)]
    pub media_urls: Vec<String>,
    #[serde(rename = "attachmentIds")]
    #[serde(default)]
    pub attachment_ids: Vec<serde_json::Value>,
    #[serde(rename = "providerMessageId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub provider_message_id: Option<String>,
    #[serde(rename = "failureCode")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub failure_code: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub safety: Option<ChannelMessageSafety>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "sentAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub sent_at: Option<DateTime<FixedOffset>>,
    #[serde(rename = "receivedAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub received_at: Option<DateTime<FixedOffset>>,
}

impl ChannelMessage {
    pub fn builder() -> ChannelMessageBuilder {
        <ChannelMessageBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageBuilder {
    id: Option<String>,
    endpoint_id: Option<String>,
    conversation_id: Option<String>,
    channel: Option<ChannelMessageChannel>,
    direction: Option<ChannelMessageDirection>,
    status: Option<ChannelMessageStatus>,
    from: Option<String>,
    to: Option<String>,
    text: Option<String>,
    media_urls: Option<Vec<String>>,
    attachment_ids: Option<Vec<serde_json::Value>>,
    provider_message_id: Option<String>,
    failure_code: Option<String>,
    safety: Option<ChannelMessageSafety>,
    created_at: Option<DateTime<FixedOffset>>,
    sent_at: Option<DateTime<FixedOffset>>,
    received_at: Option<DateTime<FixedOffset>>,
}

impl ChannelMessageBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn endpoint_id(mut self, value: impl Into<String>) -> Self {
        self.endpoint_id = Some(value.into());
        self
    }

    pub fn conversation_id(mut self, value: impl Into<String>) -> Self {
        self.conversation_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ChannelMessageChannel) -> Self {
        self.channel = Some(value);
        self
    }

    pub fn direction(mut self, value: ChannelMessageDirection) -> Self {
        self.direction = Some(value);
        self
    }

    pub fn status(mut self, value: ChannelMessageStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn from(mut self, value: impl Into<String>) -> Self {
        self.from = Some(value.into());
        self
    }

    pub fn to(mut self, value: impl Into<String>) -> Self {
        self.to = Some(value.into());
        self
    }

    pub fn text(mut self, value: impl Into<String>) -> Self {
        self.text = Some(value.into());
        self
    }

    pub fn media_urls(mut self, value: Vec<String>) -> Self {
        self.media_urls = Some(value);
        self
    }

    pub fn attachment_ids(mut self, value: Vec<serde_json::Value>) -> Self {
        self.attachment_ids = Some(value);
        self
    }

    pub fn provider_message_id(mut self, value: impl Into<String>) -> Self {
        self.provider_message_id = Some(value.into());
        self
    }

    pub fn failure_code(mut self, value: impl Into<String>) -> Self {
        self.failure_code = Some(value.into());
        self
    }

    pub fn safety(mut self, value: ChannelMessageSafety) -> Self {
        self.safety = Some(value);
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    pub fn sent_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.sent_at = Some(value);
        self
    }

    pub fn received_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.received_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessage`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](ChannelMessageBuilder::id)
    /// - [`endpoint_id`](ChannelMessageBuilder::endpoint_id)
    /// - [`conversation_id`](ChannelMessageBuilder::conversation_id)
    /// - [`channel`](ChannelMessageBuilder::channel)
    /// - [`direction`](ChannelMessageBuilder::direction)
    /// - [`status`](ChannelMessageBuilder::status)
    /// - [`from`](ChannelMessageBuilder::from)
    /// - [`to`](ChannelMessageBuilder::to)
    /// - [`media_urls`](ChannelMessageBuilder::media_urls)
    /// - [`attachment_ids`](ChannelMessageBuilder::attachment_ids)
    /// - [`created_at`](ChannelMessageBuilder::created_at)
    pub fn build(self) -> Result<ChannelMessage, BuildError> {
        Ok(ChannelMessage {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            endpoint_id: self
                .endpoint_id
                .ok_or_else(|| BuildError::missing_field("endpoint_id"))?,
            conversation_id: self
                .conversation_id
                .ok_or_else(|| BuildError::missing_field("conversation_id"))?,
            channel: self
                .channel
                .ok_or_else(|| BuildError::missing_field("channel"))?,
            direction: self
                .direction
                .ok_or_else(|| BuildError::missing_field("direction"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            from: self.from.ok_or_else(|| BuildError::missing_field("from"))?,
            to: self.to.ok_or_else(|| BuildError::missing_field("to"))?,
            text: self.text,
            media_urls: self
                .media_urls
                .ok_or_else(|| BuildError::missing_field("media_urls"))?,
            attachment_ids: self
                .attachment_ids
                .ok_or_else(|| BuildError::missing_field("attachment_ids"))?,
            provider_message_id: self.provider_message_id,
            failure_code: self.failure_code,
            safety: self.safety,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            sent_at: self.sent_at,
            received_at: self.received_at,
        })
    }
}
