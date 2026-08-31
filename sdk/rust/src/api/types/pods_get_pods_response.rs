pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct GetPodsResponse {
    #[serde(default)]
    pub pod: Pod,
}

impl GetPodsResponse {
    pub fn builder() -> GetPodsResponseBuilder {
        <GetPodsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetPodsResponseBuilder {
    pod: Option<Pod>,
}

impl GetPodsResponseBuilder {
    pub fn pod(mut self, value: Pod) -> Self {
        self.pod = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetPodsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod`](GetPodsResponseBuilder::pod)
    pub fn build(self) -> Result<GetPodsResponse, BuildError> {
        Ok(GetPodsResponse {
            pod: self.pod.ok_or_else(|| BuildError::missing_field("pod"))?,
        })
    }
}
