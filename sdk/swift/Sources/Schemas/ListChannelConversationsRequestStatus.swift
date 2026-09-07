import Foundation

public enum ListChannelConversationsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
}