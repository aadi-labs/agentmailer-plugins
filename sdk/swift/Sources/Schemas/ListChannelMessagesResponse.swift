import Foundation

public struct ListChannelMessagesResponse: Codable, Hashable, Sendable {
    public let messages: [ChannelMessage]
    public let nextPageToken: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [ChannelMessage],
        nextPageToken: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.nextPageToken = nextPageToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decode([ChannelMessage].self, forKey: .messages)
        self.nextPageToken = try container.decode(String.self, forKey: .nextPageToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messages, forKey: .messages)
        try container.encode(self.nextPageToken, forKey: .nextPageToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case nextPageToken
    }
}