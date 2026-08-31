import Foundation

public struct BootstrapResponseLinks: Codable, Hashable, Sendable {
    public let inbox: String
    public let messages: String
    public let events: String
    public let imap: String
    public let smtp: String
    public let a2A: String
    public let agentCard: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        inbox: String,
        messages: String,
        events: String,
        imap: String,
        smtp: String,
        a2A: String,
        agentCard: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.inbox = inbox
        self.messages = messages
        self.events = events
        self.imap = imap
        self.smtp = smtp
        self.a2A = a2A
        self.agentCard = agentCard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.inbox = try container.decode(String.self, forKey: .inbox)
        self.messages = try container.decode(String.self, forKey: .messages)
        self.events = try container.decode(String.self, forKey: .events)
        self.imap = try container.decode(String.self, forKey: .imap)
        self.smtp = try container.decode(String.self, forKey: .smtp)
        self.a2A = try container.decode(String.self, forKey: .a2A)
        self.agentCard = try container.decode(String.self, forKey: .agentCard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.inbox, forKey: .inbox)
        try container.encode(self.messages, forKey: .messages)
        try container.encode(self.events, forKey: .events)
        try container.encode(self.imap, forKey: .imap)
        try container.encode(self.smtp, forKey: .smtp)
        try container.encode(self.a2A, forKey: .a2A)
        try container.encode(self.agentCard, forKey: .agentCard)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case inbox
        case messages
        case events
        case imap
        case smtp
        case a2A = "a2a"
        case agentCard
    }
}