pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq)]
pub struct A2AAgentCard {
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub description: String,
    #[serde(rename = "supportedInterfaces")]
    #[serde(default)]
    pub supported_interfaces: Vec<A2AAgentCardSupportedInterfacesItem>,
    #[serde(default)]
    pub provider: A2AAgentCardProvider,
    #[serde(default)]
    pub version: String,
    #[serde(rename = "documentationUrl")]
    #[serde(default)]
    pub documentation_url: String,
    #[serde(default)]
    pub capabilities: A2AAgentCardCapabilities,
    #[serde(rename = "securitySchemes")]
    #[serde(default)]
    pub security_schemes: HashMap<String, serde_json::Value>,
    #[serde(rename = "securityRequirements")]
    #[serde(default)]
    pub security_requirements: Vec<HashMap<String, Vec<String>>>,
    #[serde(rename = "defaultInputModes")]
    #[serde(default)]
    pub default_input_modes: Vec<String>,
    #[serde(rename = "defaultOutputModes")]
    #[serde(default)]
    pub default_output_modes: Vec<String>,
    #[serde(default)]
    pub skills: Vec<A2AAgentCardSkillsItem>,
}

impl A2AAgentCard {
    pub fn builder() -> A2AAgentCardBuilder {
        <A2AAgentCardBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AAgentCardBuilder {
    name: Option<String>,
    description: Option<String>,
    supported_interfaces: Option<Vec<A2AAgentCardSupportedInterfacesItem>>,
    provider: Option<A2AAgentCardProvider>,
    version: Option<String>,
    documentation_url: Option<String>,
    capabilities: Option<A2AAgentCardCapabilities>,
    security_schemes: Option<HashMap<String, serde_json::Value>>,
    security_requirements: Option<Vec<HashMap<String, Vec<String>>>>,
    default_input_modes: Option<Vec<String>>,
    default_output_modes: Option<Vec<String>>,
    skills: Option<Vec<A2AAgentCardSkillsItem>>,
}

impl A2AAgentCardBuilder {
    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn description(mut self, value: impl Into<String>) -> Self {
        self.description = Some(value.into());
        self
    }

    pub fn supported_interfaces(mut self, value: Vec<A2AAgentCardSupportedInterfacesItem>) -> Self {
        self.supported_interfaces = Some(value);
        self
    }

    pub fn provider(mut self, value: A2AAgentCardProvider) -> Self {
        self.provider = Some(value);
        self
    }

    pub fn version(mut self, value: impl Into<String>) -> Self {
        self.version = Some(value.into());
        self
    }

    pub fn documentation_url(mut self, value: impl Into<String>) -> Self {
        self.documentation_url = Some(value.into());
        self
    }

    pub fn capabilities(mut self, value: A2AAgentCardCapabilities) -> Self {
        self.capabilities = Some(value);
        self
    }

    pub fn security_schemes(mut self, value: HashMap<String, serde_json::Value>) -> Self {
        self.security_schemes = Some(value);
        self
    }

    pub fn security_requirements(mut self, value: Vec<HashMap<String, Vec<String>>>) -> Self {
        self.security_requirements = Some(value);
        self
    }

    pub fn default_input_modes(mut self, value: Vec<String>) -> Self {
        self.default_input_modes = Some(value);
        self
    }

    pub fn default_output_modes(mut self, value: Vec<String>) -> Self {
        self.default_output_modes = Some(value);
        self
    }

    pub fn skills(mut self, value: Vec<A2AAgentCardSkillsItem>) -> Self {
        self.skills = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AAgentCard`].
    /// This method will fail if any of the following fields are not set:
    /// - [`name`](A2AAgentCardBuilder::name)
    /// - [`description`](A2AAgentCardBuilder::description)
    /// - [`supported_interfaces`](A2AAgentCardBuilder::supported_interfaces)
    /// - [`provider`](A2AAgentCardBuilder::provider)
    /// - [`version`](A2AAgentCardBuilder::version)
    /// - [`documentation_url`](A2AAgentCardBuilder::documentation_url)
    /// - [`capabilities`](A2AAgentCardBuilder::capabilities)
    /// - [`security_schemes`](A2AAgentCardBuilder::security_schemes)
    /// - [`security_requirements`](A2AAgentCardBuilder::security_requirements)
    /// - [`default_input_modes`](A2AAgentCardBuilder::default_input_modes)
    /// - [`default_output_modes`](A2AAgentCardBuilder::default_output_modes)
    /// - [`skills`](A2AAgentCardBuilder::skills)
    pub fn build(self) -> Result<A2AAgentCard, BuildError> {
        Ok(A2AAgentCard {
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            description: self
                .description
                .ok_or_else(|| BuildError::missing_field("description"))?,
            supported_interfaces: self
                .supported_interfaces
                .ok_or_else(|| BuildError::missing_field("supported_interfaces"))?,
            provider: self
                .provider
                .ok_or_else(|| BuildError::missing_field("provider"))?,
            version: self
                .version
                .ok_or_else(|| BuildError::missing_field("version"))?,
            documentation_url: self
                .documentation_url
                .ok_or_else(|| BuildError::missing_field("documentation_url"))?,
            capabilities: self
                .capabilities
                .ok_or_else(|| BuildError::missing_field("capabilities"))?,
            security_schemes: self
                .security_schemes
                .ok_or_else(|| BuildError::missing_field("security_schemes"))?,
            security_requirements: self
                .security_requirements
                .ok_or_else(|| BuildError::missing_field("security_requirements"))?,
            default_input_modes: self
                .default_input_modes
                .ok_or_else(|| BuildError::missing_field("default_input_modes"))?,
            default_output_modes: self
                .default_output_modes
                .ok_or_else(|| BuildError::missing_field("default_output_modes"))?,
            skills: self
                .skills
                .ok_or_else(|| BuildError::missing_field("skills"))?,
        })
    }
}
