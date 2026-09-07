pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct UpdateChannelEndpointsResponse {
    pub endpoint: ChannelEndpoint,
}

impl UpdateChannelEndpointsResponse {
    pub fn builder() -> UpdateChannelEndpointsResponseBuilder {
        <UpdateChannelEndpointsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateChannelEndpointsResponseBuilder {
    endpoint: Option<ChannelEndpoint>,
}

impl UpdateChannelEndpointsResponseBuilder {
    pub fn endpoint(mut self, value: ChannelEndpoint) -> Self {
        self.endpoint = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateChannelEndpointsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`endpoint`](UpdateChannelEndpointsResponseBuilder::endpoint)
    pub fn build(self) -> Result<UpdateChannelEndpointsResponse, BuildError> {
        Ok(UpdateChannelEndpointsResponse {
            endpoint: self
                .endpoint
                .ok_or_else(|| BuildError::missing_field("endpoint"))?,
        })
    }
}
