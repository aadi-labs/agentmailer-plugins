pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct CreateListsResponse {
    pub list: List,
}

impl CreateListsResponse {
    pub fn builder() -> CreateListsResponseBuilder {
        <CreateListsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateListsResponseBuilder {
    list: Option<List>,
}

impl CreateListsResponseBuilder {
    pub fn list(mut self, value: List) -> Self {
        self.list = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateListsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`list`](CreateListsResponseBuilder::list)
    pub fn build(self) -> Result<CreateListsResponse, BuildError> {
        Ok(CreateListsResponse {
            list: self.list.ok_or_else(|| BuildError::missing_field("list"))?,
        })
    }
}
