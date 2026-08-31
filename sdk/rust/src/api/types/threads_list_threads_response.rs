pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListThreadsResponse {
    #[serde(default)]
    pub threads: Vec<Thread>,
    #[serde(rename = "nextPageToken")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub next_page_token: Option<String>,
}

impl ListThreadsResponse {
    pub fn builder() -> ListThreadsResponseBuilder {
        <ListThreadsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListThreadsResponseBuilder {
    threads: Option<Vec<Thread>>,
    next_page_token: Option<String>,
}

impl ListThreadsResponseBuilder {
    pub fn threads(mut self, value: Vec<Thread>) -> Self {
        self.threads = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListThreadsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`threads`](ListThreadsResponseBuilder::threads)
    pub fn build(self) -> Result<ListThreadsResponse, BuildError> {
        Ok(ListThreadsResponse {
            threads: self
                .threads
                .ok_or_else(|| BuildError::missing_field("threads"))?,
            next_page_token: self.next_page_token,
        })
    }
}
