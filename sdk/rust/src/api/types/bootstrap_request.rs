pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapRequest {
    #[serde(rename = "requestedLocalPart")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub requested_local_part: Option<String>,
    #[serde(rename = "podName")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pod_name: Option<String>,
}

impl BootstrapRequest {
    pub fn builder() -> BootstrapRequestBuilder {
        <BootstrapRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapRequestBuilder {
    requested_local_part: Option<String>,
    pod_name: Option<String>,
}

impl BootstrapRequestBuilder {
    pub fn requested_local_part(mut self, value: impl Into<String>) -> Self {
        self.requested_local_part = Some(value.into());
        self
    }

    pub fn pod_name(mut self, value: impl Into<String>) -> Self {
        self.pod_name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`BootstrapRequest`].
    pub fn build(self) -> Result<BootstrapRequest, BuildError> {
        Ok(BootstrapRequest {
            requested_local_part: self.requested_local_part,
            pod_name: self.pod_name,
        })
    }
}
