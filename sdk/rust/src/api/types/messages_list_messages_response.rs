pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListMessagesResponse {
    #[serde(default)]
    pub messages: Vec<Message>,
    #[serde(rename = "nextPageToken")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub next_page_token: Option<String>,
}

impl ListMessagesResponse {
    pub fn builder() -> ListMessagesResponseBuilder {
        <ListMessagesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListMessagesResponseBuilder {
    messages: Option<Vec<Message>>,
    next_page_token: Option<String>,
}

impl ListMessagesResponseBuilder {
    pub fn messages(mut self, value: Vec<Message>) -> Self {
        self.messages = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListMessagesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`messages`](ListMessagesResponseBuilder::messages)
    pub fn build(self) -> Result<ListMessagesResponse, BuildError> {
        Ok(ListMessagesResponse {
            messages: self
                .messages
                .ok_or_else(|| BuildError::missing_field("messages"))?,
            next_page_token: self.next_page_token,
        })
    }
}
