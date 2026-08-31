pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, Default, PartialEq, Eq, Hash)]
pub struct CreateTicketEventsRequest {
    #[serde(rename = "podId")]
    #[serde(default)]
    pub pod_id: String,
}

impl CreateTicketEventsRequest {
    pub fn builder() -> CreateTicketEventsRequestBuilder {
        <CreateTicketEventsRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct CreateTicketEventsRequestBuilder {
    pod_id: Option<String>,
}

impl CreateTicketEventsRequestBuilder {
    pub fn pod_id(mut self, value: impl Into<String>) -> Self {
        self.pod_id = Some(value.into());
        self
    }

    /// Consumes the builder and constructs a [`CreateTicketEventsRequest`].
    /// This method will fail if any of the following fields are not set:
    /// - [`pod_id`](CreateTicketEventsRequestBuilder::pod_id)
    pub fn build(self) -> Result<CreateTicketEventsRequest, BuildError> {
        Ok(CreateTicketEventsRequest {
            pod_id: self
                .pod_id
                .ok_or_else(|| BuildError::missing_field("pod_id"))?,
        })
    }
}
