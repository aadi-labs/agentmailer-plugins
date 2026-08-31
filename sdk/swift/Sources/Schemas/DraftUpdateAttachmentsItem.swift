import Foundation

public enum DraftUpdateAttachmentsItem: Codable, Hashable, Sendable {
    case draftUpdateAttachmentsItemContent(DraftUpdateAttachmentsItemContent)
    case draftUpdateAttachmentsItemAttachmentId(DraftUpdateAttachmentsItemAttachmentId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DraftUpdateAttachmentsItemContent.self) {
            self = .draftUpdateAttachmentsItemContent(value)
        } else if let value = try? container.decode(DraftUpdateAttachmentsItemAttachmentId.self) {
            self = .draftUpdateAttachmentsItemAttachmentId(value)
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
        case .draftUpdateAttachmentsItemContent(let value):
            try container.encode(value)
        case .draftUpdateAttachmentsItemAttachmentId(let value):
            try container.encode(value)
        }
    }
}