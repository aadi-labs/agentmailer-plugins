import Foundation

public struct ChannelMessageSendRcs: Codable, Hashable, Sendable {
    public let endpointId: String
    public let to: String
    public let consent: ChannelMessageSendRcsConsent
    public let content: ChannelMessageSendRcsContent
    public let fallback: ChannelMessageSendRcsFallback?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpointId: String,
        to: String,
        consent: ChannelMessageSendRcsConsent,
        content: ChannelMessageSendRcsContent,
        fallback: ChannelMessageSendRcsFallback? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpointId = endpointId
        self.to = to
        self.consent = consent
        self.content = content
        self.fallback = fallback
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.to = try container.decode(String.self, forKey: .to)
        self.consent = try container.decode(ChannelMessageSendRcsConsent.self, forKey: .consent)
        self.content = try container.decode(ChannelMessageSendRcsContent.self, forKey: .content)
        self.fallback = try container.decodeIfPresent(ChannelMessageSendRcsFallback.self, forKey: .fallback)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.consent, forKey: .consent)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.fallback, forKey: .fallback)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpointId
        case to
        case consent
        case content
        case fallback
    }
}