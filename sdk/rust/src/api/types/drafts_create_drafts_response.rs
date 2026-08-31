pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct CreateDraftsResponse {
    #[serde(default)]
    pub draft: Draft,
}

impl CreateDraftsResponse {
    pub fn builder() -> CreateDraftsResponseBuilder {
        <CreateDraftsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateDraftsResponseBuilder {
    draft: Option<Draft>,
}

impl CreateDraftsResponseBuilder {
    pub fn draft(mut self, value: Draft) -> Self {
        self.draft = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateDraftsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`draft`](CreateDraftsResponseBuilder::draft)
    pub fn build(self) -> Result<CreateDraftsResponse, BuildError> {
        Ok(CreateDraftsResponse {
            draft: self
                .draft
                .ok_or_else(|| BuildError::missing_field("draft"))?,
        })
    }
}
