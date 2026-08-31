pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct SignUpAgentResponse {
    pub status: SignUpAgentResponseStatus,
    #[serde(default)]
    pub username: String,
    #[serde(rename = "requestedEmailAddress")]
    #[serde(default)]
    pub requested_email_address: String,
    #[serde(rename = "approvalUrl")]
    #[serde(default)]
    pub approval_url: String,
}

impl SignUpAgentResponse {
    pub fn builder() -> SignUpAgentResponseBuilder {
        <SignUpAgentResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct SignUpAgentResponseBuilder {
    status: Option<SignUpAgentResponseStatus>,
    username: Option<String>,
    requested_email_address: Option<String>,
    approval_url: Option<String>,
}

impl SignUpAgentResponseBuilder {
    pub fn status(mut self, value: SignUpAgentResponseStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn username(mut self, value: impl Into<String>) -> Self {
        self.username = Some(value.into());
        self
    }

    pub fn requested_email_address(mut self, value: impl Into<String>) -> Self {
        self.requested_email_address = Some(value.into());
        self
    }

    pub fn approval_url(mut self, value: impl Into<String>) -> Self {
        self.approval_url = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`SignUpAgentResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`status`](SignUpAgentResponseBuilder::status)
    /// - [`username`](SignUpAgentResponseBuilder::username)
    /// - [`requested_email_address`](SignUpAgentResponseBuilder::requested_email_address)
    /// - [`approval_url`](SignUpAgentResponseBuilder::approval_url)
    pub fn build(self) -> Result<SignUpAgentResponse, BuildError> {
        Ok(SignUpAgentResponse {
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            username: self
                .username
                .ok_or_else(|| BuildError::missing_field("username"))?,
            requested_email_address: self
                .requested_email_address
                .ok_or_else(|| BuildError::missing_field("requested_email_address"))?,
            approval_url: self
                .approval_url
                .ok_or_else(|| BuildError::missing_field("approval_url"))?,
        })
    }
}
