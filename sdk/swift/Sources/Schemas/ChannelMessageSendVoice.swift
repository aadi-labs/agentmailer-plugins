import Foundation

public struct ChannelMessageSendVoice: Codable, Hashable, Sendable {
    public let endpointId: String
    public let to: String
    public let consent: ChannelMessageSendVoiceConsent
    public let content: ChannelMessageSendVoiceContent
    public let textType: ChannelMessageSendVoiceTextType?
    public let voiceId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpointId: String,
        to: String,
        consent: ChannelMessageSendVoiceConsent,
        content: ChannelMessageSendVoiceContent,
        textType: ChannelMessageSendVoiceTextType? = nil,
        voiceId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpointId = endpointId
        self.to = to
        self.consent = consent
        self.content = content
        self.textType = textType
        self.voiceId = voiceId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.to = try container.decode(String.self, forKey: .to)
        self.consent = try container.decode(ChannelMessageSendVoiceConsent.self, forKey: .consent)
        self.content = try container.decode(ChannelMessageSendVoiceContent.self, forKey: .content)
        self.textType = try container.decodeIfPresent(ChannelMessageSendVoiceTextType.self, forKey: .textType)
        self.voiceId = try container.decodeIfPresent(String.self, forKey: .voiceId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.consent, forKey: .consent)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.textType, forKey: .textType)
        try container.encodeIfPresent(self.voiceId, forKey: .voiceId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpointId
        case to
        case consent
        case content
        case textType
        case voiceId
    }
}