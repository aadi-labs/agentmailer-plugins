import Foundation

public struct BootstrapResponseCapabilities: Codable, Hashable, Sendable {
    public let receive: Bool
    public let send: Bool
    public let imap: Bool
    public let smtp: Bool
    public let customDomains: Bool
    public let a2A: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        receive: Bool,
        send: Bool,
        imap: Bool,
        smtp: Bool,
        customDomains: Bool,
        a2A: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.receive = receive
        self.send = send
        self.imap = imap
        self.smtp = smtp
        self.customDomains = customDomains
        self.a2A = a2A
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.receive = try container.decode(Bool.self, forKey: .receive)
        self.send = try container.decode(Bool.self, forKey: .send)
        self.imap = try container.decode(Bool.self, forKey: .imap)
        self.smtp = try container.decode(Bool.self, forKey: .smtp)
        self.customDomains = try container.decode(Bool.self, forKey: .customDomains)
        self.a2A = try container.decode(Bool.self, forKey: .a2A)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.receive, forKey: .receive)
        try container.encode(self.send, forKey: .send)
        try container.encode(self.imap, forKey: .imap)
        try container.encode(self.smtp, forKey: .smtp)
        try container.encode(self.customDomains, forKey: .customDomains)
        try container.encode(self.a2A, forKey: .a2A)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case receive
        case send
        case imap
        case smtp
        case customDomains
        case a2A = "a2a"
    }
}