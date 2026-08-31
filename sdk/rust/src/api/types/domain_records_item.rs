pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct DomainRecordsItem {
    pub r#type: DomainRecordsItemType,
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub value: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub priority: Option<i64>,
}

impl DomainRecordsItem {
    pub fn builder() -> DomainRecordsItemBuilder {
        <DomainRecordsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DomainRecordsItemBuilder {
    r#type: Option<DomainRecordsItemType>,
    name: Option<String>,
    value: Option<String>,
    priority: Option<i64>,
}

impl DomainRecordsItemBuilder {
    pub fn r#type(mut self, value: DomainRecordsItemType) -> Self {
        self.r#type = Some(value);
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn value(mut self, value: impl Into<String>) -> Self {
        self.value = Some(value.into());
        self
    }

    pub fn priority(mut self, value: i64) -> Self {
        self.priority = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DomainRecordsItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`r#type`](DomainRecordsItemBuilder::r#type)
    /// - [`name`](DomainRecordsItemBuilder::name)
    /// - [`value`](DomainRecordsItemBuilder::value)
    pub fn build(self) -> Result<DomainRecordsItem, BuildError> {
        Ok(DomainRecordsItem {
            r#type: self
                .r#type
                .ok_or_else(|| BuildError::missing_field("r#type"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            value: self
                .value
                .ok_or_else(|| BuildError::missing_field("value"))?,
            priority: self.priority,
        })
    }
}
