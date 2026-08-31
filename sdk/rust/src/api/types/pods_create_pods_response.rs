pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreatePodsResponse {
    #[serde(default)]
    pub pod: Pod,
}

impl CreatePodsResponse {
    pub fn builder() -> CreatePodsResponseBuilder {
        <CreatePodsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreatePodsResponseBuilder {
    pod: Option<Pod>,
}

impl CreatePodsResponseBuilder {
    pub fn pod(mut self, value: Pod) -> Self {
        self.pod = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreatePodsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod`](CreatePodsResponseBuilder::pod)
    pub fn build(self) -> Result<CreatePodsResponse, BuildError> {
        Ok(CreatePodsResponse {
            pod: self.pod.ok_or_else(|| BuildError::missing_field("pod"))?,
        })
    }
}
