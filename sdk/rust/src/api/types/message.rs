pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Message {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "inboxId")]
    #[serde(default)]
    pub inbox_id: String,
    #[serde(rename = "threadId")]
    #[serde(default)]
    pub thread_id: String,
    pub direction: MessageDirection,
    pub status: MessageStatus,
    pub from: MessageFrom,
    #[serde(default)]
    pub to: Vec<MessageToItem>,
    #[serde(default)]
    pub cc: Vec<MessageCcItem>,
    #[serde(default)]
    pub bcc: Vec<MessageBccItem>,
    #[serde(rename = "replyTo")]
    #[serde(default)]
    pub reply_to: Vec<MessageReplyToItem>,
    #[serde(default)]
    pub subject: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    /// Untrusted email HTML. Sanitize and isolate it before browser rendering.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(rename = "extractedText")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub extracted_text: Option<String>,
    /// Untrusted latest-reply HTML. Sanitize and isolate it before browser rendering.
    #[serde(rename = "extractedHtml")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub extracted_html: Option<String>,
    #[serde(default)]
    pub headers: HashMap<String, String>,
    #[serde(rename = "inReplyTo")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub in_reply_to: Option<String>,
    #[serde(default)]
    pub references: Vec<String>,
    #[serde(default)]
    pub attachments: Vec<MessageAttachmentsItem>,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
    #[serde(rename = "sentAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub sent_at: Option<DateTime<FixedOffset>>,
    #[serde(rename = "receivedAt")]
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset::option")]
    pub received_at: Option<DateTime<FixedOffset>>,
}

impl Message {
    pub fn builder() -> MessageBuilder {
        <MessageBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct MessageBuilder {
    id: Option<String>,
    inbox_id: Option<String>,
    thread_id: Option<String>,
    direction: Option<MessageDirection>,
    status: Option<MessageStatus>,
    from: Option<MessageFrom>,
    to: Option<Vec<MessageToItem>>,
    cc: Option<Vec<MessageCcItem>>,
    bcc: Option<Vec<MessageBccItem>>,
    reply_to: Option<Vec<MessageReplyToItem>>,
    subject: Option<String>,
    text: Option<String>,
    html: Option<String>,
    extracted_text: Option<String>,
    extracted_html: Option<String>,
    headers: Option<HashMap<String, String>>,
    in_reply_to: Option<String>,
    references: Option<Vec<String>>,
    attachments: Option<Vec<MessageAttachmentsItem>>,
    created_at: Option<DateTime<FixedOffset>>,
    sent_at: Option<DateTime<FixedOffset>>,
    received_at: Option<DateTime<FixedOffset>>,
}

impl MessageBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn inbox_id(mut self, value: impl Into<String>) -> Self {
        self.inbox_id = Some(value.into());
        self
    }

    pub fn thread_id(mut self, value: impl Into<String>) -> Self {
        self.thread_id = Some(value.into());
        self
    }

    pub fn direction(mut self, value: MessageDirection) -> Self {
        self.direction = Some(value);
        self
    }

    pub fn status(mut self, value: MessageStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn from(mut self, value: MessageFrom) -> Self {
        self.from = Some(value);
        self
    }

    pub fn to(mut self, value: Vec<MessageToItem>) -> Self {
        self.to = Some(value);
        self
    }

    pub fn cc(mut self, value: Vec<MessageCcItem>) -> Self {
        self.cc = Some(value);
        self
    }

    pub fn bcc(mut self, value: Vec<MessageBccItem>) -> Self {
        self.bcc = Some(value);
        self
    }

    pub fn reply_to(mut self, value: Vec<MessageReplyToItem>) -> Self {
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

    pub fn extracted_text(mut self, value: impl Into<String>) -> Self {
        self.extracted_text = Some(value.into());
        self
    }

    pub fn extracted_html(mut self, value: impl Into<String>) -> Self {
        self.extracted_html = Some(value.into());
        self
    }

    pub fn headers(mut self, value: HashMap<String, String>) -> Self {
        self.headers = Some(value);
        self
    }

    pub fn in_reply_to(mut self, value: impl Into<String>) -> Self {
        self.in_reply_to = Some(value.into());
        self
    }

    pub fn references(mut self, value: Vec<String>) -> Self {
        self.references = Some(value);
        self
    }

    pub fn attachments(mut self, value: Vec<MessageAttachmentsItem>) -> Self {
        self.attachments = Some(value);
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    pub fn sent_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.sent_at = Some(value);
        self
    }

    pub fn received_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.received_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Message`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](MessageBuilder::id)
    /// - [`inbox_id`](MessageBuilder::inbox_id)
    /// - [`thread_id`](MessageBuilder::thread_id)
    /// - [`direction`](MessageBuilder::direction)
    /// - [`status`](MessageBuilder::status)
    /// - [`from`](MessageBuilder::from)
    /// - [`to`](MessageBuilder::to)
    /// - [`cc`](MessageBuilder::cc)
    /// - [`bcc`](MessageBuilder::bcc)
    /// - [`reply_to`](MessageBuilder::reply_to)
    /// - [`subject`](MessageBuilder::subject)
    /// - [`headers`](MessageBuilder::headers)
    /// - [`references`](MessageBuilder::references)
    /// - [`attachments`](MessageBuilder::attachments)
    /// - [`created_at`](MessageBuilder::created_at)
    pub fn build(self) -> Result<Message, BuildError> {
        Ok(Message {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            inbox_id: self
                .inbox_id
                .ok_or_else(|| BuildError::missing_field("inbox_id"))?,
            thread_id: self
                .thread_id
                .ok_or_else(|| BuildError::missing_field("thread_id"))?,
            direction: self
                .direction
                .ok_or_else(|| BuildError::missing_field("direction"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            from: self.from.ok_or_else(|| BuildError::missing_field("from"))?,
            to: self.to.ok_or_else(|| BuildError::missing_field("to"))?,
            cc: self.cc.ok_or_else(|| BuildError::missing_field("cc"))?,
            bcc: self.bcc.ok_or_else(|| BuildError::missing_field("bcc"))?,
            reply_to: self
                .reply_to
                .ok_or_else(|| BuildError::missing_field("reply_to"))?,
            subject: self
                .subject
                .ok_or_else(|| BuildError::missing_field("subject"))?,
            text: self.text,
            html: self.html,
            extracted_text: self.extracted_text,
            extracted_html: self.extracted_html,
            headers: self
                .headers
                .ok_or_else(|| BuildError::missing_field("headers"))?,
            in_reply_to: self.in_reply_to,
            references: self
                .references
                .ok_or_else(|| BuildError::missing_field("references"))?,
            attachments: self
                .attachments
                .ok_or_else(|| BuildError::missing_field("attachments"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
            sent_at: self.sent_at,
            received_at: self.received_at,
        })
    }
}
