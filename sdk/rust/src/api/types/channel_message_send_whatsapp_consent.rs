pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendWhatsappConsent {
    pub basis: ChannelMessageSendWhatsappConsentBasis,
    #[serde(rename = "capturedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub captured_at: DateTime<FixedOffset>,
    #[serde(default)]
    pub reference: String,
}

impl ChannelMessageSendWhatsappConsent {
    pub fn builder() -> ChannelMessageSendWhatsappConsentBuilder {
        <ChannelMessageSendWhatsappConsentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendWhatsappConsentBuilder {
    basis: Option<ChannelMessageSendWhatsappConsentBasis>,
    captured_at: Option<DateTime<FixedOffset>>,
    reference: Option<String>,
}

impl ChannelMessageSendWhatsappConsentBuilder {
    pub fn basis(mut self, value: ChannelMessageSendWhatsappConsentBasis) -> Self {
        self.basis = Some(value);
        self
    }

    pub fn captured_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.captured_at = Some(value);
        self
    }

    pub fn reference(mut self, value: impl Into<String>) -> Self {
        self.reference = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSendWhatsappConsent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`basis`](ChannelMessageSendWhatsappConsentBuilder::basis)
    /// - [`captured_at`](ChannelMessageSendWhatsappConsentBuilder::captured_at)
    /// - [`reference`](ChannelMessageSendWhatsappConsentBuilder::reference)
    pub fn build(self) -> Result<ChannelMessageSendWhatsappConsent, BuildError> {
        Ok(ChannelMessageSendWhatsappConsent {
            basis: self
                .basis
                .ok_or_else(|| BuildError::missing_field("basis"))?,
            captured_at: self
                .captured_at
                .ok_or_else(|| BuildError::missing_field("captured_at"))?,
            reference: self
                .reference
                .ok_or_else(|| BuildError::missing_field("reference"))?,
        })
    }
}
