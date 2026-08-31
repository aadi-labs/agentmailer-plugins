pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum DraftUpdateBccItem {
    String(String),

    DraftUpdateBccItemAddress(DraftUpdateBccItemAddress),
}

impl DraftUpdateBccItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_draft_update_bcc_item_address(&self) -> bool {
        matches!(self, Self::DraftUpdateBccItemAddress(_))
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

    pub fn as_draft_update_bcc_item_address(&self) -> Option<&DraftUpdateBccItemAddress> {
        match self {
            Self::DraftUpdateBccItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_draft_update_bcc_item_address(self) -> Option<DraftUpdateBccItemAddress> {
        match self {
            Self::DraftUpdateBccItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for DraftUpdateBccItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::DraftUpdateBccItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
