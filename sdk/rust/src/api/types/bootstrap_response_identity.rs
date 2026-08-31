pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponseIdentity {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub handle: String,
    #[serde(rename = "emailAddress")]
    #[serde(default)]
    pub email_address: String,
}

impl BootstrapResponseIdentity {
    pub fn builder() -> BootstrapResponseIdentityBuilder {
        <BootstrapResponseIdentityBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseIdentityBuilder {
    id: Option<String>,
    handle: Option<String>,
    email_address: Option<String>,
}

impl BootstrapResponseIdentityBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn handle(mut self, value: impl Into<String>) -> Self {
        self.handle = Some(value.into());
        self
    }

    pub fn email_address(mut self, value: impl Into<String>) -> Self {
        self.email_address = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseIdentity`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](BootstrapResponseIdentityBuilder::id)
    /// - [`handle`](BootstrapResponseIdentityBuilder::handle)
    /// - [`email_address`](BootstrapResponseIdentityBuilder::email_address)
    pub fn build(self) -> Result<BootstrapResponseIdentity, BuildError> {
        Ok(BootstrapResponseIdentity {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            handle: self
                .handle
                .ok_or_else(|| BuildError::missing_field("handle"))?,
            email_address: self
                .email_address
                .ok_or_else(|| BuildError::missing_field("email_address"))?,
        })
    }
}
