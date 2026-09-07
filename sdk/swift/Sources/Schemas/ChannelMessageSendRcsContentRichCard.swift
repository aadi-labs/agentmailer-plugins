import Foundation

public struct ChannelMessageSendRcsContentRichCard: Codable, Hashable, Sendable {
    public let body: String
    public let title: String
    public let description: String?
    public let attachmentId: String?
    public let replies: [ChannelMessageSendRcsContentRichCardRepliesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: String,
        title: String,
        description: String? = nil,
        attachmentId: String? = nil,
        replies: [ChannelMessageSendRcsContentRichCardRepliesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.title = title
        self.description = description
        self.attachmentId = attachmentId
        self.replies = replies
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decode(String.self, forKey: .body)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.attachmentId = try container.decodeIfPresent(String.self, forKey: .attachmentId)
        self.replies = try container.decodeIfPresent([ChannelMessageSendRcsContentRichCardRepliesItem].self, forKey: .replies)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.body, forKey: .body)
        try container.encode(self.title, forKey: .title)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.attachmentId, forKey: .attachmentId)
        try container.encodeIfPresent(self.replies, forKey: .replies)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case title
        case description
        case attachmentId
        case replies
    }
}