pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendRcsContentRichCardRepliesItem {
    #[serde(default)]
    pub text: String,
    #[serde(default)]
    pub data: String,
}

impl ChannelMessageSendRcsContentRichCardRepliesItem {
    pub fn builder() -> ChannelMessageSendRcsContentRichCardRepliesItemBuilder {
        <ChannelMessageSendRcsContentRichCardRepliesItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendRcsContentRichCardRepliesItemBuilder {
    text: Option<String>,
    data: Option<String>,
}

impl ChannelMessageSendRcsContentRichCardRepliesItemBuilder {
    pub fn text(mut self, value: impl Into<String>) -> Self {
        self.text = Some(value.into());
        self
    }

    pub fn data(mut self, value: impl Into<String>) -> Self {
        self.data = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendRcsContentRichCardRepliesItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`text`](ChannelMessageSendRcsContentRichCardRepliesItemBuilder::text)
    /// - [`data`](ChannelMessageSendRcsContentRichCardRepliesItemBuilder::data)
    pub fn build(self) -> Result<ChannelMessageSendRcsContentRichCardRepliesItem, BuildError> {
        Ok(ChannelMessageSendRcsContentRichCardRepliesItem {
            text: self.text.ok_or_else(|| BuildError::missing_field("text"))?,
            data: self.data.ok_or_else(|| BuildError::missing_field("data"))?,
        })
    }
}
