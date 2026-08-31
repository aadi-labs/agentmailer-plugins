import Foundation

public struct DraftCreateAttachmentsItemAttachmentId: Codable, Hashable, Sendable {
    public let attachmentId: String
    public let contentId: String?
    public let disposition: DraftCreateAttachmentsItemAttachmentIdDisposition?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachmentId: String,
        contentId: String? = nil,
        disposition: DraftCreateAttachmentsItemAttachmentIdDisposition? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachmentId = attachmentId
        self.contentId = contentId
        self.disposition = disposition
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentId = try container.decode(String.self, forKey: .attachmentId)
        self.contentId = try container.decodeIfPresent(String.self, forKey: .contentId)
        self.disposition = try container.decodeIfPresent(DraftCreateAttachmentsItemAttachmentIdDisposition.self, forKey: .disposition)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachmentId, forKey: .attachmentId)
        try container.encodeIfPresent(self.contentId, forKey: .contentId)
        try container.encodeIfPresent(self.disposition, forKey: .disposition)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachmentId
        case contentId
        case disposition
    }
}