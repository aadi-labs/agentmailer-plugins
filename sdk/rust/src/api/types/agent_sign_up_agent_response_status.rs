pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum SignUpAgentResponseStatus {
    #[serde(rename = "pending_human_approval")]
    PendingHumanApproval,
}
impl fmt::Display for SignUpAgentResponseStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            Self::PendingHumanApproval => "pending_human_approval",
        };
        write!(f, "{}", s)
    }
}
