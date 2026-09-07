import Foundation

public enum ChannelConversationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
}