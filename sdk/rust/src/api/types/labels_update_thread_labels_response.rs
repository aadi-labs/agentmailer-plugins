pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct UpdateThreadLabelsResponse {
    #[serde(default)]
    pub labels: Vec<String>,
}

impl UpdateThreadLabelsResponse {
    pub fn builder() -> UpdateThreadLabelsResponseBuilder {
        <UpdateThreadLabelsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateThreadLabelsResponseBuilder {
    labels: Option<Vec<String>>,
}

impl UpdateThreadLabelsResponseBuilder {
    pub fn labels(mut self, value: Vec<String>) -> Self {
        self.labels = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateThreadLabelsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`labels`](UpdateThreadLabelsResponseBuilder::labels)
    pub fn build(self) -> Result<UpdateThreadLabelsResponse, BuildError> {
        Ok(UpdateThreadLabelsResponse {
            labels: self
                .labels
                .ok_or_else(|| BuildError::missing_field("labels"))?,
        })
    }
}
