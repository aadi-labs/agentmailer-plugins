pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct MessageComposeAttachmentsItemContent {
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    #[serde(default)]
    pub content_type: String,
    #[serde(default)]
    pub content: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub disposition: Option<MessageComposeAttachmentsItemContentDisposition>,
}

impl MessageComposeAttachmentsItemContent {
    pub fn builder() -> MessageComposeAttachmentsItemContentBuilder {
        <MessageComposeAttachmentsItemContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageComposeAttachmentsItemContentBuilder {
    filename: Option<String>,
    content_type: Option<String>,
    content: Option<String>,
    content_id: Option<String>,
    disposition: Option<MessageComposeAttachmentsItemContentDisposition>,
}

impl MessageComposeAttachmentsItemContentBuilder {
    pub fn filename(mut self, value: impl Into<String>) -> Self {
        self.filename = Some(value.into());
        self
    }

    pub fn content_type(mut self, value: impl Into<String>) -> Self {
        self.content_type = Some(value.into());
        self
    }

    pub fn content(mut self, value: impl Into<String>) -> Self {
        self.content = Some(value.into());
        self
    }

    pub fn content_id(mut self, value: impl Into<String>) -> Self {
        self.content_id = Some(value.into());
        self
    }

    pub fn disposition(mut self, value: MessageComposeAttachmentsItemContentDisposition) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`MessageComposeAttachmentsItemContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`filename`](MessageComposeAttachmentsItemContentBuilder::filename)
    /// - [`content_type`](MessageComposeAttachmentsItemContentBuilder::content_type)
    /// - [`content`](MessageComposeAttachmentsItemContentBuilder::content)
    pub fn build(self) -> Result<MessageComposeAttachmentsItemContent, BuildError> {
        Ok(MessageComposeAttachmentsItemContent {
            filename: self
                .filename
                .ok_or_else(|| BuildError::missing_field("filename"))?,
            content_type: self
                .content_type
                .ok_or_else(|| BuildError::missing_field("content_type"))?,
            content: self
                .content
                .ok_or_else(|| BuildError::missing_field("content"))?,
            content_id: self.content_id,
            disposition: self.disposition,
        })
    }
}
