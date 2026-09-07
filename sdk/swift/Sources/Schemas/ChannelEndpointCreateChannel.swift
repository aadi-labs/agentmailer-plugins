import Foundation

public enum ChannelEndpointCreateChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case sms
    case mms
    case rcs
    case whatsapp
    case voice
}