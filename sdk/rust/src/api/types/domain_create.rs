pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct DomainCreate {
    #[serde(default)]
    pub domain: String,
    #[serde(rename = "podId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
}

impl DomainCreate {
    pub fn builder() -> DomainCreateBuilder {
        <DomainCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DomainCreateBuilder {
    domain: Option<String>,
    pod_id: Option<String>,
}

impl DomainCreateBuilder {
    pub fn domain(mut self, value: impl Into<String>) -> Self {
        self.domain = Some(value.into());
        self
    }

    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`DomainCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`domain`](DomainCreateBuilder::domain)
    pub fn build(self) -> Result<DomainCreate, BuildError> {
        Ok(DomainCreate {
            domain: self
                .domain
                .ok_or_else(|| BuildError::missing_field("domain"))?,
            pod_id: self.pod_id,
        })
    }
}
