pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct UpdateDraftsResponse {
    #[serde(default)]
    pub draft: Draft,
}

impl UpdateDraftsResponse {
    pub fn builder() -> UpdateDraftsResponseBuilder {
        <UpdateDraftsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateDraftsResponseBuilder {
    draft: Option<Draft>,
}

impl UpdateDraftsResponseBuilder {
    pub fn draft(mut self, value: Draft) -> Self {
        self.draft = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateDraftsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`draft`](UpdateDraftsResponseBuilder::draft)
    pub fn build(self) -> Result<UpdateDraftsResponse, BuildError> {
        Ok(UpdateDraftsResponse {
            draft: self
                .draft
                .ok_or_else(|| BuildError::missing_field("draft"))?,
        })
    }
}
