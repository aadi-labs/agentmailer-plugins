import Foundation

public struct A2AAgentCardProvider: Codable, Hashable, Sendable {
    public let url: String
    public let organization: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        organization: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.organization = organization
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.organization = try container.decode(String.self, forKey: .organization)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.organization, forKey: .organization)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case organization
    }
}