import Foundation

public enum DomainStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case verified
    case failed
}