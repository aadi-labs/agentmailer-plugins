pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct GetBillingResponse {
    pub billing: BillingAccount,
}

impl GetBillingResponse {
    pub fn builder() -> GetBillingResponseBuilder {
        <GetBillingResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct GetBillingResponseBuilder {
    billing: Option<BillingAccount>,
}

impl GetBillingResponseBuilder {
    pub fn billing(mut self, value: BillingAccount) -> Self {
        self.billing = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`GetBillingResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`billing`](GetBillingResponseBuilder::billing)
    pub fn build(self) -> Result<GetBillingResponse, BuildError> {
        Ok(GetBillingResponse {
            billing: self
                .billing
                .ok_or_else(|| BuildError::missing_field("billing"))?,
        })
    }
}
