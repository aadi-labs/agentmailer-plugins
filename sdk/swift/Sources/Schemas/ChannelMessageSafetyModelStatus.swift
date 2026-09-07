import Foundation

public enum ChannelMessageSafetyModelStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notConfigured = "not_configured"
    case skipped
    case completed
    case unavailable
}