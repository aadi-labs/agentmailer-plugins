pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct A2AAgentCardSkillsItem {
    #[serde(default)]
    pub id: String,
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub description: String,
    #[serde(default)]
    pub tags: Vec<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub examples: Option<Vec<String>>,
    #[serde(rename = "inputModes")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub input_modes: Option<Vec<String>>,
    #[serde(rename = "outputModes")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub output_modes: Option<Vec<String>>,
}

impl A2AAgentCardSkillsItem {
    pub fn builder() -> A2AAgentCardSkillsItemBuilder {
        <A2AAgentCardSkillsItemBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AAgentCardSkillsItemBuilder {
    id: Option<String>,
    name: Option<String>,
    description: Option<String>,
    tags: Option<Vec<String>>,
    examples: Option<Vec<String>>,
    input_modes: Option<Vec<String>>,
    output_modes: Option<Vec<String>>,
}

impl A2AAgentCardSkillsItemBuilder {
    pub fn id(mut self, value: impl Into<String>) -> Self {
        self.id = Some(value.into());
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

    pub fn tags(mut self, value: Vec<String>) -> Self {
        self.tags = Some(value);
        self
    }

    pub fn examples(mut self, value: Vec<String>) -> Self {
        self.examples = Some(value);
        self
    }

    pub fn input_modes(mut self, value: Vec<String>) -> Self {
        self.input_modes = Some(value);
        self
    }

    pub fn output_modes(mut self, value: Vec<String>) -> Self {
        self.output_modes = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AAgentCardSkillsItem`].
    /// This method will fail if any of the following fields are not set:
    /// - [`id`](A2AAgentCardSkillsItemBuilder::id)
    /// - [`name`](A2AAgentCardSkillsItemBuilder::name)
    /// - [`description`](A2AAgentCardSkillsItemBuilder::description)
    /// - [`tags`](A2AAgentCardSkillsItemBuilder::tags)
    pub fn build(self) -> Result<A2AAgentCardSkillsItem, BuildError> {
        Ok(A2AAgentCardSkillsItem {
            id: self.id.ok_or_else(|| BuildError::missing_field("id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            description: self
                .description
                .ok_or_else(|| BuildError::missing_field("description"))?,
            tags: self.tags.ok_or_else(|| BuildError::missing_field("tags"))?,
            examples: self.examples,
            input_modes: self.input_modes,
            output_modes: self.output_modes,
        })
    }
}
