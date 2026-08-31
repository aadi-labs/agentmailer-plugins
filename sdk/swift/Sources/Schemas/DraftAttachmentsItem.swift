import Foundation

public enum DraftAttachmentsItem: Codable, Hashable, Sendable {
    case draftAttachmentsItemContent(DraftAttachmentsItemContent)
    case draftAttachmentsItemAttachmentId(DraftAttachmentsItemAttachmentId)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DraftAttachmentsItemContent.self) {
            self = .draftAttachmentsItemContent(value)
        } else if let value = try? container.decode(DraftAttachmentsItemAttachmentId.self) {
            self = .draftAttachmentsItemAttachmentId(value)
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
        case .draftAttachmentsItemContent(let value):
            try container.encode(value)
        case .draftAttachmentsItemAttachmentId(let value):
            try container.encode(value)
        }
    }
}