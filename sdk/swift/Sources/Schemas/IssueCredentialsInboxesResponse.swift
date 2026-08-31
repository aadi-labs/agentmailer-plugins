import Foundation

public struct IssueCredentialsInboxesResponse: Codable, Hashable, Sendable {
    public let username: String
    public let password: String
    public let imap: MailProtocolEndpoint
    public let smtp: MailProtocolEndpoint
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        username: String,
        password: String,
        imap: MailProtocolEndpoint,
        smtp: MailProtocolEndpoint,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.username = username
        self.password = password
        self.imap = imap
        self.smtp = smtp
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.imap = try container.decode(MailProtocolEndpoint.self, forKey: .imap)
        self.smtp = try container.decode(MailProtocolEndpoint.self, forKey: .smtp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.password, forKey: .password)
        try container.encode(self.imap, forKey: .imap)
        try container.encode(self.smtp, forKey: .smtp)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case username
        case password
        case imap
        case smtp
    }
}