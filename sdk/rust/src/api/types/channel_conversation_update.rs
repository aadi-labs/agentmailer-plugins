pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelConversationUpdate {
    pub status: ChannelConversationUpdateStatus,
}

impl ChannelConversationUpdate {
    pub fn builder() -> ChannelConversationUpdateBuilder {
        <ChannelConversationUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelConversationUpdateBuilder {
    status: Option<ChannelConversationUpdateStatus>,
}

impl ChannelConversationUpdateBuilder {
    pub fn status(mut self, value: ChannelConversationUpdateStatus) -> Self {
        self.status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelConversationUpdate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`status`](ChannelConversationUpdateBuilder::status)
    pub fn build(self) -> Result<ChannelConversationUpdate, BuildError> {
        Ok(ChannelConversationUpdate {
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
        })
    }
}
