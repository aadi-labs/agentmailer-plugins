import Foundation

extension Requests {
    public struct InboxCreate: Codable, Hashable, Sendable {
        public let username: String?
        public let podId: String?
        public let domainId: String?
        public let clientId: String?
        public let displayName: String?
        public let metadata: [String: InboxCreateMetadataValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            username: String? = nil,
            podId: String? = nil,
            domainId: String? = nil,
            clientId: String? = nil,
            displayName: String? = nil,
            metadata: [String: InboxCreateMetadataValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.username = username
            self.podId = podId
            self.domainId = domainId
            self.clientId = clientId
            self.displayName = displayName
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.username = try container.decodeIfPresent(String.self, forKey: .username)
            self.podId = try container.decodeIfPresent(String.self, forKey: .podId)
            self.domainId = try container.decodeIfPresent(String.self, forKey: .domainId)
            self.clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
            self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
            self.metadata = try container.decodeIfPresent([String: InboxCreateMetadataValue].self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.username, forKey: .username)
            try container.encodeIfPresent(self.podId, forKey: .podId)
            try container.encodeIfPresent(self.domainId, forKey: .domainId)
            try container.encodeIfPresent(self.clientId, forKey: .clientId)
            try container.encodeIfPresent(self.displayName, forKey: .displayName)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case username
            case podId
            case domainId
            case clientId
            case displayName
            case metadata
        }
    }
}