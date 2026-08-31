import Foundation

public struct A2AAgentCardSupportedInterfacesItem: Codable, Hashable, Sendable {
    public let url: String
    public let protocolBinding: A2AAgentCardSupportedInterfacesItemProtocolBinding
    public let protocolVersion: A2AAgentCardSupportedInterfacesItemProtocolVersion
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        protocolBinding: A2AAgentCardSupportedInterfacesItemProtocolBinding,
        protocolVersion: A2AAgentCardSupportedInterfacesItemProtocolVersion,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.protocolBinding = protocolBinding
        self.protocolVersion = protocolVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.protocolBinding = try container.decode(A2AAgentCardSupportedInterfacesItemProtocolBinding.self, forKey: .protocolBinding)
        self.protocolVersion = try container.decode(A2AAgentCardSupportedInterfacesItemProtocolVersion.self, forKey: .protocolVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.protocolBinding, forKey: .protocolBinding)
        try container.encode(self.protocolVersion, forKey: .protocolVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case protocolBinding
        case protocolVersion
    }
}