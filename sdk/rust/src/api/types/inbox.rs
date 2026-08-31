pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Inbox {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    #[serde(default)]
    pub address: String,
    #[serde(rename = "displayName")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub display_name: Option<String>,
    #[serde(rename = "clientId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub client_id: Option<String>,
    #[serde(default)]
    pub metadata: HashMap<String, InboxMetadataValue>,
    pub status: InboxStatus,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl Inbox {
    pub fn builder() -> InboxBuilder {
        <InboxBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct InboxBuilder {
    id: Option<String>,
    pod_id: Option<String>,
    address: Option<String>,
    display_name: Option<String>,
    client_id: Option<String>,
    metadata: Option<HashMap<String, InboxMetadataValue>>,
    status: Option<InboxStatus>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl InboxBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn display_name(mut self, value: impl Into<String>) -> Self {
        self.display_name = Some(value.into());
        self
    }

    pub fn client_id(mut self, value: impl Into<String>) -> Self {
        self.client_id = Some(value.into());
        self
    }

    pub fn metadata(mut self, value: HashMap<String, InboxMetadataValue>) -> Self {
        self.metadata = Some(value);
        self
    }

    pub fn status(mut self, value: InboxStatus) -> Self {
        self.status = Some(value);
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

    /// Consumes the builder and constructs a [`Inbox`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](InboxBuilder::id)
    /// - [`pod_id`](InboxBuilder::pod_id)
    /// - [`address`](InboxBuilder::address)
    /// - [`metadata`](InboxBuilder::metadata)
    /// - [`status`](InboxBuilder::status)
    /// - [`created_at`](InboxBuilder::created_at)
    /// - [`updated_at`](InboxBuilder::updated_at)
    pub fn build(self) -> Result<Inbox, BuildError> {
        Ok(Inbox {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            display_name: self.display_name,
            client_id: self.client_id,
            metadata: self
                .metadata
                .ok_or_else(|| BuildError::missing_field("metadata"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
