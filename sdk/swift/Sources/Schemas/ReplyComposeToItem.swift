import Foundation

public enum ReplyComposeToItem: Codable, Hashable, Sendable {
    case string(String)
    case replyComposeToItemAddress(ReplyComposeToItemAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(ReplyComposeToItemAddress.self) {
            self = .replyComposeToItemAddress(value)
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
        case .replyComposeToItemAddress(let value):
            try container.encode(value)
        }
    }
}