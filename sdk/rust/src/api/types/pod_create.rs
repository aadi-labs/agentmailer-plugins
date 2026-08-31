pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct PodCreate {
    #[serde(default)]
    pub name: String,
}

impl PodCreate {
    pub fn builder() -> PodCreateBuilder {
        <PodCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct PodCreateBuilder {
    name: Option<String>,
}

impl PodCreateBuilder {
    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`PodCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`name`](PodCreateBuilder::name)
    pub fn build(self) -> Result<PodCreate, BuildError> {
        Ok(PodCreate {
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
        })
    }
}
