import Foundation

public struct BootstrapResponseLimits: Codable, Hashable, Sendable {
    public let messagesPerDay: Int
    public let recipientsPerMessage: Int
    public let attachmentBytes: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messagesPerDay: Int,
        recipientsPerMessage: Int,
        attachmentBytes: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messagesPerDay = messagesPerDay
        self.recipientsPerMessage = recipientsPerMessage
        self.attachmentBytes = attachmentBytes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messagesPerDay = try container.decode(Int.self, forKey: .messagesPerDay)
        self.recipientsPerMessage = try container.decode(Int.self, forKey: .recipientsPerMessage)
        self.attachmentBytes = try container.decode(Int.self, forKey: .attachmentBytes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messagesPerDay, forKey: .messagesPerDay)
        try container.encode(self.recipientsPerMessage, forKey: .recipientsPerMessage)
        try container.encode(self.attachmentBytes, forKey: .attachmentBytes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messagesPerDay
        case recipientsPerMessage
        case attachmentBytes
    }
}