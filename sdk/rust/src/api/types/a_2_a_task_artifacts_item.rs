pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct A2ATaskArtifactsItem {
    #[serde(rename = "artifactId")]
    #[serde(default)]
    pub artifact_id: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(default)]
    pub parts: Vec<A2ATaskArtifactsItemPartsItem>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<HashMap<String, serde_json::Value>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub extensions: Option<Vec<String>>,
}

impl A2ATaskArtifactsItem {
    pub fn builder() -> A2ATaskArtifactsItemBuilder {
        <A2ATaskArtifactsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2ATaskArtifactsItemBuilder {
    artifact_id: Option<String>,
    name: Option<String>,
    description: Option<String>,
    parts: Option<Vec<A2ATaskArtifactsItemPartsItem>>,
    metadata: Option<HashMap<String, serde_json::Value>>,
    extensions: Option<Vec<String>>,
}

impl A2ATaskArtifactsItemBuilder {
    pub fn artifact_id(mut self, value: impl Into<String>) -> Self {
        self.artifact_id = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn description(mut self, value: impl Into<String>) -> Self {
        self.description = Some(value.into());
        self
    }

    pub fn parts(mut self, value: Vec<A2ATaskArtifactsItemPartsItem>) -> Self {
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

    /// Consumes the builder and constructs a [`A2ATaskArtifactsItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`artifact_id`](A2ATaskArtifactsItemBuilder::artifact_id)
    /// - [`parts`](A2ATaskArtifactsItemBuilder::parts)
    pub fn build(self) -> Result<A2ATaskArtifactsItem, BuildError> {
        Ok(A2ATaskArtifactsItem {
            artifact_id: self
                .artifact_id
                .ok_or_else(|| BuildError::missing_field("artifact_id"))?,
            name: self.name,
            description: self.description,
            parts: self
                .parts
                .ok_or_else(|| BuildError::missing_field("parts"))?,
            metadata: self.metadata,
            extensions: self.extensions,
        })
    }
}
