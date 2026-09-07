import Foundation

public enum ListChannelRecipientPermissionsRequestChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case sms
    case mms
    case rcs
    case whatsapp
    case voice
}