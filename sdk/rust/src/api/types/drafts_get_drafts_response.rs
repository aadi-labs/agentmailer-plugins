pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct GetDraftsResponse {
    #[serde(default)]
    pub draft: Draft,
}

impl GetDraftsResponse {
    pub fn builder() -> GetDraftsResponseBuilder {
        <GetDraftsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetDraftsResponseBuilder {
    draft: Option<Draft>,
}

impl GetDraftsResponseBuilder {
    pub fn draft(mut self, value: Draft) -> Self {
        self.draft = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetDraftsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`draft`](GetDraftsResponseBuilder::draft)
    pub fn build(self) -> Result<GetDraftsResponse, BuildError> {
        Ok(GetDraftsResponse {
            draft: self
                .draft
                .ok_or_else(|| BuildError::missing_field("draft"))?,
        })
    }
}
