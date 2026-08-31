pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum A2AAgentCardSupportedInterfacesItemProtocolVersion {
    #[serde(rename = "1.0")]
    One0,
}
impl fmt::Display for A2AAgentCardSupportedInterfacesItemProtocolVersion {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            Self::One0 => "1.0",
        };
        write!(f, "{}", s)
    }
}
