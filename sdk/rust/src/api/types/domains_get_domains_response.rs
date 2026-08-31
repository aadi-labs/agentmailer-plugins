pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct GetDomainsResponse {
    pub domain: Domain,
}

impl GetDomainsResponse {
    pub fn builder() -> GetDomainsResponseBuilder {
        <GetDomainsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetDomainsResponseBuilder {
    domain: Option<Domain>,
}

impl GetDomainsResponseBuilder {
    pub fn domain(mut self, value: Domain) -> Self {
        self.domain = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetDomainsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`domain`](GetDomainsResponseBuilder::domain)
    pub fn build(self) -> Result<GetDomainsResponse, BuildError> {
        Ok(GetDomainsResponse {
            domain: self
                .domain
                .ok_or_else(|| BuildError::missing_field("domain"))?,
        })
    }
}
