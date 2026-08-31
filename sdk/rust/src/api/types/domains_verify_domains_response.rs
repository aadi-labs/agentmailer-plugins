pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct VerifyDomainsResponse {
    pub domain: Domain,
}

impl VerifyDomainsResponse {
    pub fn builder() -> VerifyDomainsResponseBuilder {
        <VerifyDomainsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct VerifyDomainsResponseBuilder {
    domain: Option<Domain>,
}

impl VerifyDomainsResponseBuilder {
    pub fn domain(mut self, value: Domain) -> Self {
        self.domain = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`VerifyDomainsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`domain`](VerifyDomainsResponseBuilder::domain)
    pub fn build(self) -> Result<VerifyDomainsResponse, BuildError> {
        Ok(VerifyDomainsResponse {
            domain: self
                .domain
                .ok_or_else(|| BuildError::missing_field("domain"))?,
        })
    }
}
