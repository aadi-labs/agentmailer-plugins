pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct Error {
    #[serde(default)]
    pub r#type: String,
    #[serde(default)]
    pub title: String,
    #[serde(default)]
    pub status: i64,
    #[serde(default)]
    pub code: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub detail: Option<String>,
    #[serde(rename = "requestId")]
    #[serde(default)]
    pub request_id: String,
}

impl Error {
    pub fn builder() -> ErrorBuilder {
        <ErrorBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ErrorBuilder {
    r#type: Option<String>,
    title: Option<String>,
    status: Option<i64>,
    code: Option<String>,
    detail: Option<String>,
    request_id: Option<String>,
}

impl ErrorBuilder {
    pub fn r#type(mut self, value: impl Into<String>) -> Self {
        self.r#type = Some(value.into());
        self
    }

    pub fn title(mut self, value: impl Into<String>) -> Self {
        self.title = Some(value.into());
        self
    }

    pub fn status(mut self, value: i64) -> Self {
        self.status = Some(value);
        self
    }

    pub fn code(mut self, value: impl Into<String>) -> Self {
        self.code = Some(value.into());
        self
    }

    pub fn detail(mut self, value: impl Into<String>) -> Self {
        self.detail = Some(value.into());
        self
    }

    pub fn request_id(mut self, value: impl Into<String>) -> Self {
        self.request_id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`Error`].
    /// This method will fail if any of the following fields are not set:
    /// - [`r#type`](ErrorBuilder::r#type)
    /// - [`title`](ErrorBuilder::title)
    /// - [`status`](ErrorBuilder::status)
    /// - [`code`](ErrorBuilder::code)
    /// - [`request_id`](ErrorBuilder::request_id)
    pub fn build(self) -> Result<Error, BuildError> {
        Ok(Error {
            r#type: self
                .r#type
                .ok_or_else(|| BuildError::missing_field("r#type"))?,
            title: self
                .title
                .ok_or_else(|| BuildError::missing_field("title"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            code: self.code.ok_or_else(|| BuildError::missing_field("code"))?,
            detail: self.detail,
            request_id: self
                .request_id
                .ok_or_else(|| BuildError::missing_field("request_id"))?,
        })
    }
}
