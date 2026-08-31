pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct BootstrapResponse {
    pub agent: BootstrapResponseAgent,
    #[serde(default)]
    pub identity: BootstrapResponseIdentity,
    #[serde(default)]
    pub organization: BootstrapResponseOrganization,
    #[serde(default)]
    pub pod: BootstrapResponsePod,
    pub inbox: BootstrapResponseInbox,
    #[serde(default)]
    pub capabilities: BootstrapResponseCapabilities,
    #[serde(default)]
    pub limits: BootstrapResponseLimits,
    #[serde(default)]
    pub links: BootstrapResponseLinks,
}

impl BootstrapResponse {
    pub fn builder() -> BootstrapResponseBuilder {
        <BootstrapResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseBuilder {
    agent: Option<BootstrapResponseAgent>,
    identity: Option<BootstrapResponseIdentity>,
    organization: Option<BootstrapResponseOrganization>,
    pod: Option<BootstrapResponsePod>,
    inbox: Option<BootstrapResponseInbox>,
    capabilities: Option<BootstrapResponseCapabilities>,
    limits: Option<BootstrapResponseLimits>,
    links: Option<BootstrapResponseLinks>,
}

impl BootstrapResponseBuilder {
    pub fn agent(mut self, value: BootstrapResponseAgent) -> Self {
        self.agent = Some(value);
        self
    }

    pub fn identity(mut self, value: BootstrapResponseIdentity) -> Self {
        self.identity = Some(value);
        self
    }

    pub fn organization(mut self, value: BootstrapResponseOrganization) -> Self {
        self.organization = Some(value);
        self
    }

    pub fn pod(mut self, value: BootstrapResponsePod) -> Self {
        self.pod = Some(value);
        self
    }

    pub fn inbox(mut self, value: BootstrapResponseInbox) -> Self {
        self.inbox = Some(value);
        self
    }

    pub fn capabilities(mut self, value: BootstrapResponseCapabilities) -> Self {
        self.capabilities = Some(value);
        self
    }

    pub fn limits(mut self, value: BootstrapResponseLimits) -> Self {
        self.limits = Some(value);
        self
    }

    pub fn links(mut self, value: BootstrapResponseLinks) -> Self {
        self.links = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`agent`](BootstrapResponseBuilder::agent)
    /// - [`identity`](BootstrapResponseBuilder::identity)
    /// - [`organization`](BootstrapResponseBuilder::organization)
    /// - [`pod`](BootstrapResponseBuilder::pod)
    /// - [`inbox`](BootstrapResponseBuilder::inbox)
    /// - [`capabilities`](BootstrapResponseBuilder::capabilities)
    /// - [`limits`](BootstrapResponseBuilder::limits)
    /// - [`links`](BootstrapResponseBuilder::links)
    pub fn build(self) -> Result<BootstrapResponse, BuildError> {
        Ok(BootstrapResponse {
            agent: self
                .agent
                .ok_or_else(|| BuildError::missing_field("agent"))?,
            identity: self
                .identity
                .ok_or_else(|| BuildError::missing_field("identity"))?,
            organization: self
                .organization
                .ok_or_else(|| BuildError::missing_field("organization"))?,
            pod: self.pod.ok_or_else(|| BuildError::missing_field("pod"))?,
            inbox: self
                .inbox
                .ok_or_else(|| BuildError::missing_field("inbox"))?,
            capabilities: self
                .capabilities
                .ok_or_else(|| BuildError::missing_field("capabilities"))?,
            limits: self
                .limits
                .ok_or_else(|| BuildError::missing_field("limits"))?,
            links: self
                .links
                .ok_or_else(|| BuildError::missing_field("links"))?,
        })
    }
}
