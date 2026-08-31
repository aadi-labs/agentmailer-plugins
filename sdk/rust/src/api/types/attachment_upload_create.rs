pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct AttachmentUploadCreate {
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    #[serde(default)]
    pub content_type: String,
    #[serde(default)]
    pub size: i64,
    #[serde(rename = "checksumSha256")]
    #[serde(default)]
    pub checksum_sha256: String,
}

impl AttachmentUploadCreate {
    pub fn builder() -> AttachmentUploadCreateBuilder {
        <AttachmentUploadCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct AttachmentUploadCreateBuilder {
    filename: Option<String>,
    content_type: Option<String>,
    size: Option<i64>,
    checksum_sha256: Option<String>,
}

impl AttachmentUploadCreateBuilder {
    pub fn filename(mut self, value: impl Into<String>) -> Self {
        self.filename = Some(value.into());
        self
    }

    pub fn content_type(mut self, value: impl Into<String>) -> Self {
        self.content_type = Some(value.into());
        self
    }

    pub fn size(mut self, value: i64) -> Self {
        self.size = Some(value);
        self
    }

    pub fn checksum_sha256(mut self, value: impl Into<String>) -> Self {
        self.checksum_sha256 = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`AttachmentUploadCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`filename`](AttachmentUploadCreateBuilder::filename)
    /// - [`content_type`](AttachmentUploadCreateBuilder::content_type)
    /// - [`size`](AttachmentUploadCreateBuilder::size)
    /// - [`checksum_sha256`](AttachmentUploadCreateBuilder::checksum_sha256)
    pub fn build(self) -> Result<AttachmentUploadCreate, BuildError> {
        Ok(AttachmentUploadCreate {
            filename: self
                .filename
                .ok_or_else(|| BuildError::missing_field("filename"))?,
            content_type: self
                .content_type
                .ok_or_else(|| BuildError::missing_field("content_type"))?,
            size: self.size.ok_or_else(|| BuildError::missing_field("size"))?,
            checksum_sha256: self
                .checksum_sha256
                .ok_or_else(|| BuildError::missing_field("checksum_sha256"))?,
        })
    }
}
