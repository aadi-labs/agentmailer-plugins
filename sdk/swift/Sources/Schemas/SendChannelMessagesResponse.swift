import Foundation

public struct SendChannelMessagesResponse: Codable, Hashable, Sendable {
    public let message: ChannelMessage
    public let replayed: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: ChannelMessage,
        replayed: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.replayed = replayed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(ChannelMessage.self, forKey: .message)
        self.replayed = try container.decode(Bool.self, forKey: .replayed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.replayed, forKey: .replayed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case replayed
    }
}