pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct MessageCompose {
    #[serde(default)]
    pub to: Vec<MessageComposeToItem>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<MessageComposeCcItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<MessageComposeBccItem>>,
    #[serde(rename = "replyTo")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<Vec<MessageComposeReplyToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub subject: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub headers: Option<HashMap<String, String>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub attachments: Option<Vec<MessageComposeAttachmentsItem>>,
}

impl MessageCompose {
    pub fn builder() -> MessageComposeBuilder {
        <MessageComposeBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageComposeBuilder {
    to: Option<Vec<MessageComposeToItem>>,
    cc: Option<Vec<MessageComposeCcItem>>,
    bcc: Option<Vec<MessageComposeBccItem>>,
    reply_to: Option<Vec<MessageComposeReplyToItem>>,
    subject: Option<String>,
    text: Option<String>,
    html: Option<String>,
    headers: Option<HashMap<String, String>>,
    attachments: Option<Vec<MessageComposeAttachmentsItem>>,
}

impl MessageComposeBuilder {
    pub fn to(mut self, value: Vec<MessageComposeToItem>) -> Self {
        self.to = Some(value);
        self
    }

    pub fn cc(mut self, value: Vec<MessageComposeCcItem>) -> Self {
        self.cc = Some(value);
        self
    }

    pub fn bcc(mut self, value: Vec<MessageComposeBccItem>) -> Self {
        self.bcc = Some(value);
        self
    }

    pub fn reply_to(mut self, value: Vec<MessageComposeReplyToItem>) -> Self {
        self.reply_to = Some(value);
        self
    }

    pub fn subject(mut self, value: impl Into<String>) -> Self {
        self.subject = Some(value.into());
        self
    }

    pub fn text(mut self, value: impl Into<String>) -> Self {
        self.text = Some(value.into());
        self
    }

    pub fn html(mut self, value: impl Into<String>) -> Self {
        self.html = Some(value.into());
        self
    }

    pub fn headers(mut self, value: HashMap<String, String>) -> Self {
        self.headers = Some(value);
        self
    }

    pub fn attachments(mut self, value: Vec<MessageComposeAttachmentsItem>) -> Self {
        self.attachments = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`MessageCompose`].
    /// This method will fail if any of the following fields are not set:
    /// - [`to`](MessageComposeBuilder::to)
    pub fn build(self) -> Result<MessageCompose, BuildError> {
        Ok(MessageCompose {
            to: self.to.ok_or_else(|| BuildError::missing_field("to"))?,
            cc: self.cc,
            bcc: self.bcc,
            reply_to: self.reply_to,
            subject: self.subject,
            text: self.text,
            html: self.html,
            headers: self.headers,
            attachments: self.attachments,
        })
    }
}
