pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct Thread {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub subject: String,
    #[serde(default)]
    pub participants: Vec<ThreadParticipantsItem>,
    #[serde(rename = "messageCount")]
    #[serde(default)]
    pub message_count: i64,
    #[serde(rename = "lastMessageAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub last_message_at: DateTime<FixedOffset>,
}

impl Thread {
    pub fn builder() -> ThreadBuilder {
        <ThreadBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ThreadBuilder {
    id: Option<String>,
    subject: Option<String>,
    participants: Option<Vec<ThreadParticipantsItem>>,
    message_count: Option<i64>,
    last_message_at: Option<DateTime<FixedOffset>>,
}

impl ThreadBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn subject(mut self, value: impl Into<String>) -> Self {
        self.subject = Some(value.into());
        self
    }

    pub fn participants(mut self, value: Vec<ThreadParticipantsItem>) -> Self {
        self.participants = Some(value);
        self
    }

    pub fn message_count(mut self, value: i64) -> Self {
        self.message_count = Some(value);
        self
    }

    pub fn last_message_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.last_message_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Thread`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](ThreadBuilder::id)
    /// - [`subject`](ThreadBuilder::subject)
    /// - [`participants`](ThreadBuilder::participants)
    /// - [`message_count`](ThreadBuilder::message_count)
    /// - [`last_message_at`](ThreadBuilder::last_message_at)
    pub fn build(self) -> Result<Thread, BuildError> {
        Ok(Thread {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            subject: self
                .subject
                .ok_or_else(|| BuildError::missing_field("subject"))?,
            participants: self
                .participants
                .ok_or_else(|| BuildError::missing_field("participants"))?,
            message_count: self
                .message_count
                .ok_or_else(|| BuildError::missing_field("message_count"))?,
            last_message_at: self
                .last_message_at
                .ok_or_else(|| BuildError::missing_field("last_message_at"))?,
        })
    }
}
