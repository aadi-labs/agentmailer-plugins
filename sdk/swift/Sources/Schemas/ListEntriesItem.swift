import Foundation

public struct ListEntriesItem: Codable, Hashable, Sendable {
    public let addressPattern: JSONValue
    public let note: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        addressPattern: JSONValue,
        note: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.addressPattern = addressPattern
        self.note = note
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addressPattern = try container.decode(JSONValue.self, forKey: .addressPattern)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.addressPattern, forKey: .addressPattern)
        try container.encodeIfPresent(self.note, forKey: .note)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case addressPattern
        case note
    }
}