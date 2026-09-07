pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ChannelConversationsListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub limit: Option<i64>,
    #[serde(rename = "pageToken")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub page_token: Option<String>,
    #[serde(rename = "endpointId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub endpoint_id: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub channel: Option<ListChannelConversationsRequestChannel>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub status: Option<ListChannelConversationsRequestStatus>,
}

impl ChannelConversationsListQueryRequest {
    pub fn builder() -> ChannelConversationsListQueryRequestBuilder {
        <ChannelConversationsListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelConversationsListQueryRequestBuilder {
    limit: Option<i64>,
    page_token: Option<String>,
    endpoint_id: Option<String>,
    channel: Option<ListChannelConversationsRequestChannel>,
    status: Option<ListChannelConversationsRequestStatus>,
}

impl ChannelConversationsListQueryRequestBuilder {
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

    pub fn channel(mut self, value: ListChannelConversationsRequestChannel) -> Self {
        self.channel = Some(value);
        self
    }

    pub fn status(mut self, value: ListChannelConversationsRequestStatus) -> Self {
        self.status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelConversationsListQueryRequest`].
    pub fn build(self) -> Result<ChannelConversationsListQueryRequest, BuildError> {
        Ok(ChannelConversationsListQueryRequest {
            limit: self.limit,
            page_token: self.page_token,
            endpoint_id: self.endpoint_id,
            channel: self.channel,
            status: self.status,
        })
    }
}
