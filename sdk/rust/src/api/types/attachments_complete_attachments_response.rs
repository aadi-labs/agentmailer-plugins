pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct CompleteAttachmentsResponse {
    pub attachment: Attachment,
}

impl CompleteAttachmentsResponse {
    pub fn builder() -> CompleteAttachmentsResponseBuilder {
        <CompleteAttachmentsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CompleteAttachmentsResponseBuilder {
    attachment: Option<Attachment>,
}

impl CompleteAttachmentsResponseBuilder {
    pub fn attachment(mut self, value: Attachment) -> Self {
        self.attachment = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`CompleteAttachmentsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`attachment`](CompleteAttachmentsResponseBuilder::attachment)
    pub fn build(self) -> Result<CompleteAttachmentsResponse, BuildError> {
        Ok(CompleteAttachmentsResponse {
            attachment: self
                .attachment
                .ok_or_else(|| BuildError::missing_field("attachment"))?,
        })
    }
}
