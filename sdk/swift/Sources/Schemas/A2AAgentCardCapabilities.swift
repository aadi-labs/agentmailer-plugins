import Foundation

public struct A2AAgentCardCapabilities: Codable, Hashable, Sendable {
    public let streaming: Bool
    public let pushNotifications: Bool
    public let extendedAgentCard: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        streaming: Bool,
        pushNotifications: Bool,
        extendedAgentCard: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.streaming = streaming
        self.pushNotifications = pushNotifications
        self.extendedAgentCard = extendedAgentCard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.streaming = try container.decode(Bool.self, forKey: .streaming)
        self.pushNotifications = try container.decode(Bool.self, forKey: .pushNotifications)
        self.extendedAgentCard = try container.decode(Bool.self, forKey: .extendedAgentCard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.streaming, forKey: .streaming)
        try container.encode(self.pushNotifications, forKey: .pushNotifications)
        try container.encode(self.extendedAgentCard, forKey: .extendedAgentCard)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case streaming
        case pushNotifications
        case extendedAgentCard
    }
}