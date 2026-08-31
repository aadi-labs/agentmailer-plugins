pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct LabelMutation {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub add: Option<Vec<String>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub remove: Option<Vec<String>>,
}

impl LabelMutation {
    pub fn builder() -> LabelMutationBuilder {
        <LabelMutationBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct LabelMutationBuilder {
    add: Option<Vec<String>>,
    remove: Option<Vec<String>>,
}

impl LabelMutationBuilder {
    pub fn add(mut self, value: Vec<String>) -> Self {
        self.add = Some(value);
        self
    }

    pub fn remove(mut self, value: Vec<String>) -> Self {
        self.remove = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`LabelMutation`].
    pub fn build(self) -> Result<LabelMutation, BuildError> {
        Ok(LabelMutation {
            add: self.add,
            remove: self.remove,
        })
    }
}
