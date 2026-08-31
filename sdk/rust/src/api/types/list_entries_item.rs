pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ListEntriesItem {
    #[serde(rename = "addressPattern")]
    pub address_pattern: serde_json::Value,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,
}

impl ListEntriesItem {
    pub fn builder() -> ListEntriesItemBuilder {
        <ListEntriesItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListEntriesItemBuilder {
    address_pattern: Option<serde_json::Value>,
    note: Option<String>,
}

impl ListEntriesItemBuilder {
    pub fn address_pattern(mut self, value: serde_json::Value) -> Self {
        self.address_pattern = Some(value);
        self
    }

    pub fn note(mut self, value: impl Into<String>) -> Self {
        self.note = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListEntriesItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`address_pattern`](ListEntriesItemBuilder::address_pattern)
    pub fn build(self) -> Result<ListEntriesItem, BuildError> {
        Ok(ListEntriesItem {
            address_pattern: self
                .address_pattern
                .ok_or_else(|| BuildError::missing_field("address_pattern"))?,
            note: self.note,
        })
    }
}
