pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListDraftsResponse {
    #[serde(default)]
    pub drafts: Vec<Draft>,
}

impl ListDraftsResponse {
    pub fn builder() -> ListDraftsResponseBuilder {
        <ListDraftsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListDraftsResponseBuilder {
    drafts: Option<Vec<Draft>>,
}

impl ListDraftsResponseBuilder {
    pub fn drafts(mut self, value: Vec<Draft>) -> Self {
        self.drafts = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListDraftsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`drafts`](ListDraftsResponseBuilder::drafts)
    pub fn build(self) -> Result<ListDraftsResponse, BuildError> {
        Ok(ListDraftsResponse {
            drafts: self
                .drafts
                .ok_or_else(|| BuildError::missing_field("drafts"))?,
        })
    }
}
