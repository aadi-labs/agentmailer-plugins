pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct DownloadAttachmentsResponse {
    #[serde(default)]
    pub url: String,
    #[serde(rename = "expiresAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub expires_at: DateTime<FixedOffset>,
}

impl DownloadAttachmentsResponse {
    pub fn builder() -> DownloadAttachmentsResponseBuilder {
        <DownloadAttachmentsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DownloadAttachmentsResponseBuilder {
    url: Option<String>,
    expires_at: Option<DateTime<FixedOffset>>,
}

impl DownloadAttachmentsResponseBuilder {
    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn expires_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.expires_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DownloadAttachmentsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`url`](DownloadAttachmentsResponseBuilder::url)
    /// - [`expires_at`](DownloadAttachmentsResponseBuilder::expires_at)
    pub fn build(self) -> Result<DownloadAttachmentsResponse, BuildError> {
        Ok(DownloadAttachmentsResponse {
            url: self.url.ok_or_else(|| BuildError::missing_field("url"))?,
            expires_at: self
                .expires_at
                .ok_or_else(|| BuildError::missing_field("expires_at"))?,
        })
    }
}
