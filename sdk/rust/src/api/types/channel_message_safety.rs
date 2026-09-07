pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct ChannelMessageSafety {
    pub action: ChannelMessageSafetyAction,
    pub risk: ChannelMessageSafetyRisk,
    #[serde(default)]
    #[serde(with = "crate::core::number_serializers")]
    pub score: f64,
    #[serde(default)]
    pub signals: Vec<String>,
    pub classifier: ChannelMessageSafetyClassifier,
    #[serde(rename = "modelStatus")]
    pub model_status: ChannelMessageSafetyModelStatus,
}

impl ChannelMessageSafety {
    pub fn builder() -> ChannelMessageSafetyBuilder {
        <ChannelMessageSafetyBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ChannelMessageSafetyBuilder {
    action: Option<ChannelMessageSafetyAction>,
    risk: Option<ChannelMessageSafetyRisk>,
    score: Option<f64>,
    signals: Option<Vec<String>>,
    classifier: Option<ChannelMessageSafetyClassifier>,
    model_status: Option<ChannelMessageSafetyModelStatus>,
}

impl ChannelMessageSafetyBuilder {
    pub fn action(mut self, value: ChannelMessageSafetyAction) -> Self {
        self.action = Some(value);
        self
    }

    pub fn risk(mut self, value: ChannelMessageSafetyRisk) -> Self {
        self.risk = Some(value);
        self
    }

    pub fn score(mut self, value: f64) -> Self {
        self.score = Some(value);
        self
    }

    pub fn signals(mut self, value: Vec<String>) -> Self {
        self.signals = Some(value);
        self
    }

    pub fn classifier(mut self, value: ChannelMessageSafetyClassifier) -> Self {
        self.classifier = Some(value);
        self
    }

    pub fn model_status(mut self, value: ChannelMessageSafetyModelStatus) -> Self {
        self.model_status = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ChannelMessageSafety`].
    /// This method will fail if any of the following fields are not set:
    /// - [`action`](ChannelMessageSafetyBuilder::action)
    /// - [`risk`](ChannelMessageSafetyBuilder::risk)
    /// - [`score`](ChannelMessageSafetyBuilder::score)
    /// - [`signals`](ChannelMessageSafetyBuilder::signals)
    /// - [`classifier`](ChannelMessageSafetyBuilder::classifier)
    /// - [`model_status`](ChannelMessageSafetyBuilder::model_status)
    pub fn build(self) -> Result<ChannelMessageSafety, BuildError> {
        Ok(ChannelMessageSafety {
            action: self
                .action
                .ok_or_else(|| BuildError::missing_field("action"))?,
            risk: self.risk.ok_or_else(|| BuildError::missing_field("risk"))?,
            score: self
                .score
                .ok_or_else(|| BuildError::missing_field("score"))?,
            signals: self
                .signals
                .ok_or_else(|| BuildError::missing_field("signals"))?,
            classifier: self
                .classifier
                .ok_or_else(|| BuildError::missing_field("classifier"))?,
            model_status: self
                .model_status
                .ok_or_else(|| BuildError::missing_field("model_status"))?,
        })
    }
}
