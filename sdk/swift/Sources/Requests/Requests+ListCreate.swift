import Foundation

extension Requests {
    public struct ListCreate: Codable, Hashable, Sendable {
        public let podId: String
        public let name: String
        public let kind: ListCreateKind
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            podId: String,
            name: String,
            kind: ListCreateKind,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.podId = podId
            self.name = name
            self.kind = kind
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.podId = try container.decode(String.self, forKey: .podId)
            self.name = try container.decode(String.self, forKey: .name)
            self.kind = try container.decode(ListCreateKind.self, forKey: .kind)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.podId, forKey: .podId)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.kind, forKey: .kind)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case podId
            case name
            case kind
        }
    }
}