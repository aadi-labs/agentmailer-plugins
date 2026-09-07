pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListChannelConversationsResponse {
    #[serde(default)]
    pub conversations: Vec<ChannelConversation>,
    #[serde(rename = "nextPageToken")]
    #[serde(default)]
    pub next_page_token: String,
}

impl ListChannelConversationsResponse {
    pub fn builder() -> ListChannelConversationsResponseBuilder {
        <ListChannelConversationsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListChannelConversationsResponseBuilder {
    conversations: Option<Vec<ChannelConversation>>,
    next_page_token: Option<String>,
}

impl ListChannelConversationsResponseBuilder {
    pub fn conversations(mut self, value: Vec<ChannelConversation>) -> Self {
        self.conversations = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListChannelConversationsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`conversations`](ListChannelConversationsResponseBuilder::conversations)
    /// - [`next_page_token`](ListChannelConversationsResponseBuilder::next_page_token)
    pub fn build(self) -> Result<ListChannelConversationsResponse, BuildError> {
        Ok(ListChannelConversationsResponse {
            conversations: self
                .conversations
                .ok_or_else(|| BuildError::missing_field("conversations"))?,
            next_page_token: self
                .next_page_token
                .ok_or_else(|| BuildError::missing_field("next_page_token"))?,
        })
    }
}
