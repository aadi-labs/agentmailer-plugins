import Foundation

public enum ListChannelMessagesRequestChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case sms
    case mms
    case rcs
    case whatsapp
    case voice
}