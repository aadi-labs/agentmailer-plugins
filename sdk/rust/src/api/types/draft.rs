pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct Draft {
    #[serde(default)]
    pub to: Vec<DraftToItem>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<DraftCcItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<DraftBccItem>>,
    #[serde(rename = "replyTo")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<Vec<DraftReplyToItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub subject: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub headers: Option<HashMap<String, String>>,
    #[serde(default)]
    pub attachments: Vec<DraftAttachmentsItem>,
    #[serde(rename = "replyToMessageId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reply_to_message_id: Option<String>,
    #[serde(rename = "forwardMessageId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub forward_message_id: Option<String>,
    #[serde(rename = "sendAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub send_at: Option<DateTime<FixedOffset>>,
    #[serde(default)]
    pub id: String,
    #[serde(rename = "inboxId")]
    #[serde(default)]
    pub inbox_id: String,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "updatedAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub updated_at: DateTime<FixedOffset>,
    #[serde(rename = "sendStatus")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub send_status: Option<DraftSendStatus>,
}

impl Draft {
    pub fn builder() -> DraftBuilder {
        <DraftBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct DraftBuilder {
    to: Option<Vec<DraftToItem>>,
    cc: Option<Vec<DraftCcItem>>,
    bcc: Option<Vec<DraftBccItem>>,
    reply_to: Option<Vec<DraftReplyToItem>>,
    subject: Option<String>,
    text: Option<String>,
    html: Option<String>,
    headers: Option<HashMap<String, String>>,
    attachments: Option<Vec<DraftAttachmentsItem>>,
    reply_to_message_id: Option<String>,
    forward_message_id: Option<String>,
    send_at: Option<DateTime<FixedOffset>>,
    id: Option<String>,
    inbox_id: Option<String>,
    created_at: Option<DateTime<FixedOffset>>,
    updated_at: Option<DateTime<FixedOffset>>,
    send_status: Option<DraftSendStatus>,
}

impl DraftBuilder {
    pub fn to(mut self, value: Vec<DraftToItem>) -> Self {
        self.to = Some(value);
        self
    }

    pub fn cc(mut self, value: Vec<DraftCcItem>) -> Self {
        self.cc = Some(value);
        self
    }

    pub fn bcc(mut self, value: Vec<DraftBccItem>) -> Self {
        self.bcc = Some(value);
        self
    }

    pub fn reply_to(mut self, value: Vec<DraftReplyToItem>) -> Self {
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

    pub fn attachments(mut self, value: Vec<DraftAttachmentsItem>) -> Self {
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

    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn inbox_id(mut self, value: impl Into<String>) -> Self {
        self.inbox_id = Some(value.into());
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    pub fn updated_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.updated_at = Some(value);
        self
    }

    pub fn send_status(mut self, value: DraftSendStatus) -> Self {
        self.send_status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Draft`].
    /// This method will fail if any of the following fields are not set:
    /// - [`to`](DraftBuilder::to)
    /// - [`attachments`](DraftBuilder::attachments)
    /// - [`id`](DraftBuilder::id)
    /// - [`inbox_id`](DraftBuilder::inbox_id)
    /// - [`created_at`](DraftBuilder::created_at)
    /// - [`updated_at`](DraftBuilder::updated_at)
    pub fn build(self) -> Result<Draft, BuildError> {
        Ok(Draft {
            to: self.to.ok_or_else(|| BuildError::missing_field("to"))?,
            cc: self.cc,
            bcc: self.bcc,
            reply_to: self.reply_to,
            subject: self.subject,
            text: self.text,
            html: self.html,
            headers: self.headers,
            attachments: self
                .attachments
                .ok_or_else(|| BuildError::missing_field("attachments"))?,
            reply_to_message_id: self.reply_to_message_id,
            forward_message_id: self.forward_message_id,
            send_at: self.send_at,
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            inbox_id: self
                .inbox_id
                .ok_or_else(|| BuildError::missing_field("inbox_id"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            updated_at: self
                .updated_at
                .ok_or_else(|| BuildError::missing_field("updated_at"))?,
            send_status: self.send_status,
        })
    }
}
