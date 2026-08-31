pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct UpdateTaskA2AResponse {
    pub task: A2ATask,
}

impl UpdateTaskA2AResponse {
    pub fn builder() -> UpdateTaskA2AResponseBuilder {
        <UpdateTaskA2AResponseBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct UpdateTaskA2AResponseBuilder {
    task: Option<A2ATask>,
}

impl UpdateTaskA2AResponseBuilder {
    pub fn task(mut self, value: A2ATask) -> Self {
        self.task = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`UpdateTaskA2AResponse`].
    /// This method will fail if any of the following fields are not set:
    /// - [`task`](UpdateTaskA2AResponseBuilder::task)
    pub fn build(self) -> Result<UpdateTaskA2AResponse, BuildError> {
        Ok(UpdateTaskA2AResponse {
            task: self.task.ok_or_else(|| BuildError::missing_field("task"))?,
        })
    }
}
