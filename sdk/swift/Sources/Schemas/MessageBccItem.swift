import Foundation

public enum MessageBccItem: Codable, Hashable, Sendable {
    case string(String)
    case messageBccItemAddress(MessageBccItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(MessageBccItemAddress.self) {
            self = .messageBccItemAddress(value)
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
        case .messageBccItemAddress(let value):
            try container.encode(value)
        }
    }
}