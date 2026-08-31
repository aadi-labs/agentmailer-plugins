import Foundation

extension Requests {
    public struct BootstrapRequest: Codable, Hashable, Sendable {
        public let requestedLocalPart: String?
        public let podName: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            requestedLocalPart: String? = nil,
            podName: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.requestedLocalPart = requestedLocalPart
            self.podName = podName
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.requestedLocalPart = try container.decodeIfPresent(String.self, forKey: .requestedLocalPart)
            self.podName = try container.decodeIfPresent(String.self, forKey: .podName)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.requestedLocalPart, forKey: .requestedLocalPart)
            try container.encodeIfPresent(self.podName, forKey: .podName)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case requestedLocalPart
            case podName
        }
    }
}