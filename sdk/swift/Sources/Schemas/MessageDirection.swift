import Foundation

public enum MessageDirection: String, Codable, Hashable, CaseIterable, Sendable {
    case inbound
    case outbound
}