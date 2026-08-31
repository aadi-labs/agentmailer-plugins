pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponseLimits {
    #[serde(rename = "messagesPerDay")]
    #[serde(default)]
    pub messages_per_day: i64,
    #[serde(rename = "recipientsPerMessage")]
    #[serde(default)]
    pub recipients_per_message: i64,
    #[serde(rename = "attachmentBytes")]
    #[serde(default)]
    pub attachment_bytes: i64,
}

impl BootstrapResponseLimits {
    pub fn builder() -> BootstrapResponseLimitsBuilder {
        <BootstrapResponseLimitsBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponseLimitsBuilder {
    messages_per_day: Option<i64>,
    recipients_per_message: Option<i64>,
    attachment_bytes: Option<i64>,
}

impl BootstrapResponseLimitsBuilder {
    pub fn messages_per_day(mut self, value: i64) -> Self {
        self.messages_per_day = Some(value);
        self
    }

    pub fn recipients_per_message(mut self, value: i64) -> Self {
        self.recipients_per_message = Some(value);
        self
    }

    pub fn attachment_bytes(mut self, value: i64) -> Self {
        self.attachment_bytes = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponseLimits`].
    /// This method will fail if any of the following fields are not set:
    /// - [`messages_per_day`](BootstrapResponseLimitsBuilder::messages_per_day)
    /// - [`recipients_per_message`](BootstrapResponseLimitsBuilder::recipients_per_message)
    /// - [`attachment_bytes`](BootstrapResponseLimitsBuilder::attachment_bytes)
    pub fn build(self) -> Result<BootstrapResponseLimits, BuildError> {
        Ok(BootstrapResponseLimits {
            messages_per_day: self
                .messages_per_day
                .ok_or_else(|| BuildError::missing_field("messages_per_day"))?,
            recipients_per_message: self
                .recipients_per_message
                .ok_or_else(|| BuildError::missing_field("recipients_per_message"))?,
            attachment_bytes: self
                .attachment_bytes
                .ok_or_else(|| BuildError::missing_field("attachment_bytes"))?,
        })
    }
}
