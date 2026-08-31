pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct A2AAgentCardSupportedInterfacesItem {
    #[serde(default)]
    pub url: String,
    #[serde(rename = "protocolBinding")]
    pub protocol_binding: A2AAgentCardSupportedInterfacesItemProtocolBinding,
    #[serde(rename = "protocolVersion")]
    pub protocol_version: A2AAgentCardSupportedInterfacesItemProtocolVersion,
}

impl A2AAgentCardSupportedInterfacesItem {
    pub fn builder() -> A2AAgentCardSupportedInterfacesItemBuilder {
        <A2AAgentCardSupportedInterfacesItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AAgentCardSupportedInterfacesItemBuilder {
    url: Option<String>,
    protocol_binding: Option<A2AAgentCardSupportedInterfacesItemProtocolBinding>,
    protocol_version: Option<A2AAgentCardSupportedInterfacesItemProtocolVersion>,
}

impl A2AAgentCardSupportedInterfacesItemBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn protocol_binding(
        mut self,
        value: A2AAgentCardSupportedInterfacesItemProtocolBinding,
    ) -> Self {
        self.protocol_binding = Some(value);
        self
    }

    pub fn protocol_version(
        mut self,
        value: A2AAgentCardSupportedInterfacesItemProtocolVersion,
    ) -> Self {
        self.protocol_version = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AAgentCardSupportedInterfacesItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](A2AAgentCardSupportedInterfacesItemBuilder::url)
    /// - [`protocol_binding`](A2AAgentCardSupportedInterfacesItemBuilder::protocol_binding)
    /// - [`protocol_version`](A2AAgentCardSupportedInterfacesItemBuilder::protocol_version)
    pub fn build(self) -> Result<A2AAgentCardSupportedInterfacesItem, BuildError> {
        Ok(A2AAgentCardSupportedInterfacesItem {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
            protocol_binding: self
                .protocol_binding
                .ok_or_else(|| BuildError::missing_field("protocol_binding"))?,
            protocol_version: self
                .protocol_version
                .ok_or_else(|| BuildError::missing_field("protocol_version"))?,
        })
    }
}
