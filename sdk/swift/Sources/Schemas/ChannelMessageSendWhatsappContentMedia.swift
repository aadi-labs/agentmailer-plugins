import Foundation

public struct ChannelMessageSendWhatsappContentMedia: Codable, Hashable, Sendable {
    public let kind: ChannelMessageSendWhatsappContentMediaKind
    public let attachmentId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        kind: ChannelMessageSendWhatsappContentMediaKind,
        attachmentId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.kind = kind
        self.attachmentId = attachmentId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(ChannelMessageSendWhatsappContentMediaKind.self, forKey: .kind)
        self.attachmentId = try container.decode(String.self, forKey: .attachmentId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.attachmentId, forKey: .attachmentId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
        case attachmentId
    }
}