pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ReplyComposeAttachmentsItemAttachmentId {
    #[serde(rename = "attachmentId")]
    #[serde(default)]
    pub attachment_id: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub disposition: Option<ReplyComposeAttachmentsItemAttachmentIdDisposition>,
}

impl ReplyComposeAttachmentsItemAttachmentId {
    pub fn builder() -> ReplyComposeAttachmentsItemAttachmentIdBuilder {
        <ReplyComposeAttachmentsItemAttachmentIdBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ReplyComposeAttachmentsItemAttachmentIdBuilder {
    attachment_id: Option<String>,
    content_id: Option<String>,
    disposition: Option<ReplyComposeAttachmentsItemAttachmentIdDisposition>,
}

impl ReplyComposeAttachmentsItemAttachmentIdBuilder {
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
        value: ReplyComposeAttachmentsItemAttachmentIdDisposition,
    ) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ReplyComposeAttachmentsItemAttachmentId`].
    /// This method will fail if any of the following fields are not set:
    /// - [`attachment_id`](ReplyComposeAttachmentsItemAttachmentIdBuilder::attachment_id)
    pub fn build(self) -> Result<ReplyComposeAttachmentsItemAttachmentId, BuildError> {
        Ok(ReplyComposeAttachmentsItemAttachmentId {
            attachment_id: self
                .attachment_id
                .ok_or_else(|| BuildError::missing_field("attachment_id"))?,
            content_id: self.content_id,
            disposition: self.disposition,
        })
    }
}
