pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct A2AIdentitySettings {
    #[serde(rename = "publiclyDiscoverable")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub publicly_discoverable: Option<bool>,
    #[serde(rename = "admissionMode")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub admission_mode: Option<A2AIdentitySettingsAdmissionMode>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub skills: Option<Vec<A2AIdentitySettingsSkillsItem>>,
}

impl A2AIdentitySettings {
    pub fn builder() -> A2AIdentitySettingsBuilder {
        <A2AIdentitySettingsBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AIdentitySettingsBuilder {
    publicly_discoverable: Option<bool>,
    admission_mode: Option<A2AIdentitySettingsAdmissionMode>,
    name: Option<String>,
    description: Option<String>,
    skills: Option<Vec<A2AIdentitySettingsSkillsItem>>,
}

impl A2AIdentitySettingsBuilder {
    pub fn publicly_discoverable(mut self, value: bool) -> Self {
        self.publicly_discoverable = Some(value);
        self
    }

    pub fn admission_mode(mut self, value: A2AIdentitySettingsAdmissionMode) -> Self {
        self.admission_mode = Some(value);
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

    pub fn skills(mut self, value: Vec<A2AIdentitySettingsSkillsItem>) -> Self {
        self.skills = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AIdentitySettings`].
    pub fn build(self) -> Result<A2AIdentitySettings, BuildError> {
        Ok(A2AIdentitySettings {
            publicly_discoverable: self.publicly_discoverable,
            admission_mode: self.admission_mode,
            name: self.name,
            description: self.description,
            skills: self.skills,
        })
    }
}
