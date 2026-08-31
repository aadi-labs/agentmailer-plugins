pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct MailProtocolEndpoint {
    #[serde(default)]
    pub host: String,
    #[serde(default)]
    pub port: i64,
    pub security: MailProtocolEndpointSecurity,
}

impl MailProtocolEndpoint {
    pub fn builder() -> MailProtocolEndpointBuilder {
        <MailProtocolEndpointBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MailProtocolEndpointBuilder {
    host: Option<String>,
    port: Option<i64>,
    security: Option<MailProtocolEndpointSecurity>,
}

impl MailProtocolEndpointBuilder {
    pub fn host(mut self, value: impl Into<String>) -> Self {
        self.host = Some(value.into());
        self
    }

    pub fn port(mut self, value: i64) -> Self {
        self.port = Some(value);
        self
    }

    pub fn security(mut self, value: MailProtocolEndpointSecurity) -> Self {
        self.security = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`MailProtocolEndpoint`].
    /// This method will fail if any of the following fields are not set:
    /// - [`host`](MailProtocolEndpointBuilder::host)
    /// - [`port`](MailProtocolEndpointBuilder::port)
    /// - [`security`](MailProtocolEndpointBuilder::security)
    pub fn build(self) -> Result<MailProtocolEndpoint, BuildError> {
        Ok(MailProtocolEndpoint {
            host: self.host.ok_or_else(|| BuildError::missing_field("host"))?,
            port: self.port.ok_or_else(|| BuildError::missing_field("port"))?,
            security: self
                .security
                .ok_or_else(|| BuildError::missing_field("security"))?,
        })
    }
}
