import Foundation

public enum ChannelMessageSendWhatsappContentMediaKind: String, Codable, Hashable, CaseIterable, Sendable {
    case image
    case video
    case audio
    case document
}