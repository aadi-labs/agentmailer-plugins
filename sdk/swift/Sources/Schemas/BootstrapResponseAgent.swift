import Foundation

public struct BootstrapResponseAgent: Codable, Hashable, Sendable {
    public let id: String
    public let trustTier: BootstrapResponseAgentTrustTier
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        trustTier: BootstrapResponseAgentTrustTier,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.trustTier = trustTier
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.trustTier = try container.decode(BootstrapResponseAgentTrustTier.self, forKey: .trustTier)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.trustTier, forKey: .trustTier)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case trustTier
    }
}