pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum MessageStatus {
    Queued,
    Sent,
    Delivered,
    Bounced,
    Complained,
    Rejected,
    Received,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for MessageStatus {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Queued => serializer.serialize_str("queued"),
            Self::Sent => serializer.serialize_str("sent"),
            Self::Delivered => serializer.serialize_str("delivered"),
            Self::Bounced => serializer.serialize_str("bounced"),
            Self::Complained => serializer.serialize_str("complained"),
            Self::Rejected => serializer.serialize_str("rejected"),
            Self::Received => serializer.serialize_str("received"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for MessageStatus {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "queued" => Ok(Self::Queued),
            "sent" => Ok(Self::Sent),
            "delivered" => Ok(Self::Delivered),
            "bounced" => Ok(Self::Bounced),
            "complained" => Ok(Self::Complained),
            "rejected" => Ok(Self::Rejected),
            "received" => Ok(Self::Received),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for MessageStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Queued => write!(f, "queued"),
            Self::Sent => write!(f, "sent"),
            Self::Delivered => write!(f, "delivered"),
            Self::Bounced => write!(f, "bounced"),
            Self::Complained => write!(f, "complained"),
            Self::Rejected => write!(f, "rejected"),
            Self::Received => write!(f, "received"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
