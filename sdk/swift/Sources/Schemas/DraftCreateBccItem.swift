import Foundation

public enum DraftCreateBccItem: Codable, Hashable, Sendable {
    case string(String)
    case draftCreateBccItemAddress(DraftCreateBccItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(DraftCreateBccItemAddress.self) {
            self = .draftCreateBccItemAddress(value)
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
        case .draftCreateBccItemAddress(let value):
            try container.encode(value)
        }
    }
}