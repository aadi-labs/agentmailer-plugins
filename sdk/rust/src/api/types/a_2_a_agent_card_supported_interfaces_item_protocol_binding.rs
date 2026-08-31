pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum A2AAgentCardSupportedInterfacesItemProtocolBinding {
    #[serde(rename = "JSONRPC")]
    Jsonrpc,
}
impl fmt::Display for A2AAgentCardSupportedInterfacesItemProtocolBinding {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            Self::Jsonrpc => "JSONRPC",
        };
        write!(f, "{}", s)
    }
}
