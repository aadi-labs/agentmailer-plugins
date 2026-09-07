pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelEndpointCreate {
    #[serde(rename = "inboxId")]
    #[serde(default)]
    pub inbox_id: String,
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    pub channel: ChannelEndpointCreateChannel,
}

impl ChannelEndpointCreate {
    pub fn builder() -> ChannelEndpointCreateBuilder {
        <ChannelEndpointCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelEndpointCreateBuilder {
    inbox_id: Option<String>,
    pod_id: Option<String>,
    channel: Option<ChannelEndpointCreateChannel>,
}

impl ChannelEndpointCreateBuilder {
    pub fn inbox_id(mut self, value: impl Into<String>) -> Self {
        self.inbox_id = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ChannelEndpointCreateChannel) -> Self {
        self.channel = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelEndpointCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inbox_id`](ChannelEndpointCreateBuilder::inbox_id)
    /// - [`pod_id`](ChannelEndpointCreateBuilder::pod_id)
    /// - [`channel`](ChannelEndpointCreateBuilder::channel)
    pub fn build(self) -> Result<ChannelEndpointCreate, BuildError> {
        Ok(ChannelEndpointCreate {
            inbox_id: self
                .inbox_id
                .ok_or_else(|| BuildError::missing_field("inbox_id"))?,
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            channel: self
                .channel
                .ok_or_else(|| BuildError::missing_field("channel"))?,
        })
    }
}
