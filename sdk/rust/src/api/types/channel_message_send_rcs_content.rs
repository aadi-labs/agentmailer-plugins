pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(tag = "type")]
#[non_exhaustive]
pub enum ChannelMessageSendRcsContent {
    #[serde(rename = "text")]
    #[non_exhaustive]
    Text {
        #[serde(default)]
        body: String,
    },

    #[serde(rename = "rich_card")]
    #[non_exhaustive]
    RichCard {
        #[serde(default)]
        body: String,
        #[serde(default)]
        title: String,
        #[serde(skip_serializing_if = "Option::is_none")]
        description: Option<String>,
        #[serde(rename = "attachmentId")]
        #[serde(skip_serializing_if = "Option::is_none")]
        attachment_id: Option<String>,
        #[serde(skip_serializing_if = "Option::is_none")]
        replies: Option<Vec<ChannelMessageSendRcsContentRichCardRepliesItem>>,
    },

    /// Catch-all variant for unrecognized discriminant values.
    /// If the server sends a discriminant not recognized by the current SDK
    /// version, the raw payload is captured here so callers can still inspect it.
    #[serde(untagged)]
    __Unknown(serde_json::Value),
}

impl ChannelMessageSendRcsContent {
    pub fn text(body: String) -> Self {
        Self::Text { body }
    }

    pub fn rich_card(body: String, title: String) -> Self {
        Self::RichCard {
            body,
            title,
            description: None,
            attachment_id: None,
            replies: None,
        }
    }

    pub fn rich_card_with_description(
        body: String,
        title: String,
        description: String,
        attachment_id: Option<String>,
        replies: Option<Vec<ChannelMessageSendRcsContentRichCardRepliesItem>>,
    ) -> Self {
        Self::RichCard {
            body,
            title,
            description: Some(description),
            attachment_id,
            replies,
        }
    }

    pub fn rich_card_with_attachment_id(
        body: String,
        title: String,
        description: Option<String>,
        attachment_id: String,
        replies: Option<Vec<ChannelMessageSendRcsContentRichCardRepliesItem>>,
    ) -> Self {
        Self::RichCard {
            body,
            title,
            description,
            attachment_id: Some(attachment_id),
            replies,
        }
    }

    pub fn rich_card_with_replies(
        body: String,
        title: String,
        description: Option<String>,
        attachment_id: Option<String>,
        replies: Vec<ChannelMessageSendRcsContentRichCardRepliesItem>,
    ) -> Self {
        Self::RichCard {
            body,
            title,
            description,
            attachment_id,
            replies: Some(replies),
        }
    }

    pub fn unknown(value: serde_json::Value) -> Self {
        Self::__Unknown(value)
    }
}
