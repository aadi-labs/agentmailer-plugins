pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum ListChannelRecipientPermissionsRequestStatus {
    Consented,
    OptedOut,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for ListChannelRecipientPermissionsRequestStatus {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Consented => serializer.serialize_str("consented"),
            Self::OptedOut => serializer.serialize_str("opted_out"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for ListChannelRecipientPermissionsRequestStatus {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "consented" => Ok(Self::Consented),
            "opted_out" => Ok(Self::OptedOut),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for ListChannelRecipientPermissionsRequestStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Consented => write!(f, "consented"),
            Self::OptedOut => write!(f, "opted_out"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
