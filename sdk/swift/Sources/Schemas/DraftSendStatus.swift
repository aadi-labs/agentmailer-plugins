import Foundation

public enum DraftSendStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case sending
    case failed
}