pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct List {
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    #[serde(default)]
    pub name: String,
    pub kind: ListKind,
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub entries: Vec<ListEntriesItem>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl List {
    pub fn builder() -> ListBuilder {
        <ListBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListBuilder {
    pod_id: Option<String>,
    name: Option<String>,
    kind: Option<ListKind>,
    id: Option<String>,
    entries: Option<Vec<ListEntriesItem>>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl ListBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn kind(mut self, value: ListKind) -> Self {
        self.kind = Some(value);
        self
    }

    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn entries(mut self, value: Vec<ListEntriesItem>) -> Self {
        self.entries = Some(value);
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    pub fn updated_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.updated_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`List`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod_id`](ListBuilder::pod_id)
    /// - [`name`](ListBuilder::name)
    /// - [`kind`](ListBuilder::kind)
    /// - [`id`](ListBuilder::id)
    /// - [`entries`](ListBuilder::entries)
    /// - [`created_at`](ListBuilder::created_at)
    /// - [`updated_at`](ListBuilder::updated_at)
    pub fn build(self) -> Result<List, BuildError> {
        Ok(List {
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            kind: self.kind.ok_or_else(|| BuildError::missing_field("kind"))?,
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            entries: self
                .entries
                .ok_or_else(|| BuildError::missing_field("entries"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
