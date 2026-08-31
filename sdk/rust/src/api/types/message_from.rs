pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum MessageFrom {
    String(String),

    MessageFromAddress(MessageFromAddress),
}

impl MessageFrom {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_message_from_address(&self) -> bool {
        matches!(self, Self::MessageFromAddress(_))
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

    pub fn as_message_from_address(&self) -> Option<&MessageFromAddress> {
        match self {
            Self::MessageFromAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_message_from_address(self) -> Option<MessageFromAddress> {
        match self {
            Self::MessageFromAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for MessageFrom {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::MessageFromAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
