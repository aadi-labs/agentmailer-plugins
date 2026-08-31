pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct ForwardMessagesResponse {
    pub message: Message,
}

impl ForwardMessagesResponse {
    pub fn builder() -> ForwardMessagesResponseBuilder {
        <ForwardMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ForwardMessagesResponseBuilder {
    message: Option<Message>,
}

impl ForwardMessagesResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ForwardMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](ForwardMessagesResponseBuilder::message)
    pub fn build(self) -> Result<ForwardMessagesResponse, BuildError> {
        Ok(ForwardMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
