import Foundation

public struct UpdateChannelEndpointsResponse: Codable, Hashable, Sendable {
    public let endpoint: ChannelEndpoint
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpoint: ChannelEndpoint,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpoint = endpoint
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpoint = try container.decode(ChannelEndpoint.self, forKey: .endpoint)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpoint, forKey: .endpoint)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpoint
    }
}