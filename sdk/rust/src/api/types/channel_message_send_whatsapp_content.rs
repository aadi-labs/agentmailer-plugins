pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(tag = "type")]
#[non_exhaustive]
pub enum ChannelMessageSendWhatsappContent {
    #[serde(rename = "text")]
    #[non_exhaustive]
    Text {
        #[serde(default)]
        body: String,
    },

    #[serde(rename = "template")]
    #[non_exhaustive]
    Template {
        #[serde(default)]
        name: String,
        #[serde(rename = "languageCode")]
        #[serde(default)]
        language_code: String,
        #[serde(skip_serializing_if = "Option::is_none")]
        components: Option<Vec<HashMap<String, serde_json::Value>>>,
    },

    #[serde(rename = "media")]
    #[non_exhaustive]
    Media {
        kind: ChannelMessageSendWhatsappContentMediaKind,
        #[serde(rename = "attachmentId")]
        #[serde(default)]
        attachment_id: String,
    },

    #[serde(rename = "buttons")]
    #[non_exhaustive]
    Buttons {
        #[serde(default)]
        body: String,
        #[serde(default)]
        buttons: Vec<ChannelMessageSendWhatsappContentButtonsButtonsItem>,
    },

    /// Catch-all variant for unrecognized discriminant values.
    /// If the server sends a discriminant not recognized by the current SDK
    /// version, the raw payload is captured here so callers can still inspect it.
    #[serde(untagged)]
    __Unknown(serde_json::Value),
}

impl ChannelMessageSendWhatsappContent {
    pub fn text(body: String) -> Self {
        Self::Text { body }
    }

    pub fn template(name: String, language_code: String) -> Self {
        Self::Template {
            name,
            language_code,
            components: None,
        }
    }

    pub fn media(kind: ChannelMessageSendWhatsappContentMediaKind, attachment_id: String) -> Self {
        Self::Media {
            kind,
            attachment_id,
        }
    }

    pub fn buttons(
        body: String,
        buttons: Vec<ChannelMessageSendWhatsappContentButtonsButtonsItem>,
    ) -> Self {
        Self::Buttons { body, buttons }
    }

    pub fn template_with_components(
        name: String,
        language_code: String,
        components: Vec<HashMap<String, serde_json::Value>>,
    ) -> Self {
        Self::Template {
            name,
            language_code,
            components: Some(components),
        }
    }

    pub fn unknown(value: serde_json::Value) -> Self {
        Self::__Unknown(value)
    }
}
