pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelConversation {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "endpointId")]
    #[serde(default)]
    pub endpoint_id: String,
    pub channel: ChannelConversationChannel,
    #[serde(rename = "remoteAddress")]
    #[serde(default)]
    pub remote_address: String,
    pub status: ChannelConversationStatus,
    #[serde(rename = "messageCount")]
    #[serde(default)]
    pub message_count: i64,
    #[serde(rename = "lastMessageAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub last_message_at: DateTime<FixedOffset>,
    #[serde(rename = "lastInboundAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub last_inbound_at: Option<DateTime<FixedOffset>>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl ChannelConversation {
    pub fn builder() -> ChannelConversationBuilder {
        <ChannelConversationBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelConversationBuilder {
    id: Option<String>,
    endpoint_id: Option<String>,
    channel: Option<ChannelConversationChannel>,
    remote_address: Option<String>,
    status: Option<ChannelConversationStatus>,
    message_count: Option<i64>,
    last_message_at: Option<DateTime<FixedOffset>>,
    last_inbound_at: Option<DateTime<FixedOffset>>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl ChannelConversationBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn endpoint_id(mut self, value: impl Into<String>) -> Self {
        self.endpoint_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ChannelConversationChannel) -> Self {
        self.channel = Some(value);
        self
    }

    pub fn remote_address(mut self, value: impl Into<String>) -> Self {
        self.remote_address = Some(value.into());
        self
    }

    pub fn status(mut self, value: ChannelConversationStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn message_count(mut self, value: i64) -> Self {
        self.message_count = Some(value);
        self
    }

    pub fn last_message_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.last_message_at = Some(value);
        self
    }

    pub fn last_inbound_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.last_inbound_at = Some(value);
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

    /// Consumes the builder and constructs a [`ChannelConversation`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](ChannelConversationBuilder::id)
    /// - [`endpoint_id`](ChannelConversationBuilder::endpoint_id)
    /// - [`channel`](ChannelConversationBuilder::channel)
    /// - [`remote_address`](ChannelConversationBuilder::remote_address)
    /// - [`status`](ChannelConversationBuilder::status)
    /// - [`message_count`](ChannelConversationBuilder::message_count)
    /// - [`last_message_at`](ChannelConversationBuilder::last_message_at)
    /// - [`created_at`](ChannelConversationBuilder::created_at)
    /// - [`updated_at`](ChannelConversationBuilder::updated_at)
    pub fn build(self) -> Result<ChannelConversation, BuildError> {
        Ok(ChannelConversation {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            endpoint_id: self
                .endpoint_id
                .ok_or_else(|| BuildError::missing_field("endpoint_id"))?,
            channel: self
                .channel
                .ok_or_else(|| BuildError::missing_field("channel"))?,
            remote_address: self
                .remote_address
                .ok_or_else(|| BuildError::missing_field("remote_address"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            message_count: self
                .message_count
                .ok_or_else(|| BuildError::missing_field("message_count"))?,
            last_message_at: self
                .last_message_at
                .ok_or_else(|| BuildError::missing_field("last_message_at"))?,
            last_inbound_at: self.last_inbound_at,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
