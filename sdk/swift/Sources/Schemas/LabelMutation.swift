import Foundation

public struct LabelMutation: Codable, Hashable, Sendable {
    public let add: [String]?
    public let remove: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        add: [String]? = nil,
        remove: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.add = add
        self.remove = remove
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.add = try container.decodeIfPresent([String].self, forKey: .add)
        self.remove = try container.decodeIfPresent([String].self, forKey: .remove)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.add, forKey: .add)
        try container.encodeIfPresent(self.remove, forKey: .remove)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case add
        case remove
    }
}