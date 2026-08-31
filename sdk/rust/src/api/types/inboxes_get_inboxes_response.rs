pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct GetInboxesResponse {
    pub inbox: Inbox,
}

impl GetInboxesResponse {
    pub fn builder() -> GetInboxesResponseBuilder {
        <GetInboxesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetInboxesResponseBuilder {
    inbox: Option<Inbox>,
}

impl GetInboxesResponseBuilder {
    pub fn inbox(mut self, value: Inbox) -> Self {
        self.inbox = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetInboxesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inbox`](GetInboxesResponseBuilder::inbox)
    pub fn build(self) -> Result<GetInboxesResponse, BuildError> {
        Ok(GetInboxesResponse {
            inbox: self
                .inbox
                .ok_or_else(|| BuildError::missing_field("inbox"))?,
        })
    }
}
