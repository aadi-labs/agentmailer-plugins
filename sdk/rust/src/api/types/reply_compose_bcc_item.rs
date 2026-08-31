pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum ReplyComposeBccItem {
    String(String),

    ReplyComposeBccItemAddress(ReplyComposeBccItemAddress),
}

impl ReplyComposeBccItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_reply_compose_bcc_item_address(&self) -> bool {
        matches!(self, Self::ReplyComposeBccItemAddress(_))
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

    pub fn as_reply_compose_bcc_item_address(&self) -> Option<&ReplyComposeBccItemAddress> {
        match self {
            Self::ReplyComposeBccItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_reply_compose_bcc_item_address(self) -> Option<ReplyComposeBccItemAddress> {
        match self {
            Self::ReplyComposeBccItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for ReplyComposeBccItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::ReplyComposeBccItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
