pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct MessageReplyToItemAddress {
    #[serde(default)]
    pub address: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
}

impl MessageReplyToItemAddress {
    pub fn builder() -> MessageReplyToItemAddressBuilder {
        <MessageReplyToItemAddressBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageReplyToItemAddressBuilder {
    address: Option<String>,
    name: Option<String>,
}

impl MessageReplyToItemAddressBuilder {
    pub fn address(mut self, value: impl Into<String>) -> Self {
        self.address = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`MessageReplyToItemAddress`].
    /// This method will fail if any of the following fields are not set:
    /// - [`address`](MessageReplyToItemAddressBuilder::address)
    pub fn build(self) -> Result<MessageReplyToItemAddress, BuildError> {
        Ok(MessageReplyToItemAddress {
            address: self
                .address
                .ok_or_else(|| BuildError::missing_field("address"))?,
            name: self.name,
        })
    }
}
