import Foundation

extension Requests {
    public struct A2AJsonRpcRequest: Codable, Hashable, Sendable {
        public let jsonrpc: A2AJsonRpcRequestJsonrpc
        public let id: Nullable<A2AJsonRpcRequestId>
        public let method: String
        public let params: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            jsonrpc: A2AJsonRpcRequestJsonrpc,
            id: Nullable<A2AJsonRpcRequestId>,
            method: String,
            params: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.jsonrpc = jsonrpc
            self.id = id
            self.method = method
            self.params = params
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.jsonrpc = try container.decode(A2AJsonRpcRequestJsonrpc.self, forKey: .jsonrpc)
            self.id = try container.decode(Nullable<A2AJsonRpcRequestId>.self, forKey: .id)
            self.method = try container.decode(String.self, forKey: .method)
            self.params = try container.decodeIfPresent([String: JSONValue].self, forKey: .params)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.jsonrpc, forKey: .jsonrpc)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.method, forKey: .method)
            try container.encodeIfPresent(self.params, forKey: .params)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case jsonrpc
            case id
            case method
            case params
        }
    }
}