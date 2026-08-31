pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct AddEntryListsResponse {
    pub list: List,
}

impl AddEntryListsResponse {
    pub fn builder() -> AddEntryListsResponseBuilder {
        <AddEntryListsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct AddEntryListsResponseBuilder {
    list: Option<List>,
}

impl AddEntryListsResponseBuilder {
    pub fn list(mut self, value: List) -> Self {
        self.list = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`AddEntryListsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`list`](AddEntryListsResponseBuilder::list)
    pub fn build(self) -> Result<AddEntryListsResponse, BuildError> {
        Ok(AddEntryListsResponse {
            list: self.list.ok_or_else(|| BuildError::missing_field("list"))?,
        })
    }
}
