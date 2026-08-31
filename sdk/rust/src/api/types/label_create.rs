pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct LabelCreate {
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    #[serde(default)]
    pub name: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub color: Option<String>,
}

impl LabelCreate {
    pub fn builder() -> LabelCreateBuilder {
        <LabelCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct LabelCreateBuilder {
    pod_id: Option<String>,
    name: Option<String>,
    color: Option<String>,
}

impl LabelCreateBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn color(mut self, value: impl Into<String>) -> Self {
        self.color = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`LabelCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod_id`](LabelCreateBuilder::pod_id)
    /// - [`name`](LabelCreateBuilder::name)
    pub fn build(self) -> Result<LabelCreate, BuildError> {
        Ok(LabelCreate {
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            color: self.color,
        })
    }
}
