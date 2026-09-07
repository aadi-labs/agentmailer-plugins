pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelEndpoint {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "inboxId")]
    #[serde(default)]
    pub inbox_id: String,
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    pub channel: ChannelEndpointChannel,
    #[serde(default)]
    pub address: String,
    pub status: ChannelEndpointStatus,
    #[serde(default)]
    pub capabilities: Vec<ChannelEndpointCapabilitiesItem>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl ChannelEndpoint {
    pub fn builder() -> ChannelEndpointBuilder {
        <ChannelEndpointBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelEndpointBuilder {
    id: Option<String>,
    inbox_id: Option<String>,
    pod_id: Option<String>,
    channel: Option<ChannelEndpointChannel>,
    address: Option<String>,
    status: Option<ChannelEndpointStatus>,
    capabilities: Option<Vec<ChannelEndpointCapabilitiesItem>>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl ChannelEndpointBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn inbox_id(mut self, value: impl Into<String>) -> Self {
        self.inbox_id = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ChannelEndpointChannel) -> Self {
        self.channel = Some(value);
        self
    }

    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn status(mut self, value: ChannelEndpointStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn capabilities(mut self, value: Vec<ChannelEndpointCapabilitiesItem>) -> Self {
        self.capabilities = Some(value);
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

    /// Consumes the builder and constructs a [`ChannelEndpoint`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](ChannelEndpointBuilder::id)
    /// - [`inbox_id`](ChannelEndpointBuilder::inbox_id)
    /// - [`pod_id`](ChannelEndpointBuilder::pod_id)
    /// - [`channel`](ChannelEndpointBuilder::channel)
    /// - [`address`](ChannelEndpointBuilder::address)
    /// - [`status`](ChannelEndpointBuilder::status)
    /// - [`capabilities`](ChannelEndpointBuilder::capabilities)
    /// - [`created_at`](ChannelEndpointBuilder::created_at)
    /// - [`updated_at`](ChannelEndpointBuilder::updated_at)
    pub fn build(self) -> Result<ChannelEndpoint, BuildError> {
        Ok(ChannelEndpoint {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            inbox_id: self
                .inbox_id
                .ok_or_else(|| BuildError::missing_field("inbox_id"))?,
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            channel: self
                .channel
                .ok_or_else(|| BuildError::missing_field("channel"))?,
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            capabilities: self
                .capabilities
                .ok_or_else(|| BuildError::missing_field("capabilities"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
