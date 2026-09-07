pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelEndpointUpdate {
    pub status: ChannelEndpointUpdateStatus,
}

impl ChannelEndpointUpdate {
    pub fn builder() -> ChannelEndpointUpdateBuilder {
        <ChannelEndpointUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelEndpointUpdateBuilder {
    status: Option<ChannelEndpointUpdateStatus>,
}

impl ChannelEndpointUpdateBuilder {
    pub fn status(mut self, value: ChannelEndpointUpdateStatus) -> Self {
        self.status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelEndpointUpdate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`status`](ChannelEndpointUpdateBuilder::status)
    pub fn build(self) -> Result<ChannelEndpointUpdate, BuildError> {
        Ok(ChannelEndpointUpdate {
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
        })
    }
}
