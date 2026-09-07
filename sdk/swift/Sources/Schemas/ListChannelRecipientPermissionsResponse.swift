import Foundation

public struct ListChannelRecipientPermissionsResponse: Codable, Hashable, Sendable {
    public let permissions: [ChannelRecipientPermission]
    public let nextPageToken: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        permissions: [ChannelRecipientPermission],
        nextPageToken: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.permissions = permissions
        self.nextPageToken = nextPageToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.permissions = try container.decode([ChannelRecipientPermission].self, forKey: .permissions)
        self.nextPageToken = try container.decode(String.self, forKey: .nextPageToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.permissions, forKey: .permissions)
        try container.encode(self.nextPageToken, forKey: .nextPageToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case permissions
        case nextPageToken
    }
}