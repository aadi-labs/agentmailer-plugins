import Foundation

public enum ChannelMessageSendRcsContent: Codable, Hashable, Sendable {
    case richCard(ChannelMessageSendRcsContentRichCard)
    case text(ChannelMessageSendRcsContentText)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "rich_card":
            self = .richCard(try ChannelMessageSendRcsContentRichCard(from: decoder))
        case "text":
            self = .text(try ChannelMessageSendRcsContentText(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .richCard(let data):
            try container.encode("rich_card", forKey: .type)
            try data.encode(to: encoder)
        case .text(let data):
            try container.encode("text", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}