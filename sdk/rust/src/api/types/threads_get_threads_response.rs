pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct GetThreadsResponse {
    #[serde(default)]
    pub thread: Thread,
    #[serde(default)]
    pub messages: Vec<Message>,
}

impl GetThreadsResponse {
    pub fn builder() -> GetThreadsResponseBuilder {
        <GetThreadsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetThreadsResponseBuilder {
    thread: Option<Thread>,
    messages: Option<Vec<Message>>,
}

impl GetThreadsResponseBuilder {
    pub fn thread(mut self, value: Thread) -> Self {
        self.thread = Some(value);
        self
    }

    pub fn messages(mut self, value: Vec<Message>) -> Self {
        self.messages = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetThreadsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`thread`](GetThreadsResponseBuilder::thread)
    /// - [`messages`](GetThreadsResponseBuilder::messages)
    pub fn build(self) -> Result<GetThreadsResponse, BuildError> {
        Ok(GetThreadsResponse {
            thread: self
                .thread
                .ok_or_else(|| BuildError::missing_field("thread"))?,
            messages: self
                .messages
                .ok_or_else(|| BuildError::missing_field("messages"))?,
        })
    }
}
