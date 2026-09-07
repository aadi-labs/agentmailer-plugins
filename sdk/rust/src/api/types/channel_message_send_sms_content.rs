pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendSmsContent {
    pub r#type: ChannelMessageSendSmsContentType,
    #[serde(default)]
    pub body: String,
}

impl ChannelMessageSendSmsContent {
    pub fn builder() -> ChannelMessageSendSmsContentBuilder {
        <ChannelMessageSendSmsContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendSmsContentBuilder {
    r#type: Option<ChannelMessageSendSmsContentType>,
    body: Option<String>,
}

impl ChannelMessageSendSmsContentBuilder {
    pub fn r#type(mut self, value: ChannelMessageSendSmsContentType) -> Self {
        self.r#type = Some(value);
        self
    }

    pub fn body(mut self, value: impl Into<String>) -> Self {
        self.body = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendSmsContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`r#type`](ChannelMessageSendSmsContentBuilder::r#type)
    /// - [`body`](ChannelMessageSendSmsContentBuilder::body)
    pub fn build(self) -> Result<ChannelMessageSendSmsContent, BuildError> {
        Ok(ChannelMessageSendSmsContent {
            r#type: self
                .r#type
                .ok_or_else(|| BuildError::missing_field("r#type"))?,
            body: self.body.ok_or_else(|| BuildError::missing_field("body"))?,
        })
    }
}
