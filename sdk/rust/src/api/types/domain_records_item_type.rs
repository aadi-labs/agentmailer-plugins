pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum DomainRecordsItemType {
    Cname,
    Mx,
    Txt,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for DomainRecordsItemType {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Cname => serializer.serialize_str("CNAME"),
            Self::Mx => serializer.serialize_str("MX"),
            Self::Txt => serializer.serialize_str("TXT"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for DomainRecordsItemType {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "CNAME" => Ok(Self::Cname),
            "MX" => Ok(Self::Mx),
            "TXT" => Ok(Self::Txt),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for DomainRecordsItemType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Cname => write!(f, "CNAME"),
            Self::Mx => write!(f, "MX"),
            Self::Txt => write!(f, "TXT"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
