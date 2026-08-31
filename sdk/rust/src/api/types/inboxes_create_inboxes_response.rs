pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct CreateInboxesResponse {
    pub inbox: Inbox,
}

impl CreateInboxesResponse {
    pub fn builder() -> CreateInboxesResponseBuilder {
        <CreateInboxesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateInboxesResponseBuilder {
    inbox: Option<Inbox>,
}

impl CreateInboxesResponseBuilder {
    pub fn inbox(mut self, value: Inbox) -> Self {
        self.inbox = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateInboxesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inbox`](CreateInboxesResponseBuilder::inbox)
    pub fn build(self) -> Result<CreateInboxesResponse, BuildError> {
        Ok(CreateInboxesResponse {
            inbox: self
                .inbox
                .ok_or_else(|| BuildError::missing_field("inbox"))?,
        })
    }
}
