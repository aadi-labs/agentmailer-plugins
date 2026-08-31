pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct MessageAttachmentsItem {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    #[serde(default)]
    pub content_type: String,
    #[serde(default)]
    pub size: i64,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    pub disposition: MessageAttachmentsItemDisposition,
}

impl MessageAttachmentsItem {
    pub fn builder() -> MessageAttachmentsItemBuilder {
        <MessageAttachmentsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageAttachmentsItemBuilder {
    id: Option<String>,
    filename: Option<String>,
    content_type: Option<String>,
    size: Option<i64>,
    content_id: Option<String>,
    disposition: Option<MessageAttachmentsItemDisposition>,
}

impl MessageAttachmentsItemBuilder {
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

    pub fn content_id(mut self, value: impl Into<String>) -> Self {
        self.content_id = Some(value.into());
        self
    }

    pub fn disposition(mut self, value: MessageAttachmentsItemDisposition) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`MessageAttachmentsItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](MessageAttachmentsItemBuilder::id)
    /// - [`filename`](MessageAttachmentsItemBuilder::filename)
    /// - [`content_type`](MessageAttachmentsItemBuilder::content_type)
    /// - [`size`](MessageAttachmentsItemBuilder::size)
    /// - [`disposition`](MessageAttachmentsItemBuilder::disposition)
    pub fn build(self) -> Result<MessageAttachmentsItem, BuildError> {
        Ok(MessageAttachmentsItem {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            filename: self
                .filename
                .ok_or_else(|| BuildError::missing_field("filename"))?,
            content_type: self
                .content_type
                .ok_or_else(|| BuildError::missing_field("content_type"))?,
            size: self.size.ok_or_else(|| BuildError::missing_field("size"))?,
            content_id: self.content_id,
            disposition: self
                .disposition
                .ok_or_else(|| BuildError::missing_field("disposition"))?,
        })
    }
}
