pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct IssueCredentialsInboxesResponse {
    #[serde(default)]
    pub username: String,
    #[serde(default)]
    pub password: String,
    pub imap: MailProtocolEndpoint,
    pub smtp: MailProtocolEndpoint,
}

impl IssueCredentialsInboxesResponse {
    pub fn builder() -> IssueCredentialsInboxesResponseBuilder {
        <IssueCredentialsInboxesResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct IssueCredentialsInboxesResponseBuilder {
    username: Option<String>,
    password: Option<String>,
    imap: Option<MailProtocolEndpoint>,
    smtp: Option<MailProtocolEndpoint>,
}

impl IssueCredentialsInboxesResponseBuilder {
    pub fn username(mut self, value: impl Into<String>) -> Self {
        self.username = Some(value.into());
        self
    }

    pub fn password(mut self, value: impl Into<String>) -> Self {
        self.password = Some(value.into());
        self
    }

    pub fn imap(mut self, value: MailProtocolEndpoint) -> Self {
        self.imap = Some(value);
        self
    }

    pub fn smtp(mut self, value: MailProtocolEndpoint) -> Self {
        self.smtp = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`IssueCredentialsInboxesResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`username`](IssueCredentialsInboxesResponseBuilder::username)
    /// - [`password`](IssueCredentialsInboxesResponseBuilder::password)
    /// - [`imap`](IssueCredentialsInboxesResponseBuilder::imap)
    /// - [`smtp`](IssueCredentialsInboxesResponseBuilder::smtp)
    pub fn build(self) -> Result<IssueCredentialsInboxesResponse, BuildError> {
        Ok(IssueCredentialsInboxesResponse {
            username: self
                .username
                .ok_or_else(|| BuildError::missing_field("username"))?,
            password: self
                .password
                .ok_or_else(|| BuildError::missing_field("password"))?,
            imap: self.imap.ok_or_else(|| BuildError::missing_field("imap"))?,
            smtp: self.smtp.ok_or_else(|| BuildError::missing_field("smtp"))?,
        })
    }
}
