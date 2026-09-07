pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct GetChannelConversationsResponse {
    pub conversation: ChannelConversation,
}

impl GetChannelConversationsResponse {
    pub fn builder() -> GetChannelConversationsResponseBuilder {
        <GetChannelConversationsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetChannelConversationsResponseBuilder {
    conversation: Option<ChannelConversation>,
}

impl GetChannelConversationsResponseBuilder {
    pub fn conversation(mut self, value: ChannelConversation) -> Self {
        self.conversation = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetChannelConversationsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`conversation`](GetChannelConversationsResponseBuilder::conversation)
    pub fn build(self) -> Result<GetChannelConversationsResponse, BuildError> {
        Ok(GetChannelConversationsResponse {
            conversation: self
                .conversation
                .ok_or_else(|| BuildError::missing_field("conversation"))?,
        })
    }
}
