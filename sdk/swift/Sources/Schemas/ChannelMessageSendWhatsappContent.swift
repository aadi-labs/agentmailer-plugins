import Foundation

public enum ChannelMessageSendWhatsappContent: Codable, Hashable, Sendable {
    case buttons(ChannelMessageSendWhatsappContentButtons)
    case media(ChannelMessageSendWhatsappContentMedia)
    case template(ChannelMessageSendWhatsappContentTemplate)
    case text(ChannelMessageSendWhatsappContentText)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "buttons":
            self = .buttons(try ChannelMessageSendWhatsappContentButtons(from: decoder))
        case "media":
            self = .media(try ChannelMessageSendWhatsappContentMedia(from: decoder))
        case "template":
            self = .template(try ChannelMessageSendWhatsappContentTemplate(from: decoder))
        case "text":
            self = .text(try ChannelMessageSendWhatsappContentText(from: decoder))
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
        case .buttons(let data):
            try container.encode("buttons", forKey: .type)
            try data.encode(to: encoder)
        case .media(let data):
            try container.encode("media", forKey: .type)
            try data.encode(to: encoder)
        case .template(let data):
            try container.encode("template", forKey: .type)
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