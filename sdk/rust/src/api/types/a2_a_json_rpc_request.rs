pub use crate::prelude::*;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct A2AJsonRpcRequest {
    pub jsonrpc: A2AJsonRpcRequestJsonrpc,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub id: Option<A2AJsonRpcRequestId>,
    #[serde(default)]
    pub method: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub params: Option<HashMap<String, serde_json::Value>>,
}

impl A2AJsonRpcRequest {
    pub fn builder() -> A2AJsonRpcRequestBuilder {
        <A2AJsonRpcRequestBuilder as Default>::default()
    }
}

#[derive(Clone, PartialEq, Default, Debug)]
#[non_exhaustive]
pub struct A2AJsonRpcRequestBuilder {
    jsonrpc: Option<A2AJsonRpcRequestJsonrpc>,
    id: Option<A2AJsonRpcRequestId>,
    method: Option<String>,
    params: Option<HashMap<String, serde_json::Value>>,
}

impl A2AJsonRpcRequestBuilder {
    pub fn jsonrpc(mut self, value: A2AJsonRpcRequestJsonrpc) -> Self {
        self.jsonrpc = Some(value);
        self
    }

    pub fn id(mut self, value: A2AJsonRpcRequestId) -> Self {
        self.id = Some(value);
        self
    }

    pub fn method(mut self, value: impl Into<String>) -> Self {
        self.method = Some(value.into());
        self
    }

    pub fn params(mut self, value: HashMap<String, serde_json::Value>) -> Self {
        self.params = Some(value);
        self
    }

    /// Consumes the builder and constructs a [`A2AJsonRpcRequest`].
    /// This method will fail if any of the following fields are not set:
    /// - [`jsonrpc`](A2AJsonRpcRequestBuilder::jsonrpc)
    /// - [`method`](A2AJsonRpcRequestBuilder::method)
    pub fn build(self) -> Result<A2AJsonRpcRequest, BuildError> {
        Ok(A2AJsonRpcRequest {
            jsonrpc: self
                .jsonrpc
                .ok_or_else(|| BuildError::missing_field("jsonrpc"))?,
            id: self.id,
            method: self
                .method
                .ok_or_else(|| BuildError::missing_field("method"))?,
            params: self.params,
        })
    }
}
