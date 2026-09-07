import Foundation

public enum ChannelMessageDirection: String, Codable, Hashable, CaseIterable, Sendable {
    case inbound
    case outbound
}