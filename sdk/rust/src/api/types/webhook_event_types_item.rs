pub use crate::prelude::*;

#[non_exhaustive]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum WebhookEventTypesItem {
    InboxProvisioning,
    InboxCreated,
    InboxProvisioningFailed,
    MessageReceived,
    MessageSendRequested,
    MessageSent,
    MessageDelivered,
    MessageBounced,
    MessageComplained,
    MessageRejected,
    DomainVerified,
    A2ATaskCreated,
    A2ATaskMessage,
    A2ATaskCanceled,
    A2ASentTaskUpdated,
    /// This variant is used for forward compatibility.
    /// If the server sends a value not recognized by the current SDK version,
    /// it will be captured here with the raw string value.
    __Unknown(String),
}
impl Serialize for WebhookEventTypesItem {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        match self {
            Self::InboxProvisioning => serializer.serialize_str("inbox.provisioning"),
            Self::InboxCreated => serializer.serialize_str("inbox.created"),
            Self::InboxProvisioningFailed => serializer.serialize_str("inbox.provisioning_failed"),
            Self::MessageReceived => serializer.serialize_str("message.received"),
            Self::MessageSendRequested => serializer.serialize_str("message.send.requested"),
            Self::MessageSent => serializer.serialize_str("message.sent"),
            Self::MessageDelivered => serializer.serialize_str("message.delivered"),
            Self::MessageBounced => serializer.serialize_str("message.bounced"),
            Self::MessageComplained => serializer.serialize_str("message.complained"),
            Self::MessageRejected => serializer.serialize_str("message.rejected"),
            Self::DomainVerified => serializer.serialize_str("domain.verified"),
            Self::A2ATaskCreated => serializer.serialize_str("a2a.task.created"),
            Self::A2ATaskMessage => serializer.serialize_str("a2a.task.message"),
            Self::A2ATaskCanceled => serializer.serialize_str("a2a.task.canceled"),
            Self::A2ASentTaskUpdated => serializer.serialize_str("a2a.sent_task.updated"),
            Self::__Unknown(val) => serializer.serialize_str(val),
        }
    }
}

impl<'de> Deserialize<'de> for WebhookEventTypesItem {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "inbox.provisioning" => Ok(Self::InboxProvisioning),
            "inbox.created" => Ok(Self::InboxCreated),
            "inbox.provisioning_failed" => Ok(Self::InboxProvisioningFailed),
            "message.received" => Ok(Self::MessageReceived),
            "message.send.requested" => Ok(Self::MessageSendRequested),
            "message.sent" => Ok(Self::MessageSent),
            "message.delivered" => Ok(Self::MessageDelivered),
            "message.bounced" => Ok(Self::MessageBounced),
            "message.complained" => Ok(Self::MessageComplained),
            "message.rejected" => Ok(Self::MessageRejected),
            "domain.verified" => Ok(Self::DomainVerified),
            "a2a.task.created" => Ok(Self::A2ATaskCreated),
            "a2a.task.message" => Ok(Self::A2ATaskMessage),
            "a2a.task.canceled" => Ok(Self::A2ATaskCanceled),
            "a2a.sent_task.updated" => Ok(Self::A2ASentTaskUpdated),
            _ => Ok(Self::__Unknown(value)),
        }
    }
}

impl fmt::Display for WebhookEventTypesItem {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::InboxProvisioning => write!(f, "inbox.provisioning"),
            Self::InboxCreated => write!(f, "inbox.created"),
            Self::InboxProvisioningFailed => write!(f, "inbox.provisioning_failed"),
            Self::MessageReceived => write!(f, "message.received"),
            Self::MessageSendRequested => write!(f, "message.send.requested"),
            Self::MessageSent => write!(f, "message.sent"),
            Self::MessageDelivered => write!(f, "message.delivered"),
            Self::MessageBounced => write!(f, "message.bounced"),
            Self::MessageComplained => write!(f, "message.complained"),
            Self::MessageRejected => write!(f, "message.rejected"),
            Self::DomainVerified => write!(f, "domain.verified"),
            Self::A2ATaskCreated => write!(f, "a2a.task.created"),
            Self::A2ATaskMessage => write!(f, "a2a.task.message"),
            Self::A2ATaskCanceled => write!(f, "a2a.task.canceled"),
            Self::A2ASentTaskUpdated => write!(f, "a2a.sent_task.updated"),
            Self::__Unknown(val) => write!(f, "{}", val),
        }
    }
}
