pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListPodsResponse {
    #[serde(default)]
    pub pods: Vec<Pod>,
}

impl ListPodsResponse {
    pub fn builder() -> ListPodsResponseBuilder {
        <ListPodsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListPodsResponseBuilder {
    pods: Option<Vec<Pod>>,
}

impl ListPodsResponseBuilder {
    pub fn pods(mut self, value: Vec<Pod>) -> Self {
        self.pods = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListPodsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pods`](ListPodsResponseBuilder::pods)
    pub fn build(self) -> Result<ListPodsResponse, BuildError> {
        Ok(ListPodsResponse {
            pods: self.pods.ok_or_else(|| BuildError::missing_field("pods"))?,
        })
    }
}
