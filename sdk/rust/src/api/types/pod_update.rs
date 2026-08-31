pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct PodUpdate {
    #[serde(default)]
    pub name: String,
}

impl PodUpdate {
    pub fn builder() -> PodUpdateBuilder {
        <PodUpdateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct PodUpdateBuilder {
    name: Option<String>,
}

impl PodUpdateBuilder {
    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`PodUpdate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`name`](PodUpdateBuilder::name)
    pub fn build(self) -> Result<PodUpdate, BuildError> {
        Ok(PodUpdate {
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
        })
    }
}
