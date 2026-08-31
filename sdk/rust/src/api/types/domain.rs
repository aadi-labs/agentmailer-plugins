pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Domain {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "podId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
    #[serde(default)]
    pub domain: String,
    pub status: DomainStatus,
    #[serde(default)]
    pub records: Vec<DomainRecordsItem>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl Domain {
    pub fn builder() -> DomainBuilder {
        <DomainBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DomainBuilder {
    id: Option<String>,
    pod_id: Option<String>,
    domain: Option<String>,
    status: Option<DomainStatus>,
    records: Option<Vec<DomainRecordsItem>>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl DomainBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn domain(mut self, value: impl Into<String>) -> Self {
        self.domain = Some(value.into());
        self
    }

    pub fn status(mut self, value: DomainStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn records(mut self, value: Vec<DomainRecordsItem>) -> Self {
        self.records = Some(value);
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

    /// Consumes the builder and constructs a [`Domain`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](DomainBuilder::id)
    /// - [`domain`](DomainBuilder::domain)
    /// - [`status`](DomainBuilder::status)
    /// - [`records`](DomainBuilder::records)
    /// - [`created_at`](DomainBuilder::created_at)
    /// - [`updated_at`](DomainBuilder::updated_at)
    pub fn build(self) -> Result<Domain, BuildError> {
        Ok(Domain {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            pod_id: self.pod_id,
            domain: self
                .domain
                .ok_or_else(|| BuildError::missing_field("domain"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            records: self
                .records
                .ok_or_else(|| BuildError::missing_field("records"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
