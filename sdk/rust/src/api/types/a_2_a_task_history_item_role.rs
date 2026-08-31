pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum A2ATaskHistoryItemRole {
    RoleUser,
    RoleAgent,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for A2ATaskHistoryItemRole {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::RoleUser => serializer.serialize_str("ROLE_USER"),
            Self::RoleAgent => serializer.serialize_str("ROLE_AGENT"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for A2ATaskHistoryItemRole {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "ROLE_USER" => Ok(Self::RoleUser),
            "ROLE_AGENT" => Ok(Self::RoleAgent),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for A2ATaskHistoryItemRole {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::RoleUser => write!(f, "ROLE_USER"),
            Self::RoleAgent => write!(f, "ROLE_AGENT"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
