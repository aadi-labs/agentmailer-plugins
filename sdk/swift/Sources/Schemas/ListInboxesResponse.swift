import Foundation

public struct ListInboxesResponse: Codable, Hashable, Sendable {
    public let inboxes: [Inbox]
    public let nextPageToken: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        inboxes: [Inbox],
        nextPageToken: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.inboxes = inboxes
        self.nextPageToken = nextPageToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.inboxes = try container.decode([Inbox].self, forKey: .inboxes)
        self.nextPageToken = try container.decodeIfPresent(String.self, forKey: .nextPageToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.inboxes, forKey: .inboxes)
        try container.encodeIfPresent(self.nextPageToken, forKey: .nextPageToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case inboxes
        case nextPageToken
    }
}