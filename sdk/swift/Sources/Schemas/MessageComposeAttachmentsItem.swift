import Foundation

public enum MessageComposeAttachmentsItem: Codable, Hashable, Sendable {
    case messageComposeAttachmentsItemContent(MessageComposeAttachmentsItemContent)
    case messageComposeAttachmentsItemAttachmentId(MessageComposeAttachmentsItemAttachmentId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(MessageComposeAttachmentsItemContent.self) {
            self = .messageComposeAttachmentsItemContent(value)
        } else if let value = try? container.decode(MessageComposeAttachmentsItemAttachmentId.self) {
            self = .messageComposeAttachmentsItemAttachmentId(value)
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
        case .messageComposeAttachmentsItemContent(let value):
            try container.encode(value)
        case .messageComposeAttachmentsItemAttachmentId(let value):
            try container.encode(value)
        }
    }
}