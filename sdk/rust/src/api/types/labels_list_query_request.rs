pub use crate::prelude::*;

/// Query parameters for list
#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct LabelsListQueryRequest {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_id: Option<String>,
}

impl LabelsListQueryRequest {
    pub fn builder() -> LabelsListQueryRequestBuilder {
        <LabelsListQueryRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct LabelsListQueryRequestBuilder {
    pod_id: Option<String>,
}

impl LabelsListQueryRequestBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`LabelsListQueryRequest`].
    pub fn build(self) -> Result<LabelsListQueryRequest, BuildError> {
        Ok(LabelsListQueryRequest {
            pod_id: self.pod_id,
        })
    }
}
