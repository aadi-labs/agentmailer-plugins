pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BillingSelection {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub inboxes: Option<i64>,
    #[serde(rename = "monthlyMessages")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub monthly_messages: Option<i64>,
    #[serde(rename = "customDomains")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub custom_domains: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub interval: Option<BillingSelectionInterval>,
}

impl BillingSelection {
    pub fn builder() -> BillingSelectionBuilder {
        <BillingSelectionBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BillingSelectionBuilder {
    inboxes: Option<i64>,
    monthly_messages: Option<i64>,
    custom_domains: Option<i64>,
    interval: Option<BillingSelectionInterval>,
}

impl BillingSelectionBuilder {
    pub fn inboxes(mut self, value: i64) -> Self {
        self.inboxes = Some(value);
        self
    }

    pub fn monthly_messages(mut self, value: i64) -> Self {
        self.monthly_messages = Some(value);
        self
    }

    pub fn custom_domains(mut self, value: i64) -> Self {
        self.custom_domains = Some(value);
        self
    }

    pub fn interval(mut self, value: BillingSelectionInterval) -> Self {
        self.interval = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BillingSelection`].
    pub fn build(self) -> Result<BillingSelection, BuildError> {
        Ok(BillingSelection {
            inboxes: self.inboxes,
            monthly_messages: self.monthly_messages,
            custom_domains: self.custom_domains,
            interval: self.interval,
        })
    }
}
