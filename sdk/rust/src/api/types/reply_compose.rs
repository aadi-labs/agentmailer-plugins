pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct ReplyCompose {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub to: Option<Vec<ReplyComposeToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<ReplyComposeCcItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<ReplyComposeBccItem>>,
    #[serde(rename = "replyTo")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<Vec<ReplyComposeReplyToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub subject: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub headers: Option<HashMap<String, String>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub attachments: Option<Vec<ReplyComposeAttachmentsItem>>,
}

impl ReplyCompose {
    pub fn builder() -> ReplyComposeBuilder {
        <ReplyComposeBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ReplyComposeBuilder {
    to: Option<Vec<ReplyComposeToItem>>,
    cc: Option<Vec<ReplyComposeCcItem>>,
    bcc: Option<Vec<ReplyComposeBccItem>>,
    reply_to: Option<Vec<ReplyComposeReplyToItem>>,
    subject: Option<String>,
    text: Option<String>,
    html: Option<String>,
    headers: Option<HashMap<String, String>>,
    attachments: Option<Vec<ReplyComposeAttachmentsItem>>,
}

impl ReplyComposeBuilder {
    pub fn to(mut self, value: Vec<ReplyComposeToItem>) -> Self {
        self.to = Some(value);
        self
    }

    pub fn cc(mut self, value: Vec<ReplyComposeCcItem>) -> Self {
        self.cc = Some(value);
        self
    }

    pub fn bcc(mut self, value: Vec<ReplyComposeBccItem>) -> Self {
        self.bcc = Some(value);
        self
    }

    pub fn reply_to(mut self, value: Vec<ReplyComposeReplyToItem>) -> Self {
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

    pub fn attachments(mut self, value: Vec<ReplyComposeAttachmentsItem>) -> Self {
        self.attachments = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ReplyCompose`].
    pub fn build(self) -> Result<ReplyCompose, BuildError> {
        Ok(ReplyCompose {
            to: self.to,
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
