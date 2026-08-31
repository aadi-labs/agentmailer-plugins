pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct InboxCreate {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub username: Option<String>,
    #[serde(rename = "podId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
    #[serde(rename = "domainId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub domain_id: Option<String>,
    #[serde(rename = "clientId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub client_id: Option<String>,
    #[serde(rename = "displayName")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub display_name: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, InboxCreateMetadataValue>>,
}

impl InboxCreate {
    pub fn builder() -> InboxCreateBuilder {
        <InboxCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct InboxCreateBuilder {
    username: Option<String>,
    pod_id: Option<String>,
    domain_id: Option<String>,
    client_id: Option<String>,
    display_name: Option<String>,
    metadata: Option<HashMap<String, InboxCreateMetadataValue>>,
}

impl InboxCreateBuilder {
    pub fn username(mut self, value: impl Into<String>) -> Self {
        self.username = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn domain_id(mut self, value: impl Into<String>) -> Self {
        self.domain_id = Some(value.into());
        self
    }

    pub fn client_id(mut self, value: impl Into<String>) -> Self {
        self.client_id = Some(value.into());
        self
    }

    pub fn display_name(mut self, value: impl Into<String>) -> Self {
        self.display_name = Some(value.into());
        self
    }

    pub fn metadata(mut self, value: HashMap<String, InboxCreateMetadataValue>) -> Self {
        self.metadata = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`InboxCreate`].
    pub fn build(self) -> Result<InboxCreate, BuildError> {
        Ok(InboxCreate {
            username: self.username,
            pod_id: self.pod_id,
            domain_id: self.domain_id,
            client_id: self.client_id,
            display_name: self.display_name,
            metadata: self.metadata,
        })
    }
}
