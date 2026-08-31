pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListEntry {
    #[serde(rename = "addressPattern")]
    #[serde(default)]
    pub address_pattern: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,
}

impl ListEntry {
    pub fn builder() -> ListEntryBuilder {
        <ListEntryBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListEntryBuilder {
    address_pattern: Option<String>,
    note: Option<String>,
}

impl ListEntryBuilder {
    pub fn address_pattern(mut self, value: impl Into<String>) -> Self {
        self.address_pattern = Some(value.into());
        self
    }

    pub fn note(mut self, value: impl Into<String>) -> Self {
        self.note = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListEntry`].
    /// This method will fail if any of the following fields are not set:
    /// - [`address_pattern`](ListEntryBuilder::address_pattern)
    pub fn build(self) -> Result<ListEntry, BuildError> {
        Ok(ListEntry {
            address_pattern: self
                .address_pattern
                .ok_or_else(|| BuildError::missing_field("address_pattern"))?,
            note: self.note,
        })
    }
}
