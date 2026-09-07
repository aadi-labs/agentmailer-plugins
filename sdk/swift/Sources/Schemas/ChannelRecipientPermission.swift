import Foundation

public struct ChannelRecipientPermission: Codable, Hashable, Sendable {
    public let endpointId: String
    public let channel: ChannelRecipientPermissionChannel
    public let recipient: String
    public let status: ChannelRecipientPermissionStatus
    public let consentBasis: Nullable<ChannelRecipientPermissionConsentBasis>
    public let consentReference: Nullable<String>
    public let consentCapturedAt: Nullable<Date>
    public let optedOutAt: Nullable<Date>
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endpointId: String,
        channel: ChannelRecipientPermissionChannel,
        recipient: String,
        status: ChannelRecipientPermissionStatus,
        consentBasis: Nullable<ChannelRecipientPermissionConsentBasis>,
        consentReference: Nullable<String>,
        consentCapturedAt: Nullable<Date>,
        optedOutAt: Nullable<Date>,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endpointId = endpointId
        self.channel = channel
        self.recipient = recipient
        self.status = status
        self.consentBasis = consentBasis
        self.consentReference = consentReference
        self.consentCapturedAt = consentCapturedAt
        self.optedOutAt = optedOutAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endpointId = try container.decode(String.self, forKey: .endpointId)
        self.channel = try container.decode(ChannelRecipientPermissionChannel.self, forKey: .channel)
        self.recipient = try container.decode(String.self, forKey: .recipient)
        self.status = try container.decode(ChannelRecipientPermissionStatus.self, forKey: .status)
        self.consentBasis = try container.decode(Nullable<ChannelRecipientPermissionConsentBasis>.self, forKey: .consentBasis)
        self.consentReference = try container.decode(Nullable<String>.self, forKey: .consentReference)
        self.consentCapturedAt = try container.decode(Nullable<Date>.self, forKey: .consentCapturedAt)
        self.optedOutAt = try container.decode(Nullable<Date>.self, forKey: .optedOutAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endpointId, forKey: .endpointId)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.recipient, forKey: .recipient)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.consentBasis, forKey: .consentBasis)
        try container.encode(self.consentReference, forKey: .consentReference)
        try container.encode(self.consentCapturedAt, forKey: .consentCapturedAt)
        try container.encode(self.optedOutAt, forKey: .optedOutAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endpointId
        case channel
        case recipient
        case status
        case consentBasis
        case consentReference
        case consentCapturedAt
        case optedOutAt
        case updatedAt
    }
}