pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum BootstrapResponseAgentTrustTier {
    Bootstrap,
    Verified,
    Established,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for BootstrapResponseAgentTrustTier {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Bootstrap => serializer.serialize_str("bootstrap"),
            Self::Verified => serializer.serialize_str("verified"),
            Self::Established => serializer.serialize_str("established"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for BootstrapResponseAgentTrustTier {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "bootstrap" => Ok(Self::Bootstrap),
            "verified" => Ok(Self::Verified),
            "established" => Ok(Self::Established),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for BootstrapResponseAgentTrustTier {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Bootstrap => write!(f, "bootstrap"),
            Self::Verified => write!(f, "verified"),
            Self::Established => write!(f, "established"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
