pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum BillingAccountBillingInterval {
    Month,
    Year,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for BillingAccountBillingInterval {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Month => serializer.serialize_str("month"),
            Self::Year => serializer.serialize_str("year"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for BillingAccountBillingInterval {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "month" => Ok(Self::Month),
            "year" => Ok(Self::Year),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for BillingAccountBillingInterval {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Month => write!(f, "month"),
            Self::Year => write!(f, "year"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
