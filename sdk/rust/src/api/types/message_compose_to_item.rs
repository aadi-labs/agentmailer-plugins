pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageComposeToItem {
    String(String),

    MessageComposeToItemAddress(MessageComposeToItemAddress),
}

impl MessageComposeToItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_message_compose_to_item_address(&self) -> bool {
        matches!(self, Self::MessageComposeToItemAddress(_))
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

    pub fn as_message_compose_to_item_address(&self) -> Option<&MessageComposeToItemAddress> {
        match self {
            Self::MessageComposeToItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_compose_to_item_address(self) -> Option<MessageComposeToItemAddress> {
        match self {
            Self::MessageComposeToItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageComposeToItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::MessageComposeToItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
