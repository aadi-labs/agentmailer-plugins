import Foundation

public struct ChannelConversation: Codable, Hashable, Sendable {
    public let id: String
    public let endpointId: String
    public let channel: ChannelConversationChannel
    public let remoteAddress: String
    public let status: ChannelConversationStatus
    public let messageCount: Int
    public let lastMessageAt: Date
    public let lastInboundAt: Nullable<Date>
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        endpointId: String,
        channel: ChannelConversationChannel,
        remoteAddress: String,
        status: ChannelConversationStatus,
        messageCount: Int,
        lastMessageAt: Date,
        lastInboundAt: Nullable<Date>,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.endpointId = endpointId
        self.channel = channel
        self.remoteAddress = remoteAddress
        self.status = status
        self.messageCount = messageCount
        self.lastMessageAt = lastMessageAt
        self.lastInboundAt = lastInboundAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.channel = try container.decode(ChannelConversationChannel.self, forKey: .channel)
        self.remoteAddress = try container.decode(String.self, forKey: .remoteAddress)
        self.status = try container.decode(ChannelConversationStatus.self, forKey: .status)
        self.messageCount = try container.decode(Int.self, forKey: .messageCount)
        self.lastMessageAt = try container.decode(Date.self, forKey: .lastMessageAt)
        self.lastInboundAt = try container.decode(Nullable<Date>.self, forKey: .lastInboundAt)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.remoteAddress, forKey: .remoteAddress)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.messageCount, forKey: .messageCount)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.lastInboundAt, forKey: .lastInboundAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case endpointId
        case channel
        case remoteAddress
        case status
        case messageCount
        case lastMessageAt
        case lastInboundAt
        case createdAt
        case updatedAt
    }
}