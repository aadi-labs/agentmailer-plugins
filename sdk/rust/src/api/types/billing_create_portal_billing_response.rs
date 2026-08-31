pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreatePortalBillingResponse {
    #[serde(default)]
    pub url: String,
}

impl CreatePortalBillingResponse {
    pub fn builder() -> CreatePortalBillingResponseBuilder {
        <CreatePortalBillingResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreatePortalBillingResponseBuilder {
    url: Option<String>,
}

impl CreatePortalBillingResponseBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`CreatePortalBillingResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](CreatePortalBillingResponseBuilder::url)
    pub fn build(self) -> Result<CreatePortalBillingResponse, BuildError> {
        Ok(CreatePortalBillingResponse {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
        })
    }
}
