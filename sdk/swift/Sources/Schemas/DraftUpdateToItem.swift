import Foundation

public enum DraftUpdateToItem: Codable, Hashable, Sendable {
    case string(String)
    case draftUpdateToItemAddress(DraftUpdateToItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftUpdateToItemAddress.self) {
            self = .draftUpdateToItemAddress(value)
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
        case .draftUpdateToItemAddress(let value):
            try container.encode(value)
        }
    }
}