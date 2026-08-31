pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct A2AAgentCardProvider {
    #[serde(default)]
    pub url: String,
    #[serde(default)]
    pub organization: String,
}

impl A2AAgentCardProvider {
    pub fn builder() -> A2AAgentCardProviderBuilder {
        <A2AAgentCardProviderBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AAgentCardProviderBuilder {
    url: Option<String>,
    organization: Option<String>,
}

impl A2AAgentCardProviderBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn organization(mut self, value: impl Into<String>) -> Self {
        self.organization = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`A2AAgentCardProvider`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](A2AAgentCardProviderBuilder::url)
    /// - [`organization`](A2AAgentCardProviderBuilder::organization)
    pub fn build(self) -> Result<A2AAgentCardProvider, BuildError> {
        Ok(A2AAgentCardProvider {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
            organization: self
                .organization
                .ok_or_else(|| BuildError::missing_field("organization"))?,
        })
    }
}
