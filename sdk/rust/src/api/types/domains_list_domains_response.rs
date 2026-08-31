pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListDomainsResponse {
    #[serde(default)]
    pub domains: Vec<Domain>,
}

impl ListDomainsResponse {
    pub fn builder() -> ListDomainsResponseBuilder {
        <ListDomainsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListDomainsResponseBuilder {
    domains: Option<Vec<Domain>>,
}

impl ListDomainsResponseBuilder {
    pub fn domains(mut self, value: Vec<Domain>) -> Self {
        self.domains = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListDomainsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`domains`](ListDomainsResponseBuilder::domains)
    pub fn build(self) -> Result<ListDomainsResponse, BuildError> {
        Ok(ListDomainsResponse {
            domains: self
                .domains
                .ok_or_else(|| BuildError::missing_field("domains"))?,
        })
    }
}
