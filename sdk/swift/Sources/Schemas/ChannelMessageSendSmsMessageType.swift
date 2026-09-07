import Foundation

public enum ChannelMessageSendSmsMessageType: String, Codable, Hashable, CaseIterable, Sendable {
    case transactional
    case promotional
}