pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct UpdateChannelConversationsResponse {
    pub conversation: ChannelConversation,
}

impl UpdateChannelConversationsResponse {
    pub fn builder() -> UpdateChannelConversationsResponseBuilder {
        <UpdateChannelConversationsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateChannelConversationsResponseBuilder {
    conversation: Option<ChannelConversation>,
}

impl UpdateChannelConversationsResponseBuilder {
    pub fn conversation(mut self, value: ChannelConversation) -> Self {
        self.conversation = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateChannelConversationsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`conversation`](UpdateChannelConversationsResponseBuilder::conversation)
    pub fn build(self) -> Result<UpdateChannelConversationsResponse, BuildError> {
        Ok(UpdateChannelConversationsResponse {
            conversation: self
                .conversation
                .ok_or_else(|| BuildError::missing_field("conversation"))?,
        })
    }
}
