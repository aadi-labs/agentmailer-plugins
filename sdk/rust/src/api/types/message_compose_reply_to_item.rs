pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageComposeReplyToItem {
    String(String),

    MessageComposeReplyToItemAddress(MessageComposeReplyToItemAddress),
}

impl MessageComposeReplyToItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_message_compose_reply_to_item_address(&self) -> bool {
        matches!(self, Self::MessageComposeReplyToItemAddress(_))
    }

    pub fn as_string(&self) -> Option<&str> {
        match self {
            Self::String(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_string(self) -> Option<String> {
        match self {
            Self::String(value) => Some(value),
            _ => None,
        }
    }

    pub fn as_message_compose_reply_to_item_address(
        &self,
    ) -> Option<&MessageComposeReplyToItemAddress> {
        match self {
            Self::MessageComposeReplyToItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_compose_reply_to_item_address(
        self,
    ) -> Option<MessageComposeReplyToItemAddress> {
        match self {
            Self::MessageComposeReplyToItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageComposeReplyToItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::MessageComposeReplyToItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
