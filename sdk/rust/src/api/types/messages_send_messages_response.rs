pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct SendMessagesResponse {
    pub message: Message,
}

impl SendMessagesResponse {
    pub fn builder() -> SendMessagesResponseBuilder {
        <SendMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct SendMessagesResponseBuilder {
    message: Option<Message>,
}

impl SendMessagesResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`SendMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](SendMessagesResponseBuilder::message)
    pub fn build(self) -> Result<SendMessagesResponse, BuildError> {
        Ok(SendMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
