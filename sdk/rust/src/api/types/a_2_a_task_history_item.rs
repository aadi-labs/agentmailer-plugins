pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct A2ATaskHistoryItem {
    #[serde(rename = "messageId")]
    #[serde(default)]
    pub message_id: String,
    #[serde(rename = "contextId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub context_id: Option<String>,
    #[serde(rename = "taskId")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub task_id: Option<String>,
    pub role: A2ATaskHistoryItemRole,
    #[serde(default)]
    pub parts: Vec<A2ATaskHistoryItemPartsItem>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, serde_json::Value>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub extensions: Option<Vec<String>>,
    #[serde(rename = "referenceTaskIds")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reference_task_ids: Option<Vec<String>>,
}

impl A2ATaskHistoryItem {
    pub fn builder() -> A2ATaskHistoryItemBuilder {
        <A2ATaskHistoryItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskHistoryItemBuilder {
    message_id: Option<String>,
    context_id: Option<String>,
    task_id: Option<String>,
    role: Option<A2ATaskHistoryItemRole>,
    parts: Option<Vec<A2ATaskHistoryItemPartsItem>>,
    metadata: Option<HashMap<String, serde_json::Value>>,
    extensions: Option<Vec<String>>,
    reference_task_ids: Option<Vec<String>>,
}

impl A2ATaskHistoryItemBuilder {
    pub fn message_id(mut self, value: impl Into<String>) -> Self {
        self.message_id = Some(value.into());
        self
    }

    pub fn context_id(mut self, value: impl Into<String>) -> Self {
        self.context_id = Some(value.into());
        self
    }

    pub fn task_id(mut self, value: impl Into<String>) -> Self {
        self.task_id = Some(value.into());
        self
    }

    pub fn role(mut self, value: A2ATaskHistoryItemRole) -> Self {
        self.role = Some(value);
        self
    }

    pub fn parts(mut self, value: Vec<A2ATaskHistoryItemPartsItem>) -> Self {
        self.parts = Some(value);
        self
    }

    pub fn metadata(mut self, value: HashMap<String, serde_json::Value>) -> Self {
        self.metadata = Some(value);
        self
    }

    pub fn extensions(mut self, value: Vec<String>) -> Self {
        self.extensions = Some(value);
        self
    }

    pub fn reference_task_ids(mut self, value: Vec<String>) -> Self {
        self.reference_task_ids = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2ATaskHistoryItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`message_id`](A2ATaskHistoryItemBuilder::message_id)
    /// - [`role`](A2ATaskHistoryItemBuilder::role)
    /// - [`parts`](A2ATaskHistoryItemBuilder::parts)
    pub fn build(self) -> Result<A2ATaskHistoryItem, BuildError> {
        Ok(A2ATaskHistoryItem {
            message_id: self
                .message_id
                .ok_or_else(|| BuildError::missing_field("message_id"))?,
            context_id: self.context_id,
            task_id: self.task_id,
            role: self.role.ok_or_else(|| BuildError::missing_field("role"))?,
            parts: self
                .parts
                .ok_or_else(|| BuildError::missing_field("parts"))?,
            metadata: self.metadata,
            extensions: self.extensions,
            reference_task_ids: self.reference_task_ids,
        })
    }
}
