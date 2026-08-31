import Foundation

public struct MessageComposeAttachmentsItemContent: Codable, Hashable, Sendable {
    public let filename: String
    public let contentType: String
    public let content: String
    public let contentId: String?
    public let disposition: MessageComposeAttachmentsItemContentDisposition?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        filename: String,
        contentType: String,
        content: String,
        contentId: String? = nil,
        disposition: MessageComposeAttachmentsItemContentDisposition? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.filename = filename
        self.contentType = contentType
        self.content = content
        self.contentId = contentId
        self.disposition = disposition
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filename = try container.decode(String.self, forKey: .filename)
        self.contentType = try container.decode(String.self, forKey: .contentType)
        self.content = try container.decode(String.self, forKey: .content)
        self.contentId = try container.decodeIfPresent(String.self, forKey: .contentId)
        self.disposition = try container.decodeIfPresent(MessageComposeAttachmentsItemContentDisposition.self, forKey: .disposition)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.contentId, forKey: .contentId)
        try container.encodeIfPresent(self.disposition, forKey: .disposition)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case filename
        case contentType
        case content
        case contentId
        case disposition
    }
}