pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct DraftCreateToItemAddress {
    #[serde(default)]
    pub address: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
}

impl DraftCreateToItemAddress {
    pub fn builder() -> DraftCreateToItemAddressBuilder {
        <DraftCreateToItemAddressBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftCreateToItemAddressBuilder {
    address: Option<String>,
    name: Option<String>,
}

impl DraftCreateToItemAddressBuilder {
    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`DraftCreateToItemAddress`].
    /// This method will fail if any of the following fields are not set:
    /// - [`address`](DraftCreateToItemAddressBuilder::address)
    pub fn build(self) -> Result<DraftCreateToItemAddress, BuildError> {
        Ok(DraftCreateToItemAddress {
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            name: self.name,
        })
    }
}
