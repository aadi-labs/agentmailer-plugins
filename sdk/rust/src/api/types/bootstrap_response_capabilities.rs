pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponseCapabilities {
    #[serde(default)]
    pub receive: bool,
    #[serde(default)]
    pub send: bool,
    #[serde(default)]
    pub imap: bool,
    #[serde(default)]
    pub smtp: bool,
    #[serde(rename = "customDomains")]
    #[serde(default)]
    pub custom_domains: bool,
    #[serde(default)]
    pub a2a: bool,
}

impl BootstrapResponseCapabilities {
    pub fn builder() -> BootstrapResponseCapabilitiesBuilder {
        <BootstrapResponseCapabilitiesBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseCapabilitiesBuilder {
    receive: Option<bool>,
    send: Option<bool>,
    imap: Option<bool>,
    smtp: Option<bool>,
    custom_domains: Option<bool>,
    a2a: Option<bool>,
}

impl BootstrapResponseCapabilitiesBuilder {
    pub fn receive(mut self, value: bool) -> Self {
        self.receive = Some(value);
        self
    }

    pub fn send(mut self, value: bool) -> Self {
        self.send = Some(value);
        self
    }

    pub fn imap(mut self, value: bool) -> Self {
        self.imap = Some(value);
        self
    }

    pub fn smtp(mut self, value: bool) -> Self {
        self.smtp = Some(value);
        self
    }

    pub fn custom_domains(mut self, value: bool) -> Self {
        self.custom_domains = Some(value);
        self
    }

    pub fn a2a(mut self, value: bool) -> Self {
        self.a2a = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseCapabilities`].
    /// This method will fail if any of the following fields are not set:
    /// - [`receive`](BootstrapResponseCapabilitiesBuilder::receive)
    /// - [`send`](BootstrapResponseCapabilitiesBuilder::send)
    /// - [`imap`](BootstrapResponseCapabilitiesBuilder::imap)
    /// - [`smtp`](BootstrapResponseCapabilitiesBuilder::smtp)
    /// - [`custom_domains`](BootstrapResponseCapabilitiesBuilder::custom_domains)
    /// - [`a2a`](BootstrapResponseCapabilitiesBuilder::a2a)
    pub fn build(self) -> Result<BootstrapResponseCapabilities, BuildError> {
        Ok(BootstrapResponseCapabilities {
            receive: self
                .receive
                .ok_or_else(|| BuildError::missing_field("receive"))?,
            send: self.send.ok_or_else(|| BuildError::missing_field("send"))?,
            imap: self.imap.ok_or_else(|| BuildError::missing_field("imap"))?,
            smtp: self.smtp.ok_or_else(|| BuildError::missing_field("smtp"))?,
            custom_domains: self
                .custom_domains
                .ok_or_else(|| BuildError::missing_field("custom_domains"))?,
            a2a: self.a2a.ok_or_else(|| BuildError::missing_field("a2a"))?,
        })
    }
}
