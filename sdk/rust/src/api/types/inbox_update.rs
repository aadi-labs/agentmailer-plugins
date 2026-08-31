pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct InboxUpdate {
    #[serde(rename = "displayName")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub display_name: Option<String>,
    #[serde(rename = "clientId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub client_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, Option<InboxUpdateMetadataValue>>>,
}

impl InboxUpdate {
    pub fn builder() -> InboxUpdateBuilder {
        <InboxUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct InboxUpdateBuilder {
    display_name: Option<String>,
    client_id: Option<String>,
    metadata: Option<HashMap<String, Option<InboxUpdateMetadataValue>>>,
}

impl InboxUpdateBuilder {
    pub fn display_name(mut self, value: impl Into<String>) -> Self {
        self.display_name = Some(value.into());
        self
    }

    pub fn client_id(mut self, value: impl Into<String>) -> Self {
        self.client_id = Some(value.into());
        self
    }

    pub fn metadata(mut self, value: HashMap<String, Option<InboxUpdateMetadataValue>>) -> Self {
        self.metadata = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`InboxUpdate`].
    pub fn build(self) -> Result<InboxUpdate, BuildError> {
        Ok(InboxUpdate {
            display_name: self.display_name,
            client_id: self.client_id,
            metadata: self.metadata,
        })
    }
}
