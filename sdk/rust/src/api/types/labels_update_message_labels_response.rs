pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct UpdateMessageLabelsResponse {
    #[serde(default)]
    pub labels: Vec<String>,
}

impl UpdateMessageLabelsResponse {
    pub fn builder() -> UpdateMessageLabelsResponseBuilder {
        <UpdateMessageLabelsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateMessageLabelsResponseBuilder {
    labels: Option<Vec<String>>,
}

impl UpdateMessageLabelsResponseBuilder {
    pub fn labels(mut self, value: Vec<String>) -> Self {
        self.labels = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateMessageLabelsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`labels`](UpdateMessageLabelsResponseBuilder::labels)
    pub fn build(self) -> Result<UpdateMessageLabelsResponse, BuildError> {
        Ok(UpdateMessageLabelsResponse {
            labels: self
                .labels
                .ok_or_else(|| BuildError::missing_field("labels"))?,
        })
    }
}
