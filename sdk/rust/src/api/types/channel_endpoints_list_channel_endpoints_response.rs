pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListChannelEndpointsResponse {
    #[serde(default)]
    pub endpoints: Vec<ChannelEndpoint>,
}

impl ListChannelEndpointsResponse {
    pub fn builder() -> ListChannelEndpointsResponseBuilder {
        <ListChannelEndpointsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListChannelEndpointsResponseBuilder {
    endpoints: Option<Vec<ChannelEndpoint>>,
}

impl ListChannelEndpointsResponseBuilder {
    pub fn endpoints(mut self, value: Vec<ChannelEndpoint>) -> Self {
        self.endpoints = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListChannelEndpointsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`endpoints`](ListChannelEndpointsResponseBuilder::endpoints)
    pub fn build(self) -> Result<ListChannelEndpointsResponse, BuildError> {
        Ok(ListChannelEndpointsResponse {
            endpoints: self
                .endpoints
                .ok_or_else(|| BuildError::missing_field("endpoints"))?,
        })
    }
}
