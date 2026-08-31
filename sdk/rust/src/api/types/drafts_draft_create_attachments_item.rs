pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum DraftCreateAttachmentsItem {
    DraftCreateAttachmentsItemContent(DraftCreateAttachmentsItemContent),

    DraftCreateAttachmentsItemAttachmentId(DraftCreateAttachmentsItemAttachmentId),
}

impl DraftCreateAttachmentsItem {
    pub fn is_draft_create_attachments_item_content(&self) -> bool {
        matches!(self, Self::DraftCreateAttachmentsItemContent(_))
    }

    pub fn is_draft_create_attachments_item_attachment_id(&self) -> bool {
        matches!(self, Self::DraftCreateAttachmentsItemAttachmentId(_))
    }

    pub fn as_draft_create_attachments_item_content(
        &self,
    ) -> Option<&DraftCreateAttachmentsItemContent> {
        match self {
            Self::DraftCreateAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_create_attachments_item_content(
        self,
    ) -> Option<DraftCreateAttachmentsItemContent> {
        match self {
            Self::DraftCreateAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_draft_create_attachments_item_attachment_id(
        &self,
    ) -> Option<&DraftCreateAttachmentsItemAttachmentId> {
        match self {
            Self::DraftCreateAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_create_attachments_item_attachment_id(
        self,
    ) -> Option<DraftCreateAttachmentsItemAttachmentId> {
        match self {
            Self::DraftCreateAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for DraftCreateAttachmentsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::DraftCreateAttachmentsItemContent(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
            Self::DraftCreateAttachmentsItemAttachmentId(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
