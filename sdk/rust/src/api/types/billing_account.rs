pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct BillingAccount {
    pub plan: BillingAccountPlan,
    pub status: BillingAccountStatus,
    #[serde(rename = "currentPeriodEnd")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub current_period_end: Option<DateTime<FixedOffset>>,
    #[serde(rename = "inboxLimit")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub inbox_limit: Option<i64>,
    #[serde(rename = "monthlySendLimit")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub monthly_send_limit: Option<i64>,
    #[serde(rename = "customDomainLimit")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub custom_domain_limit: Option<i64>,
    #[serde(rename = "billingInterval")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub billing_interval: Option<BillingAccountBillingInterval>,
}

impl BillingAccount {
    pub fn builder() -> BillingAccountBuilder {
        <BillingAccountBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BillingAccountBuilder {
    plan: Option<BillingAccountPlan>,
    status: Option<BillingAccountStatus>,
    current_period_end: Option<DateTime<FixedOffset>>,
    inbox_limit: Option<i64>,
    monthly_send_limit: Option<i64>,
    custom_domain_limit: Option<i64>,
    billing_interval: Option<BillingAccountBillingInterval>,
}

impl BillingAccountBuilder {
    pub fn plan(mut self, value: BillingAccountPlan) -> Self {
        self.plan = Some(value);
        self
    }

    pub fn status(mut self, value: BillingAccountStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn current_period_end(mut self, value: DateTime<FixedOffset>) -> Self {
        self.current_period_end = Some(value);
        self
    }

    pub fn inbox_limit(mut self, value: i64) -> Self {
        self.inbox_limit = Some(value);
        self
    }

    pub fn monthly_send_limit(mut self, value: i64) -> Self {
        self.monthly_send_limit = Some(value);
        self
    }

    pub fn custom_domain_limit(mut self, value: i64) -> Self {
        self.custom_domain_limit = Some(value);
        self
    }

    pub fn billing_interval(mut self, value: BillingAccountBillingInterval) -> Self {
        self.billing_interval = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BillingAccount`].
    /// This method will fail if any of the following fields are not set:
    /// - [`plan`](BillingAccountBuilder::plan)
    /// - [`status`](BillingAccountBuilder::status)
    pub fn build(self) -> Result<BillingAccount, BuildError> {
        Ok(BillingAccount {
            plan: self.plan.ok_or_else(|| BuildError::missing_field("plan"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            current_period_end: self.current_period_end,
            inbox_limit: self.inbox_limit,
            monthly_send_limit: self.monthly_send_limit,
            custom_domain_limit: self.custom_domain_limit,
            billing_interval: self.billing_interval,
        })
    }
}
