pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum A2AJsonRpcRequestJsonrpc {
    #[serde(rename = "2.0")]
    Two0,
}
impl fmt::Display for A2AJsonRpcRequestJsonrpc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            Self::Two0 => "2.0",
        };
        write!(f, "{}", s)
    }
}
