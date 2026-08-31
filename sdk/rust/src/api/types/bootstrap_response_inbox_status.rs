pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum BootstrapResponseInboxStatus {
    #[serde(rename = "active")]
    Active,
}
impl fmt::Display for BootstrapResponseInboxStatus {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            Self::Active => "active",
        };
        write!(f, "{}", s)
    }
}
