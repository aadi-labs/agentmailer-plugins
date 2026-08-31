pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct DraftUpdate {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub to: Option<Vec<DraftUpdateToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<DraftUpdateCcItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<DraftUpdateBccItem>>,
    #[serde(rename = "replyTo")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<Vec<DraftUpdateReplyToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub subject: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub headers: Option<HashMap<String, String>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub attachments: Option<Vec<DraftUpdateAttachmentsItem>>,
    #[serde(rename = "replyToMessageId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to_message_id: Option<String>,
    #[serde(rename = "forwardMessageId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub forward_message_id: Option<String>,
    #[serde(rename = "sendAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub send_at: Option<DateTime<FixedOffset>>,
}

impl DraftUpdate {
    pub fn builder() -> DraftUpdateBuilder {
        <DraftUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftUpdateBuilder {
    to: Option<Vec<DraftUpdateToItem>>,
    cc: Option<Vec<DraftUpdateCcItem>>,
    bcc: Option<Vec<DraftUpdateBccItem>>,
    reply_to: Option<Vec<DraftUpdateReplyToItem>>,
    subject: Option<String>,
    text: Option<String>,
    html: Option<String>,
    headers: Option<HashMap<String, String>>,
    attachments: Option<Vec<DraftUpdateAttachmentsItem>>,
    reply_to_message_id: Option<String>,
    forward_message_id: Option<String>,
    send_at: Option<DateTime<FixedOffset>>,
}

impl DraftUpdateBuilder {
    pub fn to(mut self, value: Vec<DraftUpdateToItem>) -> Self {
        self.to = Some(value);
        self
    }

    pub fn cc(mut self, value: Vec<DraftUpdateCcItem>) -> Self {
        self.cc = Some(value);
        self
    }

    pub fn bcc(mut self, value: Vec<DraftUpdateBccItem>) -> Self {
        self.bcc = Some(value);
        self
    }

    pub fn reply_to(mut self, value: Vec<DraftUpdateReplyToItem>) -> Self {
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

    pub fn attachments(mut self, value: Vec<DraftUpdateAttachmentsItem>) -> Self {
        self.attachments = Some(value);
        self
    }

    pub fn reply_to_message_id(mut self, value: impl Into<String>) -> Self {
        self.reply_to_message_id = Some(value.into());
        self
    }

    pub fn forward_message_id(mut self, value: impl Into<String>) -> Self {
        self.forward_message_id = Some(value.into());
        self
    }

    pub fn send_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.send_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`DraftUpdate`].
    pub fn build(self) -> Result<DraftUpdate, BuildError> {
        Ok(DraftUpdate {
            to: self.to,
            cc: self.cc,
            bcc: self.bcc,
            reply_to: self.reply_to,
            subject: self.subject,
            text: self.text,
            html: self.html,
            headers: self.headers,
            attachments: self.attachments,
            reply_to_message_id: self.reply_to_message_id,
            forward_message_id: self.forward_message_id,
            send_at: self.send_at,
        })
    }
}
