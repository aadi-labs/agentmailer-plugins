import Foundation

public struct ChannelMessageSendSmsContent: Codable, Hashable, Sendable {
    public let type: ChannelMessageSendSmsContentType
    public let body: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: ChannelMessageSendSmsContentType,
        body: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.body = body
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ChannelMessageSendSmsContentType.self, forKey: .type)
        self.body = try container.decode(String.self, forKey: .body)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.body, forKey: .body)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case body
    }
}