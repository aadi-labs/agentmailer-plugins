import Foundation

public struct ChannelMessage: Codable, Hashable, Sendable {
    public let id: String
    public let endpointId: String
    public let conversationId: String
    public let channel: ChannelMessageChannel
    public let direction: ChannelMessageDirection
    public let status: ChannelMessageStatus
    public let from: String
    public let to: String
    public let text: Nullable<String>
    public let mediaUrls: [String]
    public let attachmentIds: [JSONValue]
    public let providerMessageId: Nullable<String>
    public let failureCode: Nullable<String>
    public let safety: Nullable<ChannelMessageSafety>
    public let createdAt: Date
    public let sentAt: Nullable<Date>
    public let receivedAt: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        endpointId: String,
        conversationId: String,
        channel: ChannelMessageChannel,
        direction: ChannelMessageDirection,
        status: ChannelMessageStatus,
        from: String,
        to: String,
        text: Nullable<String>,
        mediaUrls: [String],
        attachmentIds: [JSONValue],
        providerMessageId: Nullable<String>,
        failureCode: Nullable<String>,
        safety: Nullable<ChannelMessageSafety>,
        createdAt: Date,
        sentAt: Nullable<Date>,
        receivedAt: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.endpointId = endpointId
        self.conversationId = conversationId
        self.channel = channel
        self.direction = direction
        self.status = status
        self.from = from
        self.to = to
        self.text = text
        self.mediaUrls = mediaUrls
        self.attachmentIds = attachmentIds
        self.providerMessageId = providerMessageId
        self.failureCode = failureCode
        self.safety = safety
        self.createdAt = createdAt
        self.sentAt = sentAt
        self.receivedAt = receivedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.conversationId = try container.decode(String.self, forKey: .conversationId)
        self.channel = try container.decode(ChannelMessageChannel.self, forKey: .channel)
        self.direction = try container.decode(ChannelMessageDirection.self, forKey: .direction)
        self.status = try container.decode(ChannelMessageStatus.self, forKey: .status)
        self.from = try container.decode(String.self, forKey: .from)
        self.to = try container.decode(String.self, forKey: .to)
        self.text = try container.decode(Nullable<String>.self, forKey: .text)
        self.mediaUrls = try container.decode([String].self, forKey: .mediaUrls)
        self.attachmentIds = try container.decode([JSONValue].self, forKey: .attachmentIds)
        self.providerMessageId = try container.decode(Nullable<String>.self, forKey: .providerMessageId)
        self.failureCode = try container.decode(Nullable<String>.self, forKey: .failureCode)
        self.safety = try container.decode(Nullable<ChannelMessageSafety>.self, forKey: .safety)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.sentAt = try container.decode(Nullable<Date>.self, forKey: .sentAt)
        self.receivedAt = try container.decode(Nullable<Date>.self, forKey: .receivedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.conversationId, forKey: .conversationId)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.direction, forKey: .direction)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.mediaUrls, forKey: .mediaUrls)
        try container.encode(self.attachmentIds, forKey: .attachmentIds)
        try container.encode(self.providerMessageId, forKey: .providerMessageId)
        try container.encode(self.failureCode, forKey: .failureCode)
        try container.encode(self.safety, forKey: .safety)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.sentAt, forKey: .sentAt)
        try container.encode(self.receivedAt, forKey: .receivedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case endpointId
        case conversationId
        case channel
        case direction
        case status
        case from
        case to
        case text
        case mediaUrls
        case attachmentIds
        case providerMessageId
        case failureCode
        case safety
        case createdAt
        case sentAt
        case receivedAt
    }
}