pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(untagged)]
pub enum DraftAttachmentsItem {
    DraftAttachmentsItemContent(DraftAttachmentsItemContent),

    DraftAttachmentsItemAttachmentId(DraftAttachmentsItemAttachmentId),
}

impl DraftAttachmentsItem {
    pub fn is_draft_attachments_item_content(&self) -> bool {
        matches!(self, Self::DraftAttachmentsItemContent(_))
    }

    pub fn is_draft_attachments_item_attachment_id(&self) -> bool {
        matches!(self, Self::DraftAttachmentsItemAttachmentId(_))
    }

    pub fn as_draft_attachments_item_content(&self) -> Option<&DraftAttachmentsItemContent> {
        match self {
            Self::DraftAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_attachments_item_content(self) -> Option<DraftAttachmentsItemContent> {
        match self {
            Self::DraftAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_draft_attachments_item_attachment_id(
        &self,
    ) -> Option<&DraftAttachmentsItemAttachmentId> {
        match self {
            Self::DraftAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_attachments_item_attachment_id(
        self,
    ) -> Option<DraftAttachmentsItemAttachmentId> {
        match self {
            Self::DraftAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for DraftAttachmentsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::DraftAttachmentsItemContent(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
            Self::DraftAttachmentsItemAttachmentId(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
