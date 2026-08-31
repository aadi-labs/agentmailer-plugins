pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListLabelsResponse {
    #[serde(default)]
    pub labels: Vec<Label>,
}

impl ListLabelsResponse {
    pub fn builder() -> ListLabelsResponseBuilder {
        <ListLabelsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListLabelsResponseBuilder {
    labels: Option<Vec<Label>>,
}

impl ListLabelsResponseBuilder {
    pub fn labels(mut self, value: Vec<Label>) -> Self {
        self.labels = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListLabelsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`labels`](ListLabelsResponseBuilder::labels)
    pub fn build(self) -> Result<ListLabelsResponse, BuildError> {
        Ok(ListLabelsResponse {
            labels: self
                .labels
                .ok_or_else(|| BuildError::missing_field("labels"))?,
        })
    }
}
