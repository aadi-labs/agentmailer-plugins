pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct SendDraftsResponse {
    pub message: Message,
}

impl SendDraftsResponse {
    pub fn builder() -> SendDraftsResponseBuilder {
        <SendDraftsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct SendDraftsResponseBuilder {
    message: Option<Message>,
}

impl SendDraftsResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`SendDraftsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](SendDraftsResponseBuilder::message)
    pub fn build(self) -> Result<SendDraftsResponse, BuildError> {
        Ok(SendDraftsResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
