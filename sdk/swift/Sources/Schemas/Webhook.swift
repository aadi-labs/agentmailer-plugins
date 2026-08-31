import Foundation

public struct Webhook: Codable, Hashable, Sendable {
    public let url: String
    public let podId: String?
    public let inboxId: String?
    public let eventTypes: [WebhookEventTypesItem]
    public let description: String?
    public let id: String
    public let status: WebhookStatus
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        podId: String? = nil,
        inboxId: String? = nil,
        eventTypes: [WebhookEventTypesItem],
        description: String? = nil,
        id: String,
        status: WebhookStatus,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.podId = podId
        self.inboxId = inboxId
        self.eventTypes = eventTypes
        self.description = description
        self.id = id
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.podId = try container.decodeIfPresent(String.self, forKey: .podId)
        self.inboxId = try container.decodeIfPresent(String.self, forKey: .inboxId)
        self.eventTypes = try container.decode([WebhookEventTypesItem].self, forKey: .eventTypes)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.status = try container.decode(WebhookStatus.self, forKey: .status)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.podId, forKey: .podId)
        try container.encodeIfPresent(self.inboxId, forKey: .inboxId)
        try container.encode(self.eventTypes, forKey: .eventTypes)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case podId
        case inboxId
        case eventTypes
        case description
        case id
        case status
        case createdAt
        case updatedAt
    }
}