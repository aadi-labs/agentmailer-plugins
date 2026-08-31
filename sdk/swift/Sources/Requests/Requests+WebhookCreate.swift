import Foundation

extension Requests {
    public struct WebhookCreate: Codable, Hashable, Sendable {
        public let url: String
        public let podId: String?
        public let inboxId: String?
        public let eventTypes: [WebhookCreateEventTypesItem]?
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            url: String,
            podId: String? = nil,
            inboxId: String? = nil,
            eventTypes: [WebhookCreateEventTypesItem]? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.url = url
            self.podId = podId
            self.inboxId = inboxId
            self.eventTypes = eventTypes
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decode(String.self, forKey: .url)
            self.podId = try container.decodeIfPresent(String.self, forKey: .podId)
            self.inboxId = try container.decodeIfPresent(String.self, forKey: .inboxId)
            self.eventTypes = try container.decodeIfPresent([WebhookCreateEventTypesItem].self, forKey: .eventTypes)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.podId, forKey: .podId)
            try container.encodeIfPresent(self.inboxId, forKey: .inboxId)
            try container.encodeIfPresent(self.eventTypes, forKey: .eventTypes)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case url
            case podId
            case inboxId
            case eventTypes
            case description
        }
    }
}