pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct A2ATaskUpdate {
    pub state: A2ATaskUpdateState,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub message: Option<A2ATaskUpdateMessage>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub artifacts: Option<Vec<A2ATaskUpdateArtifactsItem>>,
}

impl A2ATaskUpdate {
    pub fn builder() -> A2ATaskUpdateBuilder {
        <A2ATaskUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskUpdateBuilder {
    state: Option<A2ATaskUpdateState>,
    message: Option<A2ATaskUpdateMessage>,
    artifacts: Option<Vec<A2ATaskUpdateArtifactsItem>>,
}

impl A2ATaskUpdateBuilder {
    pub fn state(mut self, value: A2ATaskUpdateState) -> Self {
        self.state = Some(value);
        self
    }

    pub fn message(mut self, value: A2ATaskUpdateMessage) -> Self {
        self.message = Some(value);
        self
    }

    pub fn artifacts(mut self, value: Vec<A2ATaskUpdateArtifactsItem>) -> Self {
        self.artifacts = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2ATaskUpdate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`state`](A2ATaskUpdateBuilder::state)
    pub fn build(self) -> Result<A2ATaskUpdate, BuildError> {
        Ok(A2ATaskUpdate {
            state: self
                .state
                .ok_or_else(|| BuildError::missing_field("state"))?,
            message: self.message,
            artifacts: self.artifacts,
        })
    }
}
