import Foundation

extension Requests {
    public struct InboxUpdate: Codable, Hashable, Sendable {
        public let displayName: Nullable<String>?
        public let clientId: Nullable<String>?
        public let metadata: Nullable<[String: Nullable<InboxUpdateMetadataValue>]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            displayName: Nullable<String>? = nil,
            clientId: Nullable<String>? = nil,
            metadata: Nullable<[String: Nullable<InboxUpdateMetadataValue>]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.displayName = displayName
            self.clientId = clientId
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.displayName = try container.decodeNullableIfPresent(String.self, forKey: .displayName)
            self.clientId = try container.decodeNullableIfPresent(String.self, forKey: .clientId)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<InboxUpdateMetadataValue>].self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.displayName, forKey: .displayName)
            try container.encodeNullableIfPresent(self.clientId, forKey: .clientId)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case displayName
            case clientId
            case metadata
        }
    }
}