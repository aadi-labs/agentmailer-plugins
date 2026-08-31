import Foundation

public struct BootstrapResponseInbox: Codable, Hashable, Sendable {
    public let id: String
    public let address: String
    public let status: BootstrapResponseInboxStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        address: String,
        status: BootstrapResponseInboxStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.address = address
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.address = try container.decode(String.self, forKey: .address)
        self.status = try container.decode(BootstrapResponseInboxStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case address
        case status
    }
}