pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct ReplyAllMessagesResponse {
    pub message: Message,
}

impl ReplyAllMessagesResponse {
    pub fn builder() -> ReplyAllMessagesResponseBuilder {
        <ReplyAllMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ReplyAllMessagesResponseBuilder {
    message: Option<Message>,
}

impl ReplyAllMessagesResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ReplyAllMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](ReplyAllMessagesResponseBuilder::message)
    pub fn build(self) -> Result<ReplyAllMessagesResponse, BuildError> {
        Ok(ReplyAllMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
