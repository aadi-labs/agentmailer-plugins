pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct UpdateInboxesResponse {
    pub inbox: Inbox,
}

impl UpdateInboxesResponse {
    pub fn builder() -> UpdateInboxesResponseBuilder {
        <UpdateInboxesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateInboxesResponseBuilder {
    inbox: Option<Inbox>,
}

impl UpdateInboxesResponseBuilder {
    pub fn inbox(mut self, value: Inbox) -> Self {
        self.inbox = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateInboxesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inbox`](UpdateInboxesResponseBuilder::inbox)
    pub fn build(self) -> Result<UpdateInboxesResponse, BuildError> {
        Ok(UpdateInboxesResponse {
            inbox: self
                .inbox
                .ok_or_else(|| BuildError::missing_field("inbox"))?,
        })
    }
}
