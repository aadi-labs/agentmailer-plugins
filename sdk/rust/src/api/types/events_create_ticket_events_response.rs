pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreateTicketEventsResponse {
    #[serde(default)]
    pub ticket: String,
    #[serde(rename = "expiresIn")]
    #[serde(default)]
    pub expires_in: i64,
    #[serde(rename = "websocketUrl")]
    #[serde(default)]
    pub websocket_url: String,
}

impl CreateTicketEventsResponse {
    pub fn builder() -> CreateTicketEventsResponseBuilder {
        <CreateTicketEventsResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateTicketEventsResponseBuilder {
    ticket: Option<String>,
    expires_in: Option<i64>,
    websocket_url: Option<String>,
}

impl CreateTicketEventsResponseBuilder {
    pub fn ticket(mut self, value: impl Into<String>) -> Self {
        self.ticket = Some(value.into());
        self
    }

    pub fn expires_in(mut self, value: i64) -> Self {
        self.expires_in = Some(value);
        self
    }

    pub fn websocket_url(mut self, value: impl Into<String>) -> Self {
        self.websocket_url = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`CreateTicketEventsResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`ticket`](CreateTicketEventsResponseBuilder::ticket)
    /// - [`expires_in`](CreateTicketEventsResponseBuilder::expires_in)
    /// - [`websocket_url`](CreateTicketEventsResponseBuilder::websocket_url)
    pub fn build(self) -> Result<CreateTicketEventsResponse, BuildError> {
        Ok(CreateTicketEventsResponse {
            ticket: self
                .ticket
                .ok_or_else(|| BuildError::missing_field("ticket"))?,
            expires_in: self
                .expires_in
                .ok_or_else(|| BuildError::missing_field("expires_in"))?,
            websocket_url: self
                .websocket_url
                .ok_or_else(|| BuildError::missing_field("websocket_url"))?,
        })
    }
}
