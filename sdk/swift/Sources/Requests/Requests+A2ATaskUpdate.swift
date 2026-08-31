import Foundation

extension Requests {
    public struct A2ATaskUpdate: Codable, Hashable, Sendable {
        public let state: A2ATaskUpdateState
        public let message: A2ATaskUpdateMessage?
        public let artifacts: [A2ATaskUpdateArtifactsItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            state: A2ATaskUpdateState,
            message: A2ATaskUpdateMessage? = nil,
            artifacts: [A2ATaskUpdateArtifactsItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.state = state
            self.message = message
            self.artifacts = artifacts
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.state = try container.decode(A2ATaskUpdateState.self, forKey: .state)
            self.message = try container.decodeIfPresent(A2ATaskUpdateMessage.self, forKey: .message)
            self.artifacts = try container.decodeIfPresent([A2ATaskUpdateArtifactsItem].self, forKey: .artifacts)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.state, forKey: .state)
            try container.encodeIfPresent(self.message, forKey: .message)
            try container.encodeIfPresent(self.artifacts, forKey: .artifacts)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case state
            case message
            case artifacts
        }
    }
}