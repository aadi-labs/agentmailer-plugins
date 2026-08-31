import Foundation

public struct MessageAttachmentsItem: Codable, Hashable, Sendable {
    public let id: String
    public let filename: String
    public let contentType: String
    public let size: Int
    public let contentId: Nullable<String>
    public let disposition: MessageAttachmentsItemDisposition
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        filename: String,
        contentType: String,
        size: Int,
        contentId: Nullable<String>,
        disposition: MessageAttachmentsItemDisposition,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.filename = filename
        self.contentType = contentType
        self.size = size
        self.contentId = contentId
        self.disposition = disposition
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.filename = try container.decode(String.self, forKey: .filename)
        self.contentType = try container.decode(String.self, forKey: .contentType)
        self.size = try container.decode(Int.self, forKey: .size)
        self.contentId = try container.decode(Nullable<String>.self, forKey: .contentId)
        self.disposition = try container.decode(MessageAttachmentsItemDisposition.self, forKey: .disposition)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.contentId, forKey: .contentId)
        try container.encode(self.disposition, forKey: .disposition)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case filename
        case contentType
        case size
        case contentId
        case disposition
    }
}