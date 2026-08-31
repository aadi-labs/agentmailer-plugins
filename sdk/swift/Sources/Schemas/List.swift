import Foundation

public struct List: Codable, Hashable, Sendable {
    public let podId: String
    public let name: String
    public let kind: ListKind
    public let id: String
    public let entries: [ListEntriesItem]
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        podId: String,
        name: String,
        kind: ListKind,
        id: String,
        entries: [ListEntriesItem],
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.podId = podId
        self.name = name
        self.kind = kind
        self.id = id
        self.entries = entries
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.podId = try container.decode(String.self, forKey: .podId)
        self.name = try container.decode(String.self, forKey: .name)
        self.kind = try container.decode(ListKind.self, forKey: .kind)
        self.id = try container.decode(String.self, forKey: .id)
        self.entries = try container.decode([ListEntriesItem].self, forKey: .entries)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.podId, forKey: .podId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.entries, forKey: .entries)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case podId
        case name
        case kind
        case id
        case entries
        case createdAt
        case updatedAt
    }
}