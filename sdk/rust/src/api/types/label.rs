pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct Label {
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    #[serde(default)]
    pub name: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub color: Option<String>,
    #[serde(default)]
    pub id: String,
    #[serde(rename = "createdAt")]
    #[serde(default)]
    #[serde(with = "crate::core::flexible_datetime::offset")]
    pub created_at: DateTime<FixedOffset>,
}

impl Label {
    pub fn builder() -> LabelBuilder {
        <LabelBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct LabelBuilder {
    pod_id: Option<String>,
    name: Option<String>,
    color: Option<String>,
    id: Option<String>,
    created_at: Option<DateTime<FixedOffset>>,
}

impl LabelBuilder {
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

    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
        self
    }

    pub fn created_at(mut self, value: DateTime<FixedOffset>) -> Self {
        self.created_at = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`Label`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod_id`](LabelBuilder::pod_id)
    /// - [`name`](LabelBuilder::name)
    /// - [`id`](LabelBuilder::id)
    /// - [`created_at`](LabelBuilder::created_at)
    pub fn build(self) -> Result<Label, BuildError> {
        Ok(Label {
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            color: self.color,
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            created_at: self
                .created_at
                .ok_or_else(|| BuildError::missing_field("created_at"))?,
        })
    }
}
