pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct RemoveEntryListsResponse {
    pub list: List,
}

impl RemoveEntryListsResponse {
    pub fn builder() -> RemoveEntryListsResponseBuilder {
        <RemoveEntryListsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct RemoveEntryListsResponseBuilder {
    list: Option<List>,
}

impl RemoveEntryListsResponseBuilder {
    pub fn list(mut self, value: List) -> Self {
        self.list = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`RemoveEntryListsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`list`](RemoveEntryListsResponseBuilder::list)
    pub fn build(self) -> Result<RemoveEntryListsResponse, BuildError> {
        Ok(RemoveEntryListsResponse {
            list: self.list.ok_or_else(|| BuildError::missing_field("list"))?,
        })
    }
}
