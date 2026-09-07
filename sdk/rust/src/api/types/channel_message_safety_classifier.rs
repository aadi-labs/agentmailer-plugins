pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum ChannelMessageSafetyClassifier {
    Local,
    LocalOpenaiGuardrails,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for ChannelMessageSafetyClassifier {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Local => serializer.serialize_str("local"),
            Self::LocalOpenaiGuardrails => serializer.serialize_str("local+openai-guardrails"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for ChannelMessageSafetyClassifier {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "local" => Ok(Self::Local),
            "local+openai-guardrails" => Ok(Self::LocalOpenaiGuardrails),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for ChannelMessageSafetyClassifier {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Local => write!(f, "local"),
            Self::LocalOpenaiGuardrails => write!(f, "local+openai-guardrails"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
