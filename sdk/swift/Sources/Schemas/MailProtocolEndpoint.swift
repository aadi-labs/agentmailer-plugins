import Foundation

public struct MailProtocolEndpoint: Codable, Hashable, Sendable {
    public let host: String
    public let port: Int
    public let security: MailProtocolEndpointSecurity
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        host: String,
        port: Int,
        security: MailProtocolEndpointSecurity,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.host = host
        self.port = port
        self.security = security
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.host = try container.decode(String.self, forKey: .host)
        self.port = try container.decode(Int.self, forKey: .port)
        self.security = try container.decode(MailProtocolEndpointSecurity.self, forKey: .security)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.host, forKey: .host)
        try container.encode(self.port, forKey: .port)
        try container.encode(self.security, forKey: .security)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case host
        case port
        case security
    }
}