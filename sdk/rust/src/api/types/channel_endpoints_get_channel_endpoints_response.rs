pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct GetChannelEndpointsResponse {
    pub endpoint: ChannelEndpoint,
}

impl GetChannelEndpointsResponse {
    pub fn builder() -> GetChannelEndpointsResponseBuilder {
        <GetChannelEndpointsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetChannelEndpointsResponseBuilder {
    endpoint: Option<ChannelEndpoint>,
}

impl GetChannelEndpointsResponseBuilder {
    pub fn endpoint(mut self, value: ChannelEndpoint) -> Self {
        self.endpoint = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetChannelEndpointsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`endpoint`](GetChannelEndpointsResponseBuilder::endpoint)
    pub fn build(self) -> Result<GetChannelEndpointsResponse, BuildError> {
        Ok(GetChannelEndpointsResponse {
            endpoint: self
                .endpoint
                .ok_or_else(|| BuildError::missing_field("endpoint"))?,
        })
    }
}
