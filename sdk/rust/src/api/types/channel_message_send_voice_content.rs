pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendVoiceContent {
    pub r#type: ChannelMessageSendVoiceContentType,
    #[serde(default)]
    pub body: String,
}

impl ChannelMessageSendVoiceContent {
    pub fn builder() -> ChannelMessageSendVoiceContentBuilder {
        <ChannelMessageSendVoiceContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendVoiceContentBuilder {
    r#type: Option<ChannelMessageSendVoiceContentType>,
    body: Option<String>,
}

impl ChannelMessageSendVoiceContentBuilder {
    pub fn r#type(mut self, value: ChannelMessageSendVoiceContentType) -> Self {
        self.r#type = Some(value);
        self
    }

    pub fn body(mut self, value: impl Into<String>) -> Self {
        self.body = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendVoiceContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`r#type`](ChannelMessageSendVoiceContentBuilder::r#type)
    /// - [`body`](ChannelMessageSendVoiceContentBuilder::body)
    pub fn build(self) -> Result<ChannelMessageSendVoiceContent, BuildError> {
        Ok(ChannelMessageSendVoiceContent {
            r#type: self
                .r#type
                .ok_or_else(|| BuildError::missing_field("r#type"))?,
            body: self.body.ok_or_else(|| BuildError::missing_field("body"))?,
        })
    }
}
