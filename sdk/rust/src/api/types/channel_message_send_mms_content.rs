pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendMmsContent {
    pub r#type: ChannelMessageSendMmsContentType,
    #[serde(default)]
    pub body: String,
}

impl ChannelMessageSendMmsContent {
    pub fn builder() -> ChannelMessageSendMmsContentBuilder {
        <ChannelMessageSendMmsContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendMmsContentBuilder {
    r#type: Option<ChannelMessageSendMmsContentType>,
    body: Option<String>,
}

impl ChannelMessageSendMmsContentBuilder {
    pub fn r#type(mut self, value: ChannelMessageSendMmsContentType) -> Self {
        self.r#type = Some(value);
        self
    }

    pub fn body(mut self, value: impl Into<String>) -> Self {
        self.body = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendMmsContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`r#type`](ChannelMessageSendMmsContentBuilder::r#type)
    /// - [`body`](ChannelMessageSendMmsContentBuilder::body)
    pub fn build(self) -> Result<ChannelMessageSendMmsContent, BuildError> {
        Ok(ChannelMessageSendMmsContent {
            r#type: self
                .r#type
                .ok_or_else(|| BuildError::missing_field("r#type"))?,
            body: self.body.ok_or_else(|| BuildError::missing_field("body"))?,
        })
    }
}
