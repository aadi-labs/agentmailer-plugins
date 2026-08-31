import Foundation

public enum DraftCreateAttachmentsItem: Codable, Hashable, Sendable {
    case draftCreateAttachmentsItemContent(DraftCreateAttachmentsItemContent)
    case draftCreateAttachmentsItemAttachmentId(DraftCreateAttachmentsItemAttachmentId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DraftCreateAttachmentsItemContent.self) {
            self = .draftCreateAttachmentsItemContent(value)
        } else if let value = try? container.decode(DraftCreateAttachmentsItemAttachmentId.self) {
            self = .draftCreateAttachmentsItemAttachmentId(value)
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
        case .draftCreateAttachmentsItemContent(let value):
            try container.encode(value)
        case .draftCreateAttachmentsItemAttachmentId(let value):
            try container.encode(value)
        }
    }
}