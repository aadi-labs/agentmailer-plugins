pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum ChannelEndpointChannel {
    Sms,
    Mms,
    Rcs,
    Whatsapp,
    Voice,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for ChannelEndpointChannel {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Sms => serializer.serialize_str("sms"),
            Self::Mms => serializer.serialize_str("mms"),
            Self::Rcs => serializer.serialize_str("rcs"),
            Self::Whatsapp => serializer.serialize_str("whatsapp"),
            Self::Voice => serializer.serialize_str("voice"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for ChannelEndpointChannel {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "sms" => Ok(Self::Sms),
            "mms" => Ok(Self::Mms),
            "rcs" => Ok(Self::Rcs),
            "whatsapp" => Ok(Self::Whatsapp),
            "voice" => Ok(Self::Voice),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for ChannelEndpointChannel {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Sms => write!(f, "sms"),
            Self::Mms => write!(f, "mms"),
            Self::Rcs => write!(f, "rcs"),
            Self::Whatsapp => write!(f, "whatsapp"),
            Self::Voice => write!(f, "voice"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
