pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreateLabelsResponse {
    #[serde(default)]
    pub label: Label,
}

impl CreateLabelsResponse {
    pub fn builder() -> CreateLabelsResponseBuilder {
        <CreateLabelsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateLabelsResponseBuilder {
    label: Option<Label>,
}

impl CreateLabelsResponseBuilder {
    pub fn label(mut self, value: Label) -> Self {
        self.label = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateLabelsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`label`](CreateLabelsResponseBuilder::label)
    pub fn build(self) -> Result<CreateLabelsResponse, BuildError> {
        Ok(CreateLabelsResponse {
            label: self
                .label
                .ok_or_else(|| BuildError::missing_field("label"))?,
        })
    }
}
