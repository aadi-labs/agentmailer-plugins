pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct UpdatePodsResponse {
    #[serde(default)]
    pub pod: Pod,
}

impl UpdatePodsResponse {
    pub fn builder() -> UpdatePodsResponseBuilder {
        <UpdatePodsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdatePodsResponseBuilder {
    pod: Option<Pod>,
}

impl UpdatePodsResponseBuilder {
    pub fn pod(mut self, value: Pod) -> Self {
        self.pod = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdatePodsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod`](UpdatePodsResponseBuilder::pod)
    pub fn build(self) -> Result<UpdatePodsResponse, BuildError> {
        Ok(UpdatePodsResponse {
            pod: self.pod.ok_or_else(|| BuildError::missing_field("pod"))?,
        })
    }
}
