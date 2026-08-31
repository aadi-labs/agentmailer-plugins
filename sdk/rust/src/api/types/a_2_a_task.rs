pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct A2ATask {
    #[serde(default)]
    pub id: String,
    #[serde(rename = "contextId")]
    #[serde(default)]
    pub context_id: String,
    pub status: A2ATaskStatus,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub artifacts: Option<Vec<A2ATaskArtifactsItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub history: Option<Vec<A2ATaskHistoryItem>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, serde_json::Value>>,
}

impl A2ATask {
    pub fn builder() -> A2ATaskBuilder {
        <A2ATaskBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskBuilder {
    id: Option<String>,
    context_id: Option<String>,
    status: Option<A2ATaskStatus>,
    artifacts: Option<Vec<A2ATaskArtifactsItem>>,
    history: Option<Vec<A2ATaskHistoryItem>>,
    metadata: Option<HashMap<String, serde_json::Value>>,
}

impl A2ATaskBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn context_id(mut self, value: impl Into<String>) -> Self {
        self.context_id = Some(value.into());
        self
    }

    pub fn status(mut self, value: A2ATaskStatus) -> Self {
        self.status = Some(value);
        self
    }

    pub fn artifacts(mut self, value: Vec<A2ATaskArtifactsItem>) -> Self {
        self.artifacts = Some(value);
        self
    }

    pub fn history(mut self, value: Vec<A2ATaskHistoryItem>) -> Self {
        self.history = Some(value);
        self
    }

    pub fn metadata(mut self, value: HashMap<String, serde_json::Value>) -> Self {
        self.metadata = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2ATask`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](A2ATaskBuilder::id)
    /// - [`context_id`](A2ATaskBuilder::context_id)
    /// - [`status`](A2ATaskBuilder::status)
    pub fn build(self) -> Result<A2ATask, BuildError> {
        Ok(A2ATask {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            context_id: self
                .context_id
                .ok_or_else(|| BuildError::missing_field("context_id"))?,
            status: self
                .status
                .ok_or_else(|| BuildError::missing_field("status"))?,
            artifacts: self.artifacts,
            history: self.history,
            metadata: self.metadata,
        })
    }
}
