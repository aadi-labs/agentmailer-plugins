pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum ReplyComposeAttachmentsItem {
    ReplyComposeAttachmentsItemContent(ReplyComposeAttachmentsItemContent),

    ReplyComposeAttachmentsItemAttachmentId(ReplyComposeAttachmentsItemAttachmentId),
}

impl ReplyComposeAttachmentsItem {
    pub fn is_reply_compose_attachments_item_content(&self) -> bool {
        matches!(self, Self::ReplyComposeAttachmentsItemContent(_))
    }

    pub fn is_reply_compose_attachments_item_attachment_id(&self) -> bool {
        matches!(self, Self::ReplyComposeAttachmentsItemAttachmentId(_))
    }

    pub fn as_reply_compose_attachments_item_content(
        &self,
    ) -> Option<&ReplyComposeAttachmentsItemContent> {
        match self {
            Self::ReplyComposeAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_reply_compose_attachments_item_content(
        self,
    ) -> Option<ReplyComposeAttachmentsItemContent> {
        match self {
            Self::ReplyComposeAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_reply_compose_attachments_item_attachment_id(
        &self,
    ) -> Option<&ReplyComposeAttachmentsItemAttachmentId> {
        match self {
            Self::ReplyComposeAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_reply_compose_attachments_item_attachment_id(
        self,
    ) -> Option<ReplyComposeAttachmentsItemAttachmentId> {
        match self {
            Self::ReplyComposeAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for ReplyComposeAttachmentsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::ReplyComposeAttachmentsItemContent(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
            Self::ReplyComposeAttachmentsItemAttachmentId(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
