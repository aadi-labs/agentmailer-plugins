pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreateCheckoutBillingResponse {
    #[serde(default)]
    pub url: String,
}

impl CreateCheckoutBillingResponse {
    pub fn builder() -> CreateCheckoutBillingResponseBuilder {
        <CreateCheckoutBillingResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateCheckoutBillingResponseBuilder {
    url: Option<String>,
}

impl CreateCheckoutBillingResponseBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`CreateCheckoutBillingResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](CreateCheckoutBillingResponseBuilder::url)
    pub fn build(self) -> Result<CreateCheckoutBillingResponse, BuildError> {
        Ok(CreateCheckoutBillingResponse {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
        })
    }
}
