pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct BootstrapResponsePod {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub name: String,
}

impl BootstrapResponsePod {
    pub fn builder() -> BootstrapResponsePodBuilder {
        <BootstrapResponsePodBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct BootstrapResponsePodBuilder {
    id: Option<String>,
    name: Option<String>,
}

impl BootstrapResponsePodBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`BootstrapResponsePod`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](BootstrapResponsePodBuilder::id)
    /// - [`name`](BootstrapResponsePodBuilder::name)
    pub fn build(self) -> Result<BootstrapResponsePod, BuildError> {
        Ok(BootstrapResponsePod {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
        })
    }
}
