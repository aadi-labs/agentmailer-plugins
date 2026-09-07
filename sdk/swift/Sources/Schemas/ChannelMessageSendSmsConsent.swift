import Foundation

public struct ChannelMessageSendSmsConsent: Codable, Hashable, Sendable {
    public let basis: ChannelMessageSendSmsConsentBasis
    public let capturedAt: Date
    public let reference: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        basis: ChannelMessageSendSmsConsentBasis,
        capturedAt: Date,
        reference: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.basis = basis
        self.capturedAt = capturedAt
        self.reference = reference
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.basis = try container.decode(ChannelMessageSendSmsConsentBasis.self, forKey: .basis)
        self.capturedAt = try container.decode(Date.self, forKey: .capturedAt)
        self.reference = try container.decode(String.self, forKey: .reference)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.basis, forKey: .basis)
        try container.encode(self.capturedAt, forKey: .capturedAt)
        try container.encode(self.reference, forKey: .reference)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case basis
        case capturedAt
        case reference
    }
}