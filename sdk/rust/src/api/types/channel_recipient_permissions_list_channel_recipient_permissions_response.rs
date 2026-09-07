pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct ListChannelRecipientPermissionsResponse {
    #[serde(default)]
    pub permissions: Vec<ChannelRecipientPermission>,
    #[serde(rename = "nextPageToken")]
    #[serde(default)]
    pub next_page_token: String,
}

impl ListChannelRecipientPermissionsResponse {
    pub fn builder() -> ListChannelRecipientPermissionsResponseBuilder {
        <ListChannelRecipientPermissionsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListChannelRecipientPermissionsResponseBuilder {
    permissions: Option<Vec<ChannelRecipientPermission>>,
    next_page_token: Option<String>,
}

impl ListChannelRecipientPermissionsResponseBuilder {
    pub fn permissions(mut self, value: Vec<ChannelRecipientPermission>) -> Self {
        self.permissions = Some(value);
        self
    }

    pub fn next_page_token(mut self, value: impl Into<String>) -> Self {
        self.next_page_token = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`ListChannelRecipientPermissionsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`permissions`](ListChannelRecipientPermissionsResponseBuilder::permissions)
    /// - [`next_page_token`](ListChannelRecipientPermissionsResponseBuilder::next_page_token)
    pub fn build(self) -> Result<ListChannelRecipientPermissionsResponse, BuildError> {
        Ok(ListChannelRecipientPermissionsResponse {
            permissions: self
                .permissions
                .ok_or_else(|| BuildError::missing_field("permissions"))?,
            next_page_token: self
                .next_page_token
                .ok_or_else(|| BuildError::missing_field("next_page_token"))?,
        })
    }
}
