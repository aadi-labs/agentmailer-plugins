pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum BillingAccountPlan {
    Free,
    Developer,
    Startup,
    Enterprise,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for BillingAccountPlan {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Free => serializer.serialize_str("free"),
            Self::Developer => serializer.serialize_str("developer"),
            Self::Startup => serializer.serialize_str("startup"),
            Self::Enterprise => serializer.serialize_str("enterprise"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for BillingAccountPlan {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "free" => Ok(Self::Free),
            "developer" => Ok(Self::Developer),
            "startup" => Ok(Self::Startup),
            "enterprise" => Ok(Self::Enterprise),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for BillingAccountPlan {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Free => write!(f, "free"),
            Self::Developer => write!(f, "developer"),
            Self::Startup => write!(f, "startup"),
            Self::Enterprise => write!(f, "enterprise"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
