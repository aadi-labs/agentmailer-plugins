pub use crate::prelude::*;

/// Query parameters for removeEntry
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct RemoveEntryQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub address_pattern: Option<String>,
}

impl RemoveEntryQueryRequest {
    pub fn builder() -> RemoveEntryQueryRequestBuilder {
        <RemoveEntryQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct RemoveEntryQueryRequestBuilder {
    address_pattern: Option<String>,
}

impl RemoveEntryQueryRequestBuilder {
    pub fn address_pattern(mut self, value: impl Into<String>) -> Self {
        self.address_pattern = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`RemoveEntryQueryRequest`].
    pub fn build(self) -> Result<RemoveEntryQueryRequest, BuildError> {
        Ok(RemoveEntryQueryRequest {
            address_pattern: self.address_pattern,
        })
    }
}
