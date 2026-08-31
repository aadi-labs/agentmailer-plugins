import Foundation

public enum DraftToItem: Codable, Hashable, Sendable {
    case string(String)
    case draftToItemAddress(DraftToItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftToItemAddress.self) {
            self = .draftToItemAddress(value)
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
        case .draftToItemAddress(let value):
            try container.encode(value)
        }
    }
}