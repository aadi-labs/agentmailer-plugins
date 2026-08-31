pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListsListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
}

impl ListsListQueryRequest {
    pub fn builder() -> ListsListQueryRequestBuilder {
        <ListsListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListsListQueryRequestBuilder {
    pod_id: Option<String>,
}

impl ListsListQueryRequestBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListsListQueryRequest`].
    pub fn build(self) -> Result<ListsListQueryRequest, BuildError> {
        Ok(ListsListQueryRequest {
            pod_id: self.pod_id,
        })
    }
}
