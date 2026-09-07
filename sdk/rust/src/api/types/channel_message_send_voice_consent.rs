pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ChannelMessageSendVoiceConsent {
    pub basis: ChannelMessageSendVoiceConsentBasis,
    #[serde(rename = "capturedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub captured_at: DateTime<FixedOffset>,
    #[serde(default)]
    pub reference: String,
}

impl ChannelMessageSendVoiceConsent {
    pub fn builder() -> ChannelMessageSendVoiceConsentBuilder {
        <ChannelMessageSendVoiceConsentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSendVoiceConsentBuilder {
    basis: Option<ChannelMessageSendVoiceConsentBasis>,
    captured_at: Option<DateTime<FixedOffset>>,
    reference: Option<String>,
}

impl ChannelMessageSendVoiceConsentBuilder {
    pub fn basis(mut self, value: ChannelMessageSendVoiceConsentBasis) -> Self {
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

    /// Consumes the builder and constructs a [`ChannelMessageSendVoiceConsent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`basis`](ChannelMessageSendVoiceConsentBuilder::basis)
    /// - [`captured_at`](ChannelMessageSendVoiceConsentBuilder::captured_at)
    /// - [`reference`](ChannelMessageSendVoiceConsentBuilder::reference)
    pub fn build(self) -> Result<ChannelMessageSendVoiceConsent, BuildError> {
        Ok(ChannelMessageSendVoiceConsent {
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
