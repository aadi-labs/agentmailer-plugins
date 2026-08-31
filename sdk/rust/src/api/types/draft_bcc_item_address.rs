pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct DraftBccItemAddress {
    #[serde(default)]
    pub address: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
}

impl DraftBccItemAddress {
    pub fn builder() -> DraftBccItemAddressBuilder {
        <DraftBccItemAddressBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftBccItemAddressBuilder {
    address: Option<String>,
    name: Option<String>,
}

impl DraftBccItemAddressBuilder {
    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`DraftBccItemAddress`].
    /// This method will fail if any of the following fields are not set:
    /// - [`address`](DraftBccItemAddressBuilder::address)
    pub fn build(self) -> Result<DraftBccItemAddress, BuildError> {
        Ok(DraftBccItemAddress {
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            name: self.name,
        })
    }
}
