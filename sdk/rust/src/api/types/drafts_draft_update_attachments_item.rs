pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum DraftUpdateAttachmentsItem {
    DraftUpdateAttachmentsItemContent(DraftUpdateAttachmentsItemContent),

    DraftUpdateAttachmentsItemAttachmentId(DraftUpdateAttachmentsItemAttachmentId),
}

impl DraftUpdateAttachmentsItem {
    pub fn is_draft_update_attachments_item_content(&self) -> bool {
        matches!(self, Self::DraftUpdateAttachmentsItemContent(_))
    }

    pub fn is_draft_update_attachments_item_attachment_id(&self) -> bool {
        matches!(self, Self::DraftUpdateAttachmentsItemAttachmentId(_))
    }

    pub fn as_draft_update_attachments_item_content(
        &self,
    ) -> Option<&DraftUpdateAttachmentsItemContent> {
        match self {
            Self::DraftUpdateAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_update_attachments_item_content(
        self,
    ) -> Option<DraftUpdateAttachmentsItemContent> {
        match self {
            Self::DraftUpdateAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_draft_update_attachments_item_attachment_id(
        &self,
    ) -> Option<&DraftUpdateAttachmentsItemAttachmentId> {
        match self {
            Self::DraftUpdateAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_update_attachments_item_attachment_id(
        self,
    ) -> Option<DraftUpdateAttachmentsItemAttachmentId> {
        match self {
            Self::DraftUpdateAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for DraftUpdateAttachmentsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::DraftUpdateAttachmentsItemContent(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
            Self::DraftUpdateAttachmentsItemAttachmentId(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
