pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(tag = "channel")]
#[non_exhaustive]
pub enum ChannelMessageSend {
    #[serde(rename = "sms")]
    #[non_exhaustive]
    Sms {
        #[serde(rename = "endpointId")]
        #[serde(default)]
        endpoint_id: String,
        #[serde(default)]
        to: String,
        consent: ChannelMessageSendSmsConsent,
        content: ChannelMessageSendSmsContent,
        #[serde(rename = "messageType")]
        #[serde(skip_serializing_if = "Option::is_none")]
        message_type: Option<ChannelMessageSendSmsMessageType>,
    },

    #[serde(rename = "mms")]
    #[non_exhaustive]
    Mms {
        #[serde(rename = "endpointId")]
        #[serde(default)]
        endpoint_id: String,
        #[serde(default)]
        to: String,
        consent: ChannelMessageSendMmsConsent,
        #[serde(skip_serializing_if = "Option::is_none")]
        content: Option<ChannelMessageSendMmsContent>,
        #[serde(rename = "attachmentIds")]
        #[serde(default)]
        attachment_ids: Vec<serde_json::Value>,
    },

    #[serde(rename = "rcs")]
    #[non_exhaustive]
    Rcs {
        #[serde(rename = "endpointId")]
        #[serde(default)]
        endpoint_id: String,
        #[serde(default)]
        to: String,
        consent: ChannelMessageSendRcsConsent,
        content: ChannelMessageSendRcsContent,
        #[serde(skip_serializing_if = "Option::is_none")]
        fallback: Option<ChannelMessageSendRcsFallback>,
    },

    #[serde(rename = "whatsapp")]
    #[non_exhaustive]
    Whatsapp {
        #[serde(rename = "endpointId")]
        #[serde(default)]
        endpoint_id: String,
        #[serde(default)]
        to: String,
        consent: ChannelMessageSendWhatsappConsent,
        content: ChannelMessageSendWhatsappContent,
    },

    #[serde(rename = "voice")]
    #[non_exhaustive]
    Voice {
        #[serde(rename = "endpointId")]
        #[serde(default)]
        endpoint_id: String,
        #[serde(default)]
        to: String,
        consent: ChannelMessageSendVoiceConsent,
        content: ChannelMessageSendVoiceContent,
        #[serde(rename = "textType")]
        #[serde(skip_serializing_if = "Option::is_none")]
        text_type: Option<ChannelMessageSendVoiceTextType>,
        #[serde(rename = "voiceId")]
        #[serde(skip_serializing_if = "Option::is_none")]
        voice_id: Option<String>,
    },

    /// Catch-all variant for unrecognized discriminant values.
    /// If the server sends a discriminant not recognized by the current SDK
    /// version, the raw payload is captured here so callers can still inspect it.
    #[serde(untagged)]
    __Unknown(serde_json::Value),
}

impl ChannelMessageSend {
    pub fn sms(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendSmsConsent,
        content: ChannelMessageSendSmsContent,
    ) -> Self {
        Self::Sms {
            endpoint_id,
            to,
            consent,
            content,
            message_type: None,
        }
    }

    pub fn mms(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendMmsConsent,
        attachment_ids: Vec<serde_json::Value>,
    ) -> Self {
        Self::Mms {
            endpoint_id,
            to,
            consent,
            content: None,
            attachment_ids,
        }
    }

    pub fn rcs(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendRcsConsent,
        content: ChannelMessageSendRcsContent,
    ) -> Self {
        Self::Rcs {
            endpoint_id,
            to,
            consent,
            content,
            fallback: None,
        }
    }

    pub fn whatsapp(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendWhatsappConsent,
        content: ChannelMessageSendWhatsappContent,
    ) -> Self {
        Self::Whatsapp {
            endpoint_id,
            to,
            consent,
            content,
        }
    }

    pub fn voice(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendVoiceConsent,
        content: ChannelMessageSendVoiceContent,
    ) -> Self {
        Self::Voice {
            endpoint_id,
            to,
            consent,
            content,
            text_type: None,
            voice_id: None,
        }
    }

    pub fn sms_with_message_type(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendSmsConsent,
        content: ChannelMessageSendSmsContent,
        message_type: ChannelMessageSendSmsMessageType,
    ) -> Self {
        Self::Sms {
            endpoint_id,
            to,
            consent,
            content,
            message_type: Some(message_type),
        }
    }

    pub fn mms_with_content(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendMmsConsent,
        content: ChannelMessageSendMmsContent,
        attachment_ids: Vec<serde_json::Value>,
    ) -> Self {
        Self::Mms {
            endpoint_id,
            to,
            consent,
            content: Some(content),
            attachment_ids,
        }
    }

    pub fn rcs_with_fallback(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendRcsConsent,
        content: ChannelMessageSendRcsContent,
        fallback: ChannelMessageSendRcsFallback,
    ) -> Self {
        Self::Rcs {
            endpoint_id,
            to,
            consent,
            content,
            fallback: Some(fallback),
        }
    }

    pub fn voice_with_text_type(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendVoiceConsent,
        content: ChannelMessageSendVoiceContent,
        text_type: ChannelMessageSendVoiceTextType,
        voice_id: Option<String>,
    ) -> Self {
        Self::Voice {
            endpoint_id,
            to,
            consent,
            content,
            text_type: Some(text_type),
            voice_id,
        }
    }

    pub fn voice_with_voice_id(
        endpoint_id: String,
        to: String,
        consent: ChannelMessageSendVoiceConsent,
        content: ChannelMessageSendVoiceContent,
        text_type: Option<ChannelMessageSendVoiceTextType>,
        voice_id: String,
    ) -> Self {
        Self::Voice {
            endpoint_id,
            to,
            consent,
            content,
            text_type,
            voice_id: Some(voice_id),
        }
    }

    pub fn unknown(value: serde_json::Value) -> Self {
        Self::__Unknown(value)
    }
}
