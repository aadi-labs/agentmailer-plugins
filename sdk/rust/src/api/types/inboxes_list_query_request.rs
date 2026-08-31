pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct InboxesListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub limit: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub page_token: Option<String>,
}

impl InboxesListQueryRequest {
    pub fn builder() -> InboxesListQueryRequestBuilder {
        <InboxesListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct InboxesListQueryRequestBuilder {
    limit: Option<i64>,
    page_token: Option<String>,
}

impl InboxesListQueryRequestBuilder {
    pub fn limit(mut self, value: i64) -> Self {
        self.limit = Some(value);
        self
    }

    pub fn page_token(mut self, value: impl Into<String>) -> Self {
        self.page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`InboxesListQueryRequest`].
    pub fn build(self) -> Result<InboxesListQueryRequest, BuildError> {
        Ok(InboxesListQueryRequest {
            limit: self.limit,
            page_token: self.page_token,
        })
    }
}
