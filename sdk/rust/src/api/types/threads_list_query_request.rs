pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ThreadsListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub limit: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub page_token: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub label: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub query: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub before: Option<DateTime<FixedOffset>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub after: Option<DateTime<FixedOffset>>,
}

impl ThreadsListQueryRequest {
    pub fn builder() -> ThreadsListQueryRequestBuilder {
        <ThreadsListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ThreadsListQueryRequestBuilder {
    limit: Option<i64>,
    page_token: Option<String>,
    label: Option<String>,
    query: Option<String>,
    before: Option<DateTime<FixedOffset>>,
    after: Option<DateTime<FixedOffset>>,
}

impl ThreadsListQueryRequestBuilder {
    pub fn limit(mut self, value: i64) -> Self {
        self.limit = Some(value);
        self
    }

    pub fn page_token(mut self, value: impl Into<String>) -> Self {
        self.page_token = Some(value.into());
        self
    }

    pub fn label(mut self, value: impl Into<String>) -> Self {
        self.label = Some(value.into());
        self
    }

    pub fn query(mut self, value: impl Into<String>) -> Self {
        self.query = Some(value.into());
        self
    }

    pub fn before(mut self, value: DateTime<FixedOffset>) -> Self {
        self.before = Some(value);
        self
    }

    pub fn after(mut self, value: DateTime<FixedOffset>) -> Self {
        self.after = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ThreadsListQueryRequest`].
    pub fn build(self) -> Result<ThreadsListQueryRequest, BuildError> {
        Ok(ThreadsListQueryRequest {
            limit: self.limit,
            page_token: self.page_token,
            label: self.label,
            query: self.query,
            before: self.before,
            after: self.after,
        })
    }
}
