import Foundation

extension Requests {
    public struct DomainCreate: Codable, Hashable, Sendable {
        public let domain: String
        public let podId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            domain: String,
            podId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.domain = domain
            self.podId = podId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.domain = try container.decode(String.self, forKey: .domain)
            self.podId = try container.decodeIfPresent(String.self, forKey: .podId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.domain, forKey: .domain)
            try container.encodeIfPresent(self.podId, forKey: .podId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case domain
            case podId
        }
    }
}