pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum BillingAccountStatus {
    Active,
    Trialing,
    PastDue,
    Paused,
    Canceled,
    Unpaid,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for BillingAccountStatus {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Active => serializer.serialize_str("active"),
            Self::Trialing => serializer.serialize_str("trialing"),
            Self::PastDue => serializer.serialize_str("past_due"),
            Self::Paused => serializer.serialize_str("paused"),
            Self::Canceled => serializer.serialize_str("canceled"),
            Self::Unpaid => serializer.serialize_str("unpaid"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for BillingAccountStatus {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "active" => Ok(Self::Active),
            "trialing" => Ok(Self::Trialing),
            "past_due" => Ok(Self::PastDue),
            "paused" => Ok(Self::Paused),
            "canceled" => Ok(Self::Canceled),
            "unpaid" => Ok(Self::Unpaid),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for BillingAccountStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Active => write!(f, "active"),
            Self::Trialing => write!(f, "trialing"),
            Self::PastDue => write!(f, "past_due"),
            Self::Paused => write!(f, "paused"),
            Self::Canceled => write!(f, "canceled"),
            Self::Unpaid => write!(f, "unpaid"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
