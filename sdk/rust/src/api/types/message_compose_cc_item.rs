pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageComposeCcItem {
    String(String),

    MessageComposeCcItemAddress(MessageComposeCcItemAddress),
}

impl MessageComposeCcItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_message_compose_cc_item_address(&self) -> bool {
        matches!(self, Self::MessageComposeCcItemAddress(_))
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

    pub fn as_message_compose_cc_item_address(&self) -> Option<&MessageComposeCcItemAddress> {
        match self {
            Self::MessageComposeCcItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_compose_cc_item_address(self) -> Option<MessageComposeCcItemAddress> {
        match self {
            Self::MessageComposeCcItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageComposeCcItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::MessageComposeCcItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
