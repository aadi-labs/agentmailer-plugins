pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct SignUpAgentRequest {
    #[serde(default)]
    pub human_email: String,
    #[serde(default)]
    pub username: String,
}

impl SignUpAgentRequest {
    pub fn builder() -> SignUpAgentRequestBuilder {
        <SignUpAgentRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct SignUpAgentRequestBuilder {
    human_email: Option<String>,
    username: Option<String>,
}

impl SignUpAgentRequestBuilder {
    pub fn human_email(mut self, value: impl Into<String>) -> Self {
        self.human_email = Some(value.into());
        self
    }

    pub fn username(mut self, value: impl Into<String>) -> Self {
        self.username = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`SignUpAgentRequest`].
    /// This method will fail if any of the following fields are not set:
    /// - [`human_email`](SignUpAgentRequestBuilder::human_email)
    /// - [`username`](SignUpAgentRequestBuilder::username)
    pub fn build(self) -> Result<SignUpAgentRequest, BuildError> {
        Ok(SignUpAgentRequest {
            human_email: self
                .human_email
                .ok_or_else(|| BuildError::missing_field("human_email"))?,
            username: self
                .username
                .ok_or_else(|| BuildError::missing_field("username"))?,
        })
    }
}
