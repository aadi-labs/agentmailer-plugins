import Foundation

public struct GetThreadsResponse: Codable, Hashable, Sendable {
    public let thread: Thread
    public let messages: [Message]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        thread: Thread,
        messages: [Message],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.thread = thread
        self.messages = messages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.thread = try container.decode(Thread.self, forKey: .thread)
        self.messages = try container.decode([Message].self, forKey: .messages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.thread, forKey: .thread)
        try container.encode(self.messages, forKey: .messages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case thread
        case messages
    }
}