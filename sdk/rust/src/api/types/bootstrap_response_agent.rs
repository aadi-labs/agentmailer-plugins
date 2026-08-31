pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct BootstrapResponseAgent {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "trustTier")]
    pub trust_tier: BootstrapResponseAgentTrustTier,
}

impl BootstrapResponseAgent {
    pub fn builder() -> BootstrapResponseAgentBuilder {
        <BootstrapResponseAgentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseAgentBuilder {
    id: Option<String>,
    trust_tier: Option<BootstrapResponseAgentTrustTier>,
}

impl BootstrapResponseAgentBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn trust_tier(mut self, value: BootstrapResponseAgentTrustTier) -> Self {
        self.trust_tier = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseAgent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](BootstrapResponseAgentBuilder::id)
    /// - [`trust_tier`](BootstrapResponseAgentBuilder::trust_tier)
    pub fn build(self) -> Result<BootstrapResponseAgent, BuildError> {
        Ok(BootstrapResponseAgent {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            trust_tier: self
                .trust_tier
                .ok_or_else(|| BuildError::missing_field("trust_tier"))?,
        })
    }
}
