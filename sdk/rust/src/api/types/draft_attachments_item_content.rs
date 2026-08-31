pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct DraftAttachmentsItemContent {
    #[serde(default)]
    pub filename: String,
    #[serde(rename = "contentType")]
    pub content_type: serde_json::Value,
    #[serde(default)]
    pub content: String,
    #[serde(rename = "contentId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
    pub disposition: DraftAttachmentsItemContentDisposition,
}

impl DraftAttachmentsItemContent {
    pub fn builder() -> DraftAttachmentsItemContentBuilder {
        <DraftAttachmentsItemContentBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftAttachmentsItemContentBuilder {
    filename: Option<String>,
    content_type: Option<serde_json::Value>,
    content: Option<String>,
    content_id: Option<String>,
    disposition: Option<DraftAttachmentsItemContentDisposition>,
}

impl DraftAttachmentsItemContentBuilder {
    pub fn filename(mut self, value: impl Into<String>) -> Self {
        self.filename = Some(value.into());
        self
    }

    pub fn content_type(mut self, value: serde_json::Value) -> Self {
        self.content_type = Some(value);
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

    pub fn disposition(mut self, value: DraftAttachmentsItemContentDisposition) -> Self {
        self.disposition = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DraftAttachmentsItemContent`].
    /// This method will fail if any of the following fields are not set:
    /// - [`filename`](DraftAttachmentsItemContentBuilder::filename)
    /// - [`content_type`](DraftAttachmentsItemContentBuilder::content_type)
    /// - [`content`](DraftAttachmentsItemContentBuilder::content)
    /// - [`disposition`](DraftAttachmentsItemContentBuilder::disposition)
    pub fn build(self) -> Result<DraftAttachmentsItemContent, BuildError> {
        Ok(DraftAttachmentsItemContent {
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
            disposition: self
                .disposition
                .ok_or_else(|| BuildError::missing_field("disposition"))?,
        })
    }
}
