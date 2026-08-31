import Foundation

public struct Thread: Codable, Hashable, Sendable {
    public let id: String
    public let subject: String
    public let participants: [ThreadParticipantsItem]
    public let messageCount: Int
    public let lastMessageAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        subject: String,
        participants: [ThreadParticipantsItem],
        messageCount: Int,
        lastMessageAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.subject = subject
        self.participants = participants
        self.messageCount = messageCount
        self.lastMessageAt = lastMessageAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.subject = try container.decode(String.self, forKey: .subject)
        self.participants = try container.decode([ThreadParticipantsItem].self, forKey: .participants)
        self.messageCount = try container.decode(Int.self, forKey: .messageCount)
        self.lastMessageAt = try container.decode(Date.self, forKey: .lastMessageAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.subject, forKey: .subject)
        try container.encode(self.participants, forKey: .participants)
        try container.encode(self.messageCount, forKey: .messageCount)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case subject
        case participants
        case messageCount
        case lastMessageAt
    }
}