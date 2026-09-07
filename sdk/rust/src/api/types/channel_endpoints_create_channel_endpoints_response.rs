pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct CreateChannelEndpointsResponse {
    pub endpoint: ChannelEndpoint,
}

impl CreateChannelEndpointsResponse {
    pub fn builder() -> CreateChannelEndpointsResponseBuilder {
        <CreateChannelEndpointsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateChannelEndpointsResponseBuilder {
    endpoint: Option<ChannelEndpoint>,
}

impl CreateChannelEndpointsResponseBuilder {
    pub fn endpoint(mut self, value: ChannelEndpoint) -> Self {
        self.endpoint = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateChannelEndpointsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`endpoint`](CreateChannelEndpointsResponseBuilder::endpoint)
    pub fn build(self) -> Result<CreateChannelEndpointsResponse, BuildError> {
        Ok(CreateChannelEndpointsResponse {
            endpoint: self
                .endpoint
                .ok_or_else(|| BuildError::missing_field("endpoint"))?,
        })
    }
}
