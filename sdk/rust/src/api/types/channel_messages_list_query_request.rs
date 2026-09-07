pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ChannelMessagesListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub limit: Option<i64>,
    #[serde(rename = "pageToken")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub page_token: Option<String>,
    #[serde(rename = "endpointId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub endpoint_id: Option<String>,
    #[serde(rename = "conversationId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub conversation_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub channel: Option<ListChannelMessagesRequestChannel>,
}

impl ChannelMessagesListQueryRequest {
    pub fn builder() -> ChannelMessagesListQueryRequestBuilder {
        <ChannelMessagesListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessagesListQueryRequestBuilder {
    limit: Option<i64>,
    page_token: Option<String>,
    endpoint_id: Option<String>,
    conversation_id: Option<String>,
    channel: Option<ListChannelMessagesRequestChannel>,
}

impl ChannelMessagesListQueryRequestBuilder {
    pub fn limit(mut self, value: i64) -> Self {
        self.limit = Some(value);
        self
    }

    pub fn page_token(mut self, value: impl Into<String>) -> Self {
        self.page_token = Some(value.into());
        self
    }

    pub fn endpoint_id(mut self, value: impl Into<String>) -> Self {
        self.endpoint_id = Some(value.into());
        self
    }

    pub fn conversation_id(mut self, value: impl Into<String>) -> Self {
        self.conversation_id = Some(value.into());
        self
    }

    pub fn channel(mut self, value: ListChannelMessagesRequestChannel) -> Self {
        self.channel = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessagesListQueryRequest`].
    pub fn build(self) -> Result<ChannelMessagesListQueryRequest, BuildError> {
        Ok(ChannelMessagesListQueryRequest {
            limit: self.limit,
            page_token: self.page_token,
            endpoint_id: self.endpoint_id,
            conversation_id: self.conversation_id,
            channel: self.channel,
        })
    }
}
