pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct SendChannelMessagesResponse {
    pub message: ChannelMessage,
    #[serde(default)]
    pub replayed: bool,
}

impl SendChannelMessagesResponse {
    pub fn builder() -> SendChannelMessagesResponseBuilder {
        <SendChannelMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct SendChannelMessagesResponseBuilder {
    message: Option<ChannelMessage>,
    replayed: Option<bool>,
}

impl SendChannelMessagesResponseBuilder {
    pub fn message(mut self, value: ChannelMessage) -> Self {
        self.message = Some(value);
        self
    }

    pub fn replayed(mut self, value: bool) -> Self {
        self.replayed = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`SendChannelMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message`](SendChannelMessagesResponseBuilder::message)
    /// - [`replayed`](SendChannelMessagesResponseBuilder::replayed)
    pub fn build(self) -> Result<SendChannelMessagesResponse, BuildError> {
        Ok(SendChannelMessagesResponse {
            message: self
                .message
                .ok_or_else(|| BuildError::missing_field("message"))?,
            replayed: self
                .replayed
                .ok_or_else(|| BuildError::missing_field("replayed"))?,
        })
    }
}
