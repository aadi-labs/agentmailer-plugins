pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct A2ATaskStatusMessagePartsItem {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub raw: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub url: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub data: Option<serde_json::Value>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, serde_json::Value>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub filename: Option<String>,
    #[serde(rename = "mediaType")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub media_type: Option<String>,
}

impl A2ATaskStatusMessagePartsItem {
    pub fn builder() -> A2ATaskStatusMessagePartsItemBuilder {
        <A2ATaskStatusMessagePartsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskStatusMessagePartsItemBuilder {
    text: Option<String>,
    raw: Option<String>,
    url: Option<String>,
    data: Option<serde_json::Value>,
    metadata: Option<HashMap<String, serde_json::Value>>,
    filename: Option<String>,
    media_type: Option<String>,
}

impl A2ATaskStatusMessagePartsItemBuilder {
    pub fn text(mut self, value: impl Into<String>) -> Self {
        self.text = Some(value.into());
        self
    }

    pub fn raw(mut self, value: impl Into<String>) -> Self {
        self.raw = Some(value.into());
        self
    }

    pub fn url(mut self, value: impl Into<String>) -> Self {
        self.url = Some(value.into());
        self
    }

    pub fn data(mut self, value: serde_json::Value) -> Self {
        self.data = Some(value);
        self
    }

    pub fn metadata(mut self, value: HashMap<String, serde_json::Value>) -> Self {
        self.metadata = Some(value);
        self
    }

    pub fn filename(mut self, value: impl Into<String>) -> Self {
        self.filename = Some(value.into());
        self
    }

    pub fn media_type(mut self, value: impl Into<String>) -> Self {
        self.media_type = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`A2ATaskStatusMessagePartsItem`].
    pub fn build(self) -> Result<A2ATaskStatusMessagePartsItem, BuildError> {
        Ok(A2ATaskStatusMessagePartsItem {
            text: self.text,
            raw: self.raw,
            url: self.url,
            data: self.data,
            metadata: self.metadata,
            filename: self.filename,
            media_type: self.media_type,
        })
    }
}
