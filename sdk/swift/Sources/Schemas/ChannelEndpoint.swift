import Foundation

public struct ChannelEndpoint: Codable, Hashable, Sendable {
    public let id: String
    public let inboxId: String
    public let podId: String
    public let channel: ChannelEndpointChannel
    public let address: String
    public let status: ChannelEndpointStatus
    public let capabilities: [ChannelEndpointCapabilitiesItem]
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        inboxId: String,
        podId: String,
        channel: ChannelEndpointChannel,
        address: String,
        status: ChannelEndpointStatus,
        capabilities: [ChannelEndpointCapabilitiesItem],
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.inboxId = inboxId
        self.podId = podId
        self.channel = channel
        self.address = address
        self.status = status
        self.capabilities = capabilities
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.inboxId = try container.decode(String.self, forKey: .inboxId)
        self.podId = try container.decode(String.self, forKey: .podId)
        self.channel = try container.decode(ChannelEndpointChannel.self, forKey: .channel)
        self.address = try container.decode(String.self, forKey: .address)
        self.status = try container.decode(ChannelEndpointStatus.self, forKey: .status)
        self.capabilities = try container.decode([ChannelEndpointCapabilitiesItem].self, forKey: .capabilities)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inboxId, forKey: .inboxId)
        try container.encode(self.podId, forKey: .podId)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case inboxId
        case podId
        case channel
        case address
        case status
        case capabilities
        case createdAt
        case updatedAt
    }
}