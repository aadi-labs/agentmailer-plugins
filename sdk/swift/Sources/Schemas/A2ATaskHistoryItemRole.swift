import Foundation

public enum A2ATaskHistoryItemRole: String, Codable, Hashable, CaseIterable, Sendable {
    case roleUser = "ROLE_USER"
    case roleAgent = "ROLE_AGENT"
}