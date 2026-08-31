import Foundation

public struct DomainRecordsItem: Codable, Hashable, Sendable {
    public let type: DomainRecordsItemType
    public let name: String
    public let value: String
    public let priority: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: DomainRecordsItemType,
        name: String,
        value: String,
        priority: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.name = name
        self.value = value
        self.priority = priority
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(DomainRecordsItemType.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(String.self, forKey: .value)
        self.priority = try container.decodeIfPresent(Int.self, forKey: .priority)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.priority, forKey: .priority)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case name
        case value
        case priority
    }
}