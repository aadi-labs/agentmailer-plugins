pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponseOrganization {
    #[serde(default)]
    pub id: String,
}

impl BootstrapResponseOrganization {
    pub fn builder() -> BootstrapResponseOrganizationBuilder {
        <BootstrapResponseOrganizationBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseOrganizationBuilder {
    id: Option<String>,
}

impl BootstrapResponseOrganizationBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseOrganization`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](BootstrapResponseOrganizationBuilder::id)
    pub fn build(self) -> Result<BootstrapResponseOrganization, BuildError> {
        Ok(BootstrapResponseOrganization {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
        })
    }
}
