import Foundation

public enum ChannelConversationChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case sms
    case mms
    case rcs
    case whatsapp
    case voice
}