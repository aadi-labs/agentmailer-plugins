import Foundation

public enum ChannelMessageSend: Codable, Hashable, Sendable {
    case mms(ChannelMessageSendMms)
    case rcs(ChannelMessageSendRcs)
    case sms(ChannelMessageSendSms)
    case voice(ChannelMessageSendVoice)
    case whatsapp(ChannelMessageSendWhatsapp)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .channel)
        switch discriminant {
        case "mms":
            self = .mms(try ChannelMessageSendMms(from: decoder))
        case "rcs":
            self = .rcs(try ChannelMessageSendRcs(from: decoder))
        case "sms":
            self = .sms(try ChannelMessageSendSms(from: decoder))
        case "voice":
            self = .voice(try ChannelMessageSendVoice(from: decoder))
        case "whatsapp":
            self = .whatsapp(try ChannelMessageSendWhatsapp(from: decoder))
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
        case .mms(let data):
            try container.encode("mms", forKey: .channel)
            try data.encode(to: encoder)
        case .rcs(let data):
            try container.encode("rcs", forKey: .channel)
            try data.encode(to: encoder)
        case .sms(let data):
            try container.encode("sms", forKey: .channel)
            try data.encode(to: encoder)
        case .voice(let data):
            try container.encode("voice", forKey: .channel)
            try data.encode(to: encoder)
        case .whatsapp(let data):
            try container.encode("whatsapp", forKey: .channel)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case channel
    }
}