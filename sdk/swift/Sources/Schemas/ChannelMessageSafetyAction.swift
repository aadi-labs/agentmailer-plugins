import Foundation

public enum ChannelMessageSafetyAction: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case hold
}