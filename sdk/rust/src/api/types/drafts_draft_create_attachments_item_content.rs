pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct DraftCreateAttachmentsItemContent {
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    #[serde(default)]
    pub content_type: String,
    #[serde(default)]
    pub content: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub disposition: Option<DraftCreateAttachmentsItemContentDisposition>,
}

impl DraftCreateAttachmentsItemContent {
    pub fn builder() -> DraftCreateAttachmentsItemContentBuilder {
        <DraftCreateAttachmentsItemContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftCreateAttachmentsItemContentBuilder {
    filename: Option<String>,
    content_type: Option<String>,
    content: Option<String>,
    content_id: Option<String>,
    disposition: Option<DraftCreateAttachmentsItemContentDisposition>,
}

impl DraftCreateAttachmentsItemContentBuilder {
    pub fn filename(mut self, value: impl Into<String>) -> Self {
        self.filename = Some(value.into());
        self
    }

    pub fn content_type(mut self, value: impl Into<String>) -> Self {
        self.content_type = Some(value.into());
        self
    }

    pub fn content(mut self, value: impl Into<String>) -> Self {
        self.content = Some(value.into());
        self
    }

    pub fn content_id(mut self, value: impl Into<String>) -> Self {
        self.content_id = Some(value.into());
        self
    }

    pub fn disposition(mut self, value: DraftCreateAttachmentsItemContentDisposition) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DraftCreateAttachmentsItemContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`filename`](DraftCreateAttachmentsItemContentBuilder::filename)
    /// - [`content_type`](DraftCreateAttachmentsItemContentBuilder::content_type)
    /// - [`content`](DraftCreateAttachmentsItemContentBuilder::content)
    pub fn build(self) -> Result<DraftCreateAttachmentsItemContent, BuildError> {
        Ok(DraftCreateAttachmentsItemContent {
            filename: self
                .filename
                .ok_or_else(|| BuildError::missing_field("filename"))?,
            content_type: self
                .content_type
                .ok_or_else(|| BuildError::missing_field("content_type"))?,
            content: self
                .content
                .ok_or_else(|| BuildError::missing_field("content"))?,
            content_id: self.content_id,
            disposition: self.disposition,
        })
    }
}
