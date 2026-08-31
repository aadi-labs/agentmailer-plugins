import Foundation

public enum A2ATaskStatusMessageRole: String, Codable, Hashable, CaseIterable, Sendable {
    case roleUser = "ROLE_USER"
    case roleAgent = "ROLE_AGENT"
}