pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelRecipientPermission {
    #[serde(rename = "endpointId")]
    #[serde(default)]
    pub endpoint_id: String,
    pub channel: ChannelRecipientPermissionChannel,
    #[serde(default)]
    pub recipient: String,
    pub status: ChannelRecipientPermissionStatus,
    #[serde(rename = "consentBasis")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub consent_basis: Option<ChannelRecipientPermissionConsentBasis>,
    #[serde(rename = "consentReference")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub consent_reference: Option<String>,
    #[serde(rename = "consentCapturedAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub consent_captured_at: Option<DateTime<FixedOffset>>,
    #[serde(rename = "optedOutAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub opted_out_at: Option<DateTime<FixedOffset>>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
}

impl ChannelRecipientPermission {
    pub fn builder() -> ChannelRecipientPermissionBuilder {
        <ChannelRecipientPermissionBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelRecipientPermissionBuilder {
    endpoint_id: Option<String>,
    channel: Option<ChannelRecipientPermissionChannel>,
    recipient: Option<String>,
    status: Option<ChannelRecipientPermissionStatus>,
    consent_basis: Option<ChannelRecipientPermissionConsentBasis>,
    consent_reference: Option<String>,
    consent_captured_at: Option<DateTime<FixedOffset>>,
    opted_out_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
}

impl ChannelRecipientPermissionBuilder {
    pub fn endpoint_id(mut self, value: impl Into<String>) -> Self {
        self.endpoint_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ChannelRecipientPermissionChannel) -> Self {
        self.channel = Some(value);
        self
    }

    pub fn recipient(mut self, value: impl Into<String>) -> Self {
        self.recipient = Some(value.into());
        self
    }

    pub fn status(mut self, value: ChannelRecipientPermissionStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn consent_basis(mut self, value: ChannelRecipientPermissionConsentBasis) -> Self {
        self.consent_basis = Some(value);
        self
    }

    pub fn consent_reference(mut self, value: impl Into<String>) -> Self {
        self.consent_reference = Some(value.into());
        self
    }

    pub fn consent_captured_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.consent_captured_at = Some(value);
        self
    }

    pub fn opted_out_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.opted_out_at = Some(value);
        self
    }

    pub fn updated_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.updated_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelRecipientPermission`].
    /// This method will fail if any of the following fields are not set:
    /// - [`endpoint_id`](ChannelRecipientPermissionBuilder::endpoint_id)
    /// - [`channel`](ChannelRecipientPermissionBuilder::channel)
    /// - [`recipient`](ChannelRecipientPermissionBuilder::recipient)
    /// - [`status`](ChannelRecipientPermissionBuilder::status)
    /// - [`updated_at`](ChannelRecipientPermissionBuilder::updated_at)
    pub fn build(self) -> Result<ChannelRecipientPermission, BuildError> {
        Ok(ChannelRecipientPermission {
            endpoint_id: self
                .endpoint_id
                .ok_or_else(|| BuildError::missing_field("endpoint_id"))?,
            channel: self
                .channel
                .ok_or_else(|| BuildError::missing_field("channel"))?,
            recipient: self
                .recipient
                .ok_or_else(|| BuildError::missing_field("recipient"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            consent_basis: self.consent_basis,
            consent_reference: self.consent_reference,
            consent_captured_at: self.consent_captured_at,
            opted_out_at: self.opted_out_at,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
        })
    }
}
