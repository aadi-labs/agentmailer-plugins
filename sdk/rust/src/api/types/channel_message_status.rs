pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum ChannelMessageStatus {
    Queued,
    Sent,
    Delivered,
    Read,
    Failed,
    Received,
    Blocked,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for ChannelMessageStatus {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Queued => serializer.serialize_str("queued"),
            Self::Sent => serializer.serialize_str("sent"),
            Self::Delivered => serializer.serialize_str("delivered"),
            Self::Read => serializer.serialize_str("read"),
            Self::Failed => serializer.serialize_str("failed"),
            Self::Received => serializer.serialize_str("received"),
            Self::Blocked => serializer.serialize_str("blocked"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for ChannelMessageStatus {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "queued" => Ok(Self::Queued),
            "sent" => Ok(Self::Sent),
            "delivered" => Ok(Self::Delivered),
            "read" => Ok(Self::Read),
            "failed" => Ok(Self::Failed),
            "received" => Ok(Self::Received),
            "blocked" => Ok(Self::Blocked),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for ChannelMessageStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Queued => write!(f, "queued"),
            Self::Sent => write!(f, "sent"),
            Self::Delivered => write!(f, "delivered"),
            Self::Read => write!(f, "read"),
            Self::Failed => write!(f, "failed"),
            Self::Received => write!(f, "received"),
            Self::Blocked => write!(f, "blocked"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
