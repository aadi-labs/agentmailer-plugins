import Foundation

public enum ChannelMessageSafetyRisk: String, Codable, Hashable, CaseIterable, Sendable {
    case low
    case medium
    case high
    case unknown
}