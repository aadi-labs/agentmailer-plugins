pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct ListCreate {
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
    #[serde(default)]
    pub name: String,
    pub kind: ListCreateKind,
}

impl ListCreate {
    pub fn builder() -> ListCreateBuilder {
        <ListCreateBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct ListCreateBuilder {
    pod_id: Option<String>,
    name: Option<String>,
    kind: Option<ListCreateKind>,
}

impl ListCreateBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    pub fn name(mut self, value: impl Into<String>) -> Self {
        self.name = Some(value.into());
        self
    }

    pub fn kind(mut self, value: ListCreateKind) -> Self {
        self.kind = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`ListCreate`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod_id`](ListCreateBuilder::pod_id)
    /// - [`name`](ListCreateBuilder::name)
    /// - [`kind`](ListCreateBuilder::kind)
    pub fn build(self) -> Result<ListCreate, BuildError> {
        Ok(ListCreate {
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
            name: self.name.ok_or_else(|| BuildError::missing_field("name"))?,
            kind: self.kind.ok_or_else(|| BuildError::missing_field("kind"))?,
        })
    }
}
