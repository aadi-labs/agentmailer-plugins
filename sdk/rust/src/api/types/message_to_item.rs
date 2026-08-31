pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageToItem {
    String(String),

    MessageToItemAddress(MessageToItemAddress),
}

impl MessageToItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_message_to_item_address(&self) -> bool {
        matches!(self, Self::MessageToItemAddress(_))
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

    pub fn as_message_to_item_address(&self) -> Option<&MessageToItemAddress> {
        match self {
            Self::MessageToItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_to_item_address(self) -> Option<MessageToItemAddress> {
        match self {
            Self::MessageToItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageToItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::MessageToItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
