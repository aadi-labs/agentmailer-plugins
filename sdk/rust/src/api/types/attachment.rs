pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Attachment {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    #[serde(default)]
    pub content_type: String,
    #[serde(default)]
    pub size: i64,
    pub status: AttachmentStatus,
    #[serde(rename = "expiresAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub expires_at: Option<DateTime<FixedOffset>>,
}

impl Attachment {
    pub fn builder() -> AttachmentBuilder {
        <AttachmentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct AttachmentBuilder {
    id: Option<String>,
    filename: Option<String>,
    content_type: Option<String>,
    size: Option<i64>,
    status: Option<AttachmentStatus>,
    expires_at: Option<DateTime<FixedOffset>>,
}

impl AttachmentBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

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

    pub fn status(mut self, value: AttachmentStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn expires_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.expires_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Attachment`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](AttachmentBuilder::id)
    /// - [`filename`](AttachmentBuilder::filename)
    /// - [`content_type`](AttachmentBuilder::content_type)
    /// - [`size`](AttachmentBuilder::size)
    /// - [`status`](AttachmentBuilder::status)
    pub fn build(self) -> Result<Attachment, BuildError> {
        Ok(Attachment {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            filename: self
                .filename
                .ok_or_else(|| BuildError::missing_field("filename"))?,
            content_type: self
                .content_type
                .ok_or_else(|| BuildError::missing_field("content_type"))?,
            size: self.size.ok_or_else(|| BuildError::missing_field("size"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            expires_at: self.expires_at,
        })
    }
}
