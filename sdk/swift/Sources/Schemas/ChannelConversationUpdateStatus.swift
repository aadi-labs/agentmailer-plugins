import Foundation

public enum ChannelConversationUpdateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
}