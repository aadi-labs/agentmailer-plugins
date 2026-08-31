import Foundation

public struct Message: Codable, Hashable, Sendable {
    public let id: String
    public let inboxId: String
    public let threadId: String
    public let direction: MessageDirection
    public let status: MessageStatus
    public let from: MessageFrom
    public let to: [MessageToItem]
    public let cc: [MessageCcItem]
    public let bcc: [MessageBccItem]
    public let replyTo: [MessageReplyToItem]
    public let subject: String
    public let text: Nullable<String>
    /// Untrusted email HTML. Sanitize and isolate it before browser rendering.
    public let html: Nullable<String>
    public let extractedText: Nullable<String>
    /// Untrusted latest-reply HTML. Sanitize and isolate it before browser rendering.
    public let extractedHtml: Nullable<String>
    public let headers: [String: String]
    public let inReplyTo: Nullable<String>
    public let references: [String]
    public let attachments: [MessageAttachmentsItem]
    public let createdAt: Date
    public let sentAt: Nullable<Date>
    public let receivedAt: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        inboxId: String,
        threadId: String,
        direction: MessageDirection,
        status: MessageStatus,
        from: MessageFrom,
        to: [MessageToItem],
        cc: [MessageCcItem],
        bcc: [MessageBccItem],
        replyTo: [MessageReplyToItem],
        subject: String,
        text: Nullable<String>,
        html: Nullable<String>,
        extractedText: Nullable<String>,
        extractedHtml: Nullable<String>,
        headers: [String: String],
        inReplyTo: Nullable<String>,
        references: [String],
        attachments: [MessageAttachmentsItem],
        createdAt: Date,
        sentAt: Nullable<Date>,
        receivedAt: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.inboxId = inboxId
        self.threadId = threadId
        self.direction = direction
        self.status = status
        self.from = from
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.replyTo = replyTo
        self.subject = subject
        self.text = text
        self.html = html
        self.extractedText = extractedText
        self.extractedHtml = extractedHtml
        self.headers = headers
        self.inReplyTo = inReplyTo
        self.references = references
        self.attachments = attachments
        self.createdAt = createdAt
        self.sentAt = sentAt
        self.receivedAt = receivedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.inboxId = try container.decode(String.self, forKey: .inboxId)
        self.threadId = try container.decode(String.self, forKey: .threadId)
        self.direction = try container.decode(MessageDirection.self, forKey: .direction)
        self.status = try container.decode(MessageStatus.self, forKey: .status)
        self.from = try container.decode(MessageFrom.self, forKey: .from)
        self.to = try container.decode([MessageToItem].self, forKey: .to)
        self.cc = try container.decode([MessageCcItem].self, forKey: .cc)
        self.bcc = try container.decode([MessageBccItem].self, forKey: .bcc)
        self.replyTo = try container.decode([MessageReplyToItem].self, forKey: .replyTo)
        self.subject = try container.decode(String.self, forKey: .subject)
        self.text = try container.decode(Nullable<String>.self, forKey: .text)
        self.html = try container.decode(Nullable<String>.self, forKey: .html)
        self.extractedText = try container.decode(Nullable<String>.self, forKey: .extractedText)
        self.extractedHtml = try container.decode(Nullable<String>.self, forKey: .extractedHtml)
        self.headers = try container.decode([String: String].self, forKey: .headers)
        self.inReplyTo = try container.decode(Nullable<String>.self, forKey: .inReplyTo)
        self.references = try container.decode([String].self, forKey: .references)
        self.attachments = try container.decode([MessageAttachmentsItem].self, forKey: .attachments)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.sentAt = try container.decode(Nullable<Date>.self, forKey: .sentAt)
        self.receivedAt = try container.decode(Nullable<Date>.self, forKey: .receivedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inboxId, forKey: .inboxId)
        try container.encode(self.threadId, forKey: .threadId)
        try container.encode(self.direction, forKey: .direction)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.cc, forKey: .cc)
        try container.encode(self.bcc, forKey: .bcc)
        try container.encode(self.replyTo, forKey: .replyTo)
        try container.encode(self.subject, forKey: .subject)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.html, forKey: .html)
        try container.encode(self.extractedText, forKey: .extractedText)
        try container.encode(self.extractedHtml, forKey: .extractedHtml)
        try container.encode(self.headers, forKey: .headers)
        try container.encode(self.inReplyTo, forKey: .inReplyTo)
        try container.encode(self.references, forKey: .references)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.sentAt, forKey: .sentAt)
        try container.encode(self.receivedAt, forKey: .receivedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case inboxId
        case threadId
        case direction
        case status
        case from
        case to
        case cc
        case bcc
        case replyTo
        case subject
        case text
        case html
        case extractedText
        case extractedHtml
        case headers
        case inReplyTo
        case references
        case attachments
        case createdAt
        case sentAt
        case receivedAt
    }
}