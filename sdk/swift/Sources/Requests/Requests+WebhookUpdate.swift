import Foundation

extension Requests {
    public struct WebhookUpdate: Codable, Hashable, Sendable {
        public let url: String?
        public let eventTypes: [WebhookUpdateEventTypesItem]?
        public let description: String?
        public let enabled: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            url: String? = nil,
            eventTypes: [WebhookUpdateEventTypesItem]? = nil,
            description: String? = nil,
            enabled: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.url = url
            self.eventTypes = eventTypes
            self.description = description
            self.enabled = enabled
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.eventTypes = try container.decodeIfPresent([WebhookUpdateEventTypesItem].self, forKey: .eventTypes)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.url, forKey: .url)
            try container.encodeIfPresent(self.eventTypes, forKey: .eventTypes)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.enabled, forKey: .enabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case url
            case eventTypes
            case description
            case enabled
        }
    }
}