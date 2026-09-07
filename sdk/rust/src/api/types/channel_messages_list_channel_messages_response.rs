pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListChannelMessagesResponse {
    #[serde(default)]
    pub messages: Vec<ChannelMessage>,
    #[serde(rename = "nextPageToken")]
    #[serde(default)]
    pub next_page_token: String,
}

impl ListChannelMessagesResponse {
    pub fn builder() -> ListChannelMessagesResponseBuilder {
        <ListChannelMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListChannelMessagesResponseBuilder {
    messages: Option<Vec<ChannelMessage>>,
    next_page_token: Option<String>,
}

impl ListChannelMessagesResponseBuilder {
    pub fn messages(mut self, value: Vec<ChannelMessage>) -> Self {
        self.messages = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListChannelMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`messages`](ListChannelMessagesResponseBuilder::messages)
    /// - [`next_page_token`](ListChannelMessagesResponseBuilder::next_page_token)
    pub fn build(self) -> Result<ListChannelMessagesResponse, BuildError> {
        Ok(ListChannelMessagesResponse {
            messages: self
                .messages
                .ok_or_else(|| BuildError::missing_field("messages"))?,
            next_page_token: self
                .next_page_token
                .ok_or_else(|| BuildError::missing_field("next_page_token"))?,
        })
    }
}
