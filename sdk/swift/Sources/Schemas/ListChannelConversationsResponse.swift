import Foundation

public struct ListChannelConversationsResponse: Codable, Hashable, Sendable {
    public let conversations: [ChannelConversation]
    public let nextPageToken: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversations: [ChannelConversation],
        nextPageToken: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversations = conversations
        self.nextPageToken = nextPageToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversations = try container.decode([ChannelConversation].self, forKey: .conversations)
        self.nextPageToken = try container.decode(String.self, forKey: .nextPageToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.conversations, forKey: .conversations)
        try container.encode(self.nextPageToken, forKey: .nextPageToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversations
        case nextPageToken
    }
}