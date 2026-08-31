import Foundation

public struct Inbox: Codable, Hashable, Sendable {
    public let id: String
    public let podId: String
    public let address: String
    public let displayName: Nullable<String>
    public let clientId: Nullable<String>
    public let metadata: [String: InboxMetadataValue]
    public let status: InboxStatus
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        podId: String,
        address: String,
        displayName: Nullable<String>,
        clientId: Nullable<String>,
        metadata: [String: InboxMetadataValue],
        status: InboxStatus,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.podId = podId
        self.address = address
        self.displayName = displayName
        self.clientId = clientId
        self.metadata = metadata
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.podId = try container.decode(String.self, forKey: .podId)
        self.address = try container.decode(String.self, forKey: .address)
        self.displayName = try container.decode(Nullable<String>.self, forKey: .displayName)
        self.clientId = try container.decode(Nullable<String>.self, forKey: .clientId)
        self.metadata = try container.decode([String: InboxMetadataValue].self, forKey: .metadata)
        self.status = try container.decode(InboxStatus.self, forKey: .status)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.podId, forKey: .podId)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.clientId, forKey: .clientId)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case podId
        case address
        case displayName
        case clientId
        case metadata
        case status
        case createdAt
        case updatedAt
    }
}