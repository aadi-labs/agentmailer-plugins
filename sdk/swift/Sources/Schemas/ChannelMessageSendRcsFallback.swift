import Foundation

public enum ChannelMessageSendRcsFallback: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case sms
}