pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct GetMessagesResponse {
    pub message: Message,
}

impl GetMessagesResponse {
    pub fn builder() -> GetMessagesResponseBuilder {
        <GetMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetMessagesResponseBuilder {
    message: Option<Message>,
}

impl GetMessagesResponseBuilder {
    pub fn message(mut self, value: Message) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](GetMessagesResponseBuilder::message)
    pub fn build(self) -> Result<GetMessagesResponse, BuildError> {
        Ok(GetMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
        })
    }
}
