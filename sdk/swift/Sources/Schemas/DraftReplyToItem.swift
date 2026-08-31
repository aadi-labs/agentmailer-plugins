import Foundation

public enum DraftReplyToItem: Codable, Hashable, Sendable {
    case string(String)
    case draftReplyToItemAddress(DraftReplyToItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftReplyToItemAddress.self) {
            self = .draftReplyToItemAddress(value)
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
        case .string(let value):
            try container.encode(value)
        case .draftReplyToItemAddress(let value):
            try container.encode(value)
        }
    }
}