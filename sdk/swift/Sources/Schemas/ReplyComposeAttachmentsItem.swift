import Foundation

public enum ReplyComposeAttachmentsItem: Codable, Hashable, Sendable {
    case replyComposeAttachmentsItemContent(ReplyComposeAttachmentsItemContent)
    case replyComposeAttachmentsItemAttachmentId(ReplyComposeAttachmentsItemAttachmentId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ReplyComposeAttachmentsItemContent.self) {
            self = .replyComposeAttachmentsItemContent(value)
        } else if let value = try? container.decode(ReplyComposeAttachmentsItemAttachmentId.self) {
            self = .replyComposeAttachmentsItemAttachmentId(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .replyComposeAttachmentsItemContent(let value):
            try container.encode(value)
        case .replyComposeAttachmentsItemAttachmentId(let value):
            try container.encode(value)
        }
    }
}