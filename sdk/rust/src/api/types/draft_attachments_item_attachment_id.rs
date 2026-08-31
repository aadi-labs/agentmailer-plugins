pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct DraftAttachmentsItemAttachmentId {
    #[serde(rename = "attachmentId")]
    #[serde(default)]
    pub attachment_id: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    pub disposition: DraftAttachmentsItemAttachmentIdDisposition,
}

impl DraftAttachmentsItemAttachmentId {
    pub fn builder() -> DraftAttachmentsItemAttachmentIdBuilder {
        <DraftAttachmentsItemAttachmentIdBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftAttachmentsItemAttachmentIdBuilder {
    attachment_id: Option<String>,
    content_id: Option<String>,
    disposition: Option<DraftAttachmentsItemAttachmentIdDisposition>,
}

impl DraftAttachmentsItemAttachmentIdBuilder {
    pub fn attachment_id(mut self, value: impl Into<String>) -> Self {
        self.attachment_id = Some(value.into());
        self
    }

    pub fn content_id(mut self, value: impl Into<String>) -> Self {
        self.content_id = Some(value.into());
        self
    }

    pub fn disposition(mut self, value: DraftAttachmentsItemAttachmentIdDisposition) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DraftAttachmentsItemAttachmentId`].
    /// This method will fail if any of the following fields are not set:
    /// - [`attachment_id`](DraftAttachmentsItemAttachmentIdBuilder::attachment_id)
    /// - [`disposition`](DraftAttachmentsItemAttachmentIdBuilder::disposition)
    pub fn build(self) -> Result<DraftAttachmentsItemAttachmentId, BuildError> {
        Ok(DraftAttachmentsItemAttachmentId {
            attachment_id: self
                .attachment_id
                .ok_or_else(|| BuildError::missing_field("attachment_id"))?,
            content_id: self.content_id,
            disposition: self
                .disposition
                .ok_or_else(|| BuildError::missing_field("disposition"))?,
        })
    }
}
