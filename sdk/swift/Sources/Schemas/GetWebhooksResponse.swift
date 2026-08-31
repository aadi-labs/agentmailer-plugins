import Foundation

public struct GetWebhooksResponse: Codable, Hashable, Sendable {
    public let webhook: Webhook
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        webhook: Webhook,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.webhook = webhook
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.webhook = try container.decode(Webhook.self, forKey: .webhook)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.webhook, forKey: .webhook)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case webhook
    }
}