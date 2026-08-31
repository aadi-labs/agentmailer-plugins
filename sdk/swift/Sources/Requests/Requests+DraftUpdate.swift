import Foundation

extension Requests {
    public struct DraftUpdate: Codable, Hashable, Sendable {
        public let to: [DraftUpdateToItem]?
        public let cc: [DraftUpdateCcItem]?
        public let bcc: [DraftUpdateBccItem]?
        public let replyTo: [DraftUpdateReplyToItem]?
        public let subject: String?
        public let text: String?
        public let html: String?
        public let headers: [String: String]?
        public let attachments: [DraftUpdateAttachmentsItem]?
        public let replyToMessageId: String?
        public let forwardMessageId: String?
        public let sendAt: Nullable<Date>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            to: [DraftUpdateToItem]? = nil,
            cc: [DraftUpdateCcItem]? = nil,
            bcc: [DraftUpdateBccItem]? = nil,
            replyTo: [DraftUpdateReplyToItem]? = nil,
            subject: String? = nil,
            text: String? = nil,
            html: String? = nil,
            headers: [String: String]? = nil,
            attachments: [DraftUpdateAttachmentsItem]? = nil,
            replyToMessageId: String? = nil,
            forwardMessageId: String? = nil,
            sendAt: Nullable<Date>? = nil,
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
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.to = try container.decodeIfPresent([DraftUpdateToItem].self, forKey: .to)
            self.cc = try container.decodeIfPresent([DraftUpdateCcItem].self, forKey: .cc)
            self.bcc = try container.decodeIfPresent([DraftUpdateBccItem].self, forKey: .bcc)
            self.replyTo = try container.decodeIfPresent([DraftUpdateReplyToItem].self, forKey: .replyTo)
            self.subject = try container.decodeIfPresent(String.self, forKey: .subject)
            self.text = try container.decodeIfPresent(String.self, forKey: .text)
            self.html = try container.decodeIfPresent(String.self, forKey: .html)
            self.headers = try container.decodeIfPresent([String: String].self, forKey: .headers)
            self.attachments = try container.decodeIfPresent([DraftUpdateAttachmentsItem].self, forKey: .attachments)
            self.replyToMessageId = try container.decodeIfPresent(String.self, forKey: .replyToMessageId)
            self.forwardMessageId = try container.decodeIfPresent(String.self, forKey: .forwardMessageId)
            self.sendAt = try container.decodeNullableIfPresent(Date.self, forKey: .sendAt)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.to, forKey: .to)
            try container.encodeIfPresent(self.cc, forKey: .cc)
            try container.encodeIfPresent(self.bcc, forKey: .bcc)
            try container.encodeIfPresent(self.replyTo, forKey: .replyTo)
            try container.encodeIfPresent(self.subject, forKey: .subject)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(self.html, forKey: .html)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encodeIfPresent(self.replyToMessageId, forKey: .replyToMessageId)
            try container.encodeIfPresent(self.forwardMessageId, forKey: .forwardMessageId)
            try container.encodeNullableIfPresent(self.sendAt, forKey: .sendAt)
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
        }
    }
}