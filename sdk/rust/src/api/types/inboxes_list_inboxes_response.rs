pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListInboxesResponse {
    #[serde(default)]
    pub inboxes: Vec<Inbox>,
    #[serde(rename = "nextPageToken")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub next_page_token: Option<String>,
}

impl ListInboxesResponse {
    pub fn builder() -> ListInboxesResponseBuilder {
        <ListInboxesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListInboxesResponseBuilder {
    inboxes: Option<Vec<Inbox>>,
    next_page_token: Option<String>,
}

impl ListInboxesResponseBuilder {
    pub fn inboxes(mut self, value: Vec<Inbox>) -> Self {
        self.inboxes = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListInboxesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inboxes`](ListInboxesResponseBuilder::inboxes)
    pub fn build(self) -> Result<ListInboxesResponse, BuildError> {
        Ok(ListInboxesResponse {
            inboxes: self
                .inboxes
                .ok_or_else(|| BuildError::missing_field("inboxes"))?,
            next_page_token: self.next_page_token,
        })
    }
}
