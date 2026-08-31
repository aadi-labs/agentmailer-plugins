pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum DraftAttachmentsItemAttachmentIdDisposition {
    Attachment,
    Inline,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for DraftAttachmentsItemAttachmentIdDisposition {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::Attachment => serializer.serialize_str("attachment"),
            Self::Inline => serializer.serialize_str("inline"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for DraftAttachmentsItemAttachmentIdDisposition {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "attachment" => Ok(Self::Attachment),
            "inline" => Ok(Self::Inline),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for DraftAttachmentsItemAttachmentIdDisposition {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Attachment => write!(f, "attachment"),
            Self::Inline => write!(f, "inline"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
