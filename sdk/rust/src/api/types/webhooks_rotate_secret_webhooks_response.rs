pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct RotateSecretWebhooksResponse {
    #[serde(default)]
    pub secret: String,
}

impl RotateSecretWebhooksResponse {
    pub fn builder() -> RotateSecretWebhooksResponseBuilder {
        <RotateSecretWebhooksResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct RotateSecretWebhooksResponseBuilder {
    secret: Option<String>,
}

impl RotateSecretWebhooksResponseBuilder {
    pub fn secret(mut self, value: impl Into<String>) -> Self {
        self.secret = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`RotateSecretWebhooksResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`secret`](RotateSecretWebhooksResponseBuilder::secret)
    pub fn build(self) -> Result<RotateSecretWebhooksResponse, BuildError> {
        Ok(RotateSecretWebhooksResponse {
            secret: self
                .secret
                .ok_or_else(|| BuildError::missing_field("secret"))?,
        })
    }
}
