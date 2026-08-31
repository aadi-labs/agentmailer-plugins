pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct CreateDomainsResponse {
    pub domain: Domain,
}

impl CreateDomainsResponse {
    pub fn builder() -> CreateDomainsResponseBuilder {
        <CreateDomainsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateDomainsResponseBuilder {
    domain: Option<Domain>,
}

impl CreateDomainsResponseBuilder {
    pub fn domain(mut self, value: Domain) -> Self {
        self.domain = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CreateDomainsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`domain`](CreateDomainsResponseBuilder::domain)
    pub fn build(self) -> Result<CreateDomainsResponse, BuildError> {
        Ok(CreateDomainsResponse {
            domain: self
                .domain
                .ok_or_else(|| BuildError::missing_field("domain"))?,
        })
    }
}
