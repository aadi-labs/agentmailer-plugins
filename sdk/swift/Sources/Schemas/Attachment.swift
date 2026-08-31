import Foundation

public struct Attachment: Codable, Hashable, Sendable {
    public let id: String
    public let filename: String
    public let contentType: String
    public let size: Int
    public let status: AttachmentStatus
    public let expiresAt: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        filename: String,
        contentType: String,
        size: Int,
        status: AttachmentStatus,
        expiresAt: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.filename = filename
        self.contentType = contentType
        self.size = size
        self.status = status
        self.expiresAt = expiresAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.filename = try container.decode(String.self, forKey: .filename)
        self.contentType = try container.decode(String.self, forKey: .contentType)
        self.size = try container.decode(Int.self, forKey: .size)
        self.status = try container.decode(AttachmentStatus.self, forKey: .status)
        self.expiresAt = try container.decode(Nullable<Date>.self, forKey: .expiresAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.expiresAt, forKey: .expiresAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case filename
        case contentType
        case size
        case status
        case expiresAt
    }
}