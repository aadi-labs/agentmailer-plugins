import Foundation

public struct Label: Codable, Hashable, Sendable {
    public let podId: String
    public let name: String
    public let color: String?
    public let id: String
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        podId: String,
        name: String,
        color: String? = nil,
        id: String,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.podId = podId
        self.name = name
        self.color = color
        self.id = id
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.podId = try container.decode(String.self, forKey: .podId)
        self.name = try container.decode(String.self, forKey: .name)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.podId, forKey: .podId)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case podId
        case name
        case color
        case id
        case createdAt
    }
}