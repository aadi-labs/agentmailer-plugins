import Foundation

public struct ChannelMessageSendWhatsappContentButtons: Codable, Hashable, Sendable {
    public let body: String
    public let buttons: [ChannelMessageSendWhatsappContentButtonsButtonsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: String,
        buttons: [ChannelMessageSendWhatsappContentButtonsButtonsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.buttons = buttons
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decode(String.self, forKey: .body)
        self.buttons = try container.decode([ChannelMessageSendWhatsappContentButtonsButtonsItem].self, forKey: .buttons)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.body, forKey: .body)
        try container.encode(self.buttons, forKey: .buttons)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case buttons
    }
}