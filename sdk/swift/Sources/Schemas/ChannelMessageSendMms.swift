import Foundation

public struct ChannelMessageSendMms: Codable, Hashable, Sendable {
    public let endpointId: String
    public let to: String
    public let consent: ChannelMessageSendMmsConsent
    public let content: ChannelMessageSendMmsContent?
    public let attachmentIds: [JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpointId: String,
        to: String,
        consent: ChannelMessageSendMmsConsent,
        content: ChannelMessageSendMmsContent? = nil,
        attachmentIds: [JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpointId = endpointId
        self.to = to
        self.consent = consent
        self.content = content
        self.attachmentIds = attachmentIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.to = try container.decode(String.self, forKey: .to)
        self.consent = try container.decode(ChannelMessageSendMmsConsent.self, forKey: .consent)
        self.content = try container.decodeIfPresent(ChannelMessageSendMmsContent.self, forKey: .content)
        self.attachmentIds = try container.decode([JSONValue].self, forKey: .attachmentIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.consent, forKey: .consent)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encode(self.attachmentIds, forKey: .attachmentIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpointId
        case to
        case consent
        case content
        case attachmentIds
    }
}