import Foundation

public struct MessageCompose: Codable, Hashable, Sendable {
    public let to: [MessageComposeToItem]
    public let cc: [MessageComposeCcItem]?
    public let bcc: [MessageComposeBccItem]?
    public let replyTo: [MessageComposeReplyToItem]?
    public let subject: String?
    public let text: String?
    public let html: String?
    public let headers: [String: String]?
    public let attachments: [MessageComposeAttachmentsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        to: [MessageComposeToItem],
        cc: [MessageComposeCcItem]? = nil,
        bcc: [MessageComposeBccItem]? = nil,
        replyTo: [MessageComposeReplyToItem]? = nil,
        subject: String? = nil,
        text: String? = nil,
        html: String? = nil,
        headers: [String: String]? = nil,
        attachments: [MessageComposeAttachmentsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.replyTo = replyTo
        self.subject = subject
        self.text = text
        self.html = html
        self.headers = headers
        self.attachments = attachments
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.to = try container.decode([MessageComposeToItem].self, forKey: .to)
        self.cc = try container.decodeIfPresent([MessageComposeCcItem].self, forKey: .cc)
        self.bcc = try container.decodeIfPresent([MessageComposeBccItem].self, forKey: .bcc)
        self.replyTo = try container.decodeIfPresent([MessageComposeReplyToItem].self, forKey: .replyTo)
        self.subject = try container.decodeIfPresent(String.self, forKey: .subject)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.html = try container.decodeIfPresent(String.self, forKey: .html)
        self.headers = try container.decodeIfPresent([String: String].self, forKey: .headers)
        self.attachments = try container.decodeIfPresent([MessageComposeAttachmentsItem].self, forKey: .attachments)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.to, forKey: .to)
        try container.encodeIfPresent(self.cc, forKey: .cc)
        try container.encodeIfPresent(self.bcc, forKey: .bcc)
        try container.encodeIfPresent(self.replyTo, forKey: .replyTo)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.html, forKey: .html)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.attachments, forKey: .attachments)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case to
        case cc
        case bcc
        case replyTo
        case subject
        case text
        case html
        case headers
        case attachments
    }
}