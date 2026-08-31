pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponseLinks {
    #[serde(default)]
    pub inbox: String,
    #[serde(default)]
    pub messages: String,
    #[serde(default)]
    pub events: String,
    #[serde(default)]
    pub imap: String,
    #[serde(default)]
    pub smtp: String,
    #[serde(default)]
    pub a2a: String,
    #[serde(rename = "agentCard")]
    #[serde(default)]
    pub agent_card: String,
}

impl BootstrapResponseLinks {
    pub fn builder() -> BootstrapResponseLinksBuilder {
        <BootstrapResponseLinksBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseLinksBuilder {
    inbox: Option<String>,
    messages: Option<String>,
    events: Option<String>,
    imap: Option<String>,
    smtp: Option<String>,
    a2a: Option<String>,
    agent_card: Option<String>,
}

impl BootstrapResponseLinksBuilder {
    pub fn inbox(mut self, value: impl Into<String>) -> Self {
        self.inbox = Some(value.into());
        self
    }

    pub fn messages(mut self, value: impl Into<String>) -> Self {
        self.messages = Some(value.into());
        self
    }

    pub fn events(mut self, value: impl Into<String>) -> Self {
        self.events = Some(value.into());
        self
    }

    pub fn imap(mut self, value: impl Into<String>) -> Self {
        self.imap = Some(value.into());
        self
    }

    pub fn smtp(mut self, value: impl Into<String>) -> Self {
        self.smtp = Some(value.into());
        self
    }

    pub fn a2a(mut self, value: impl Into<String>) -> Self {
        self.a2a = Some(value.into());
        self
    }

    pub fn agent_card(mut self, value: impl Into<String>) -> Self {
        self.agent_card = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseLinks`].
    /// This method will fail if any of the following fields are not set:
    /// - [`inbox`](BootstrapResponseLinksBuilder::inbox)
    /// - [`messages`](BootstrapResponseLinksBuilder::messages)
    /// - [`events`](BootstrapResponseLinksBuilder::events)
    /// - [`imap`](BootstrapResponseLinksBuilder::imap)
    /// - [`smtp`](BootstrapResponseLinksBuilder::smtp)
    /// - [`a2a`](BootstrapResponseLinksBuilder::a2a)
    /// - [`agent_card`](BootstrapResponseLinksBuilder::agent_card)
    pub fn build(self) -> Result<BootstrapResponseLinks, BuildError> {
        Ok(BootstrapResponseLinks {
            inbox: self
                .inbox
                .ok_or_else(|| BuildError::missing_field("inbox"))?,
            messages: self
                .messages
                .ok_or_else(|| BuildError::missing_field("messages"))?,
            events: self
                .events
                .ok_or_else(|| BuildError::missing_field("events"))?,
            imap: self.imap.ok_or_else(|| BuildError::missing_field("imap"))?,
            smtp: self.smtp.ok_or_else(|| BuildError::missing_field("smtp"))?,
            a2a: self.a2a.ok_or_else(|| BuildError::missing_field("a2a"))?,
            agent_card: self
                .agent_card
                .ok_or_else(|| BuildError::missing_field("agent_card"))?,
        })
    }
}
