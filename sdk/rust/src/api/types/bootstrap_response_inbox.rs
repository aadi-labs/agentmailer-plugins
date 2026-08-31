pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct BootstrapResponseInbox {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub address: String,
    pub status: BootstrapResponseInboxStatus,
}

impl BootstrapResponseInbox {
    pub fn builder() -> BootstrapResponseInboxBuilder {
        <BootstrapResponseInboxBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseInboxBuilder {
    id: Option<String>,
    address: Option<String>,
    status: Option<BootstrapResponseInboxStatus>,
}

impl BootstrapResponseInboxBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn status(mut self, value: BootstrapResponseInboxStatus) -> Self {
        self.status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseInbox`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](BootstrapResponseInboxBuilder::id)
    /// - [`address`](BootstrapResponseInboxBuilder::address)
    /// - [`status`](BootstrapResponseInboxBuilder::status)
    pub fn build(self) -> Result<BootstrapResponseInbox, BuildError> {
        Ok(BootstrapResponseInbox {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
        })
    }
}
