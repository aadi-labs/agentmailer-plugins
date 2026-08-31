import Foundation

public enum InboxStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case provisioning
    case active
    case failed
}