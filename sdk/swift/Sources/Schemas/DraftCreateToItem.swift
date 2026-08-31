import Foundation

public enum DraftCreateToItem: Codable, Hashable, Sendable {
    case string(String)
    case draftCreateToItemAddress(DraftCreateToItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftCreateToItemAddress.self) {
            self = .draftCreateToItemAddress(value)
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
        case .draftCreateToItemAddress(let value):
            try container.encode(value)
        }
    }
}