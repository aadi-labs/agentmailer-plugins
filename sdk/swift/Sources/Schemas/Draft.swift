import Foundation

public struct Draft: Codable, Hashable, Sendable {
    public let to: [DraftToItem]
    public let cc: [DraftCcItem]?
    public let bcc: [DraftBccItem]?
    public let replyTo: [DraftReplyToItem]?
    public let subject: String?
    public let text: String?
    public let html: String?
    public let headers: [String: String]?
    public let attachments: [DraftAttachmentsItem]
    public let replyToMessageId: String?
    public let forwardMessageId: String?
    public let sendAt: Nullable<Date>?
    public let id: String
    public let inboxId: String
    public let createdAt: Date
    public let updatedAt: Date
    public let sendStatus: Nullable<DraftSendStatus>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        to: [DraftToItem],
        cc: [DraftCcItem]? = nil,
        bcc: [DraftBccItem]? = nil,
        replyTo: [DraftReplyToItem]? = nil,
        subject: String? = nil,
        text: String? = nil,
        html: String? = nil,
        headers: [String: String]? = nil,
        attachments: [DraftAttachmentsItem],
        replyToMessageId: String? = nil,
        forwardMessageId: String? = nil,
        sendAt: Nullable<Date>? = nil,
        id: String,
        inboxId: String,
        createdAt: Date,
        updatedAt: Date,
        sendStatus: Nullable<DraftSendStatus>,
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
        self.replyToMessageId = replyToMessageId
        self.forwardMessageId = forwardMessageId
        self.sendAt = sendAt
        self.id = id
        self.inboxId = inboxId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.sendStatus = sendStatus
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.to = try container.decode([DraftToItem].self, forKey: .to)
        self.cc = try container.decodeIfPresent([DraftCcItem].self, forKey: .cc)
        self.bcc = try container.decodeIfPresent([DraftBccItem].self, forKey: .bcc)
        self.replyTo = try container.decodeIfPresent([DraftReplyToItem].self, forKey: .replyTo)
        self.subject = try container.decodeIfPresent(String.self, forKey: .subject)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.html = try container.decodeIfPresent(String.self, forKey: .html)
        self.headers = try container.decodeIfPresent([String: String].self, forKey: .headers)
        self.attachments = try container.decode([DraftAttachmentsItem].self, forKey: .attachments)
        self.replyToMessageId = try container.decodeIfPresent(String.self, forKey: .replyToMessageId)
        self.forwardMessageId = try container.decodeIfPresent(String.self, forKey: .forwardMessageId)
        self.sendAt = try container.decodeNullableIfPresent(Date.self, forKey: .sendAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.inboxId = try container.decode(String.self, forKey: .inboxId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.sendStatus = try container.decode(Nullable<DraftSendStatus>.self, forKey: .sendStatus)
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
        try container.encode(self.attachments, forKey: .attachments)
        try container.encodeIfPresent(self.replyToMessageId, forKey: .replyToMessageId)
        try container.encodeIfPresent(self.forwardMessageId, forKey: .forwardMessageId)
        try container.encodeNullableIfPresent(self.sendAt, forKey: .sendAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inboxId, forKey: .inboxId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.sendStatus, forKey: .sendStatus)
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
        case replyToMessageId
        case forwardMessageId
        case sendAt
        case id
        case inboxId
        case createdAt
        case updatedAt
        case sendStatus
    }
}