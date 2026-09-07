import Foundation

public struct ChannelMessageSendSms: Codable, Hashable, Sendable {
    public let endpointId: String
    public let to: String
    public let consent: ChannelMessageSendSmsConsent
    public let content: ChannelMessageSendSmsContent
    public let messageType: ChannelMessageSendSmsMessageType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpointId: String,
        to: String,
        consent: ChannelMessageSendSmsConsent,
        content: ChannelMessageSendSmsContent,
        messageType: ChannelMessageSendSmsMessageType? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpointId = endpointId
        self.to = to
        self.consent = consent
        self.content = content
        self.messageType = messageType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.to = try container.decode(String.self, forKey: .to)
        self.consent = try container.decode(ChannelMessageSendSmsConsent.self, forKey: .consent)
        self.content = try container.decode(ChannelMessageSendSmsContent.self, forKey: .content)
        self.messageType = try container.decodeIfPresent(ChannelMessageSendSmsMessageType.self, forKey: .messageType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.consent, forKey: .consent)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.messageType, forKey: .messageType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpointId
        case to
        case consent
        case content
        case messageType
    }
}