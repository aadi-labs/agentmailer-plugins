import Foundation

public enum DraftBccItem: Codable, Hashable, Sendable {
    case string(String)
    case draftBccItemAddress(DraftBccItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftBccItemAddress.self) {
            self = .draftBccItemAddress(value)
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
        case .draftBccItemAddress(let value):
            try container.encode(value)
        }
    }
}