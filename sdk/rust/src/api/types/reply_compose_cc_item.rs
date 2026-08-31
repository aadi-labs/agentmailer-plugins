pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum ReplyComposeCcItem {
    String(String),

    ReplyComposeCcItemAddress(ReplyComposeCcItemAddress),
}

impl ReplyComposeCcItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_reply_compose_cc_item_address(&self) -> bool {
        matches!(self, Self::ReplyComposeCcItemAddress(_))
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

    pub fn as_reply_compose_cc_item_address(&self) -> Option<&ReplyComposeCcItemAddress> {
        match self {
            Self::ReplyComposeCcItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_reply_compose_cc_item_address(self) -> Option<ReplyComposeCcItemAddress> {
        match self {
            Self::ReplyComposeCcItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for ReplyComposeCcItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::ReplyComposeCcItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
