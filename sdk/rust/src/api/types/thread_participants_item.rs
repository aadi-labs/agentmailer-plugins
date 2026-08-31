pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(untagged)]
pub enum ThreadParticipantsItem {
    String(String),

    ThreadParticipantsItemAddress(ThreadParticipantsItemAddress),
}

impl ThreadParticipantsItem {
    pub fn is_string(&self) -> bool {
        matches!(self, Self::String(_))
    }

    pub fn is_thread_participants_item_address(&self) -> bool {
        matches!(self, Self::ThreadParticipantsItemAddress(_))
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

    pub fn as_thread_participants_item_address(&self) -> Option<&ThreadParticipantsItemAddress> {
        match self {
            Self::ThreadParticipantsItemAddress(value) => Some(value),
            _ => None,
        }
    }

    pub fn into_thread_participants_item_address(self) -> Option<ThreadParticipantsItemAddress> {
        match self {
            Self::ThreadParticipantsItemAddress(value) => Some(value),
            _ => None,
        }
    }
}

impl fmt::Display for ThreadParticipantsItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::String(value) => write!(f, "{}", value),
            Self::ThreadParticipantsItemAddress(value) => write!(
                f,
                "{}",
                serde_json::to_string(value).unwrap_or_else(|_| format!("{:?}", value))
            ),
        }
    }
}
