pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct A2ATaskStatus {
    pub state: A2ATaskStatusState,
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub timestamp: DateTime<FixedOffset>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub message: Option<A2ATaskStatusMessage>,
}

impl A2ATaskStatus {
    pub fn builder() -> A2ATaskStatusBuilder {
        <A2ATaskStatusBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskStatusBuilder {
    state: Option<A2ATaskStatusState>,
    timestamp: Option<DateTime<FixedOffset>>,
    message: Option<A2ATaskStatusMessage>,
}

impl A2ATaskStatusBuilder {
    pub fn state(mut self, value: A2ATaskStatusState) -> Self {
        self.state = Some(value);
        self
    }

    pub fn timestamp(mut self, value: DateTime<FixedOffset>) -> Self {
        self.timestamp = Some(value);
        self
    }

    pub fn message(mut self, value: A2ATaskStatusMessage) -> Self {
        self.message = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2ATaskStatus`].
    /// This method will fail if any of the following fields are not set:
    /// - [`state`](A2ATaskStatusBuilder::state)
    /// - [`timestamp`](A2ATaskStatusBuilder::timestamp)
    pub fn build(self) -> Result<A2ATaskStatus, BuildError> {
        Ok(A2ATaskStatus {
            state: self
                .state
                .ok_or_else(|| BuildError::missing_field("state"))?,
            timestamp: self
                .timestamp
                .ok_or_else(|| BuildError::missing_field("timestamp"))?,
            message: self.message,
        })
    }
}
