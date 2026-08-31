pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct A2AAgentCardCapabilities {
    #[serde(default)]
    pub streaming: bool,
    #[serde(rename = "pushNotifications")]
    #[serde(default)]
    pub push_notifications: bool,
    #[serde(rename = "extendedAgentCard")]
    #[serde(default)]
    pub extended_agent_card: bool,
}

impl A2AAgentCardCapabilities {
    pub fn builder() -> A2AAgentCardCapabilitiesBuilder {
        <A2AAgentCardCapabilitiesBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AAgentCardCapabilitiesBuilder {
    streaming: Option<bool>,
    push_notifications: Option<bool>,
    extended_agent_card: Option<bool>,
}

impl A2AAgentCardCapabilitiesBuilder {
    pub fn streaming(mut self, value: bool) -> Self {
        self.streaming = Some(value);
        self
    }

    pub fn push_notifications(mut self, value: bool) -> Self {
        self.push_notifications = Some(value);
        self
    }

    pub fn extended_agent_card(mut self, value: bool) -> Self {
        self.extended_agent_card = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AAgentCardCapabilities`].
    /// This method will fail if any of the following fields are not set:
    /// - [`streaming`](A2AAgentCardCapabilitiesBuilder::streaming)
    /// - [`push_notifications`](A2AAgentCardCapabilitiesBuilder::push_notifications)
    /// - [`extended_agent_card`](A2AAgentCardCapabilitiesBuilder::extended_agent_card)
    pub fn build(self) -> Result<A2AAgentCardCapabilities, BuildError> {
        Ok(A2AAgentCardCapabilities {
            streaming: self
                .streaming
                .ok_or_else(|| BuildError::missing_field("streaming"))?,
            push_notifications: self
                .push_notifications
                .ok_or_else(|| BuildError::missing_field("push_notifications"))?,
            extended_agent_card: self
                .extended_agent_card
                .ok_or_else(|| BuildError::missing_field("extended_agent_card"))?,
        })
    }
}
