import Foundation

public struct CreateInboxesResponse: Codable, Hashable, Sendable {
    public let inbox: Inbox
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        inbox: Inbox,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.inbox = inbox
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.inbox = try container.decode(Inbox.self, forKey: .inbox)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.inbox, forKey: .inbox)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case inbox
    }
}