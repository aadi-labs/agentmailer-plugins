pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct ReplyMessagesResponse {
    pub message: Message,
}

impl ReplyMessagesResponse {
    pub fn builder() -> ReplyMessagesResponseBuilder {
        <ReplyMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ReplyMessagesResponseBuilder {
    message: Option<Message>,
}

impl ReplyMessagesResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ReplyMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](ReplyMessagesResponseBuilder::message)
    pub fn build(self) -> Result<ReplyMessagesResponse, BuildError> {
        Ok(ReplyMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
