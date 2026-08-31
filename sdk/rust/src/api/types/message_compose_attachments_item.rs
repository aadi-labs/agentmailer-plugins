pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageComposeAttachmentsItem {
    MessageComposeAttachmentsItemContent(MessageComposeAttachmentsItemContent),

    MessageComposeAttachmentsItemAttachmentId(MessageComposeAttachmentsItemAttachmentId),
}

impl MessageComposeAttachmentsItem {
    pub fn is_message_compose_attachments_item_content(&self) -> bool {
        matches!(self, Self::MessageComposeAttachmentsItemContent(_))
    }

    pub fn is_message_compose_attachments_item_attachment_id(&self) -> bool {
        matches!(self, Self::MessageComposeAttachmentsItemAttachmentId(_))
    }

    pub fn as_message_compose_attachments_item_content(
        &self,
    ) -> Option<&MessageComposeAttachmentsItemContent> {
        match self {
            Self::MessageComposeAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_compose_attachments_item_content(
        self,
    ) -> Option<MessageComposeAttachmentsItemContent> {
        match self {
            Self::MessageComposeAttachmentsItemContent(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_message_compose_attachments_item_attachment_id(
        &self,
    ) -> Option<&MessageComposeAttachmentsItemAttachmentId> {
        match self {
            Self::MessageComposeAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_compose_attachments_item_attachment_id(
        self,
    ) -> Option<MessageComposeAttachmentsItemAttachmentId> {
        match self {
            Self::MessageComposeAttachmentsItemAttachmentId(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageComposeAttachmentsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::MessageComposeAttachmentsItemContent(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
            Self::MessageComposeAttachmentsItemAttachmentId(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
