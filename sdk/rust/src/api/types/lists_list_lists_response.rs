pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListListsResponse {
    #[serde(default)]
    pub lists: Vec<List>,
}

impl ListListsResponse {
    pub fn builder() -> ListListsResponseBuilder {
        <ListListsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListListsResponseBuilder {
    lists: Option<Vec<List>>,
}

impl ListListsResponseBuilder {
    pub fn lists(mut self, value: Vec<List>) -> Self {
        self.lists = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListListsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`lists`](ListListsResponseBuilder::lists)
    pub fn build(self) -> Result<ListListsResponse, BuildError> {
        Ok(ListListsResponse {
            lists: self
                .lists
                .ok_or_else(|| BuildError::missing_field("lists"))?,
        })
    }
}
