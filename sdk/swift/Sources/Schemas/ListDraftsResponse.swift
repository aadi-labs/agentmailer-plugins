import Foundation

public struct ListDraftsResponse: Codable, Hashable, Sendable {
    public let drafts: [Draft]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        drafts: [Draft],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.drafts = drafts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.drafts = try container.decode([Draft].self, forKey: .drafts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.drafts, forKey: .drafts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case drafts
    }
}