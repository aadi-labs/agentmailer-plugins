import Foundation

public enum ListKind: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case block
}