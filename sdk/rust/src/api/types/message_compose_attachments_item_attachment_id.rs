pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct MessageComposeAttachmentsItemAttachmentId {
    #[serde(rename = "attachmentId")]
    #[serde(default)]
    pub attachment_id: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub disposition: Option<MessageComposeAttachmentsItemAttachmentIdDisposition>,
}

impl MessageComposeAttachmentsItemAttachmentId {
    pub fn builder() -> MessageComposeAttachmentsItemAttachmentIdBuilder {
        <MessageComposeAttachmentsItemAttachmentIdBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageComposeAttachmentsItemAttachmentIdBuilder {
    attachment_id: Option<String>,
    content_id: Option<String>,
    disposition: Option<MessageComposeAttachmentsItemAttachmentIdDisposition>,
}

impl MessageComposeAttachmentsItemAttachmentIdBuilder {
    pub fn attachment_id(mut self, value: impl Into<String>) -> Self {
        self.attachment_id = Some(value.into());
        self
    }

    pub fn content_id(mut self, value: impl Into<String>) -> Self {
        self.content_id = Some(value.into());
        self
    }

    pub fn disposition(
        mut self,
        value: MessageComposeAttachmentsItemAttachmentIdDisposition,
    ) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`MessageComposeAttachmentsItemAttachmentId`].
    /// This method will fail if any of the following fields are not set:
    /// - [`attachment_id`](MessageComposeAttachmentsItemAttachmentIdBuilder::attachment_id)
    pub fn build(self) -> Result<MessageComposeAttachmentsItemAttachmentId, BuildError> {
        Ok(MessageComposeAttachmentsItemAttachmentId {
            attachment_id: self
                .attachment_id
                .ok_or_else(|| BuildError::missing_field("attachment_id"))?,
            content_id: self.content_id,
            disposition: self.disposition,
        })
    }
}
